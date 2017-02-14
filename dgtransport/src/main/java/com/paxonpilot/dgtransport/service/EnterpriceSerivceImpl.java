package com.paxonpilot.dgtransport.service;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.paxonpilot.dgtransport.dao.AnnexDetailDao;
import com.paxonpilot.dgtransport.dao.EnterpriceDao;
import com.paxonpilot.dgtransport.entity.AnnexDetail;
import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.util.Page;

@Service("enterpriceSerivce")
public class EnterpriceSerivceImpl implements BaseService<Enterprise> {

	@Autowired
	public EnterpriceDao enterpriceDao;
	
	@Autowired
	public AnnexDetailDao annexDetailDao;

	/**
	 * 通过企业的epNo获取企业名称
	 * @param epNo
	 * @return
	 */
	public String getUinoEpName(Long epNo){
		return enterpriceDao.getUinoEpName(epNo);
	}
	
	public Page getByEntity(Enterprise enterprise,Integer pageSize,Integer startIndex) {
		Page page = enterpriceDao.findByEntity(enterprise,pageSize,startIndex);
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		List<Enterprise> list = page.getDatas();
		int idx = 1;
		for(Enterprise enterprises: list){
			Map<String,Object> valueMap = new HashMap<String,Object>();
			valueMap.put("epName", enterprises.getEpName());
			valueMap.put("address", enterprises.getAddress());
			valueMap.put("scopeName", enterprises.getScopeName());
			valueMap.put("cityNo",enterprises.getCityNo());
			valueMap.put("epState", enterprises.getEpState());
			valueMap.put("checkbox", enterprises.getId());
			valueMap.put("idx", idx);
			valueMap.put("show", enterprises);
			valueMap.put("upd", enterprises.getId());
			mapList.add(valueMap);
			idx++;
		}
		page.setDatas(mapList);
		return page;
	}
	
	public Page getEntityBySql(Integer taskState,String taskName,Integer pageSize,Integer startIndex) {
		Page page = enterpriceDao.findEntityBySql(taskState,taskName,pageSize,startIndex);
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		List<Object[]> list = page.getDatas();
		int idx = 1;
		for(Object[] str : list){
			Map<String,Object> valueMap = new HashMap<String,Object>();
			valueMap.put("idx", idx);
			valueMap.put("checkbox", str[0]);
			valueMap.put("upd", str[0]);
			valueMap.put("show", str[0]);
			valueMap.put("epName", str[1]);
			valueMap.put("address", str[2]);
			valueMap.put("scopeName", str[3]);
			valueMap.put("cityNo", str[4]);
			valueMap.put("epState", str[5]);
			mapList.add(valueMap);
			idx++;
		}
		page.setDatas(mapList);
		return page;
	}
	
	public List getEntityBySql(Integer taskState,String taskName,String ids) {
		List mapList = enterpriceDao.findEntityBySql(taskState,taskName,ids);
		return mapList;
	}
	
	public List<Enterprise> getByIds(String epName,String tpLicence,Long cityNo,Integer epState
			,Object[] params) throws Exception {
		StringBuffer hql = null;
		Object[] objParam  = null;
		List<Object> list = new ArrayList<Object>();
		String str = "";
		if(params!=null&&params.length>=1){
			String sqlStr = "";
			hql = new StringBuffer(" from enterprise where id in (");
			for(int i=0;i<params.length;i++){
				list.add(Long.parseLong(params[i].toString()));
				hql.append("?,");
			}
			sqlStr = hql.substring(0, hql.length()-1)+")";
			hql.setLength(0);
			hql.append(sqlStr);
		}else{
			hql = new StringBuffer(" from enterprise where 1=1 ");
		}
		if(epName!=null&&!epName.equals("")){
			if(hql==null){
				hql = new StringBuffer(" from enterprise where 1=1 and epName like ? ");
			}else{
				hql.append(" and epName like ? ");
			}
			list.add("%"+new String(epName.getBytes("iso8859-1"),"UTF-8")+"%");
		}
		if(tpLicence!=null&&!tpLicence.equals("")){
			if(hql==null){
				hql = new StringBuffer(" from enterprise where 1=1 and tpLicence like ? ");
			}else{
				hql.append(" and tpLicence like ? ");
			}
			list.add("%"+tpLicence+"%");
		}
		if(cityNo!=null&&!cityNo.equals(0L)){
			if(hql==null){
				hql = new StringBuffer(" from enterprise where 1=1 and cityNo=? ");
			}else{
				hql.append(" and cityNo=? ");
			}
			list.add(cityNo);
		} 
		if(!epState.equals(0)){
			if(hql==null){
				hql = new StringBuffer(" from enterprise where 1=1 and epState=? ");
			}else{
				hql.append(" and epState=? ");
			}
			list.add(epState);
		}
		if(list.size()>0){
			objParam = new Object[list.size()];
			int idx = 0;
			for(Object condObj : list){
				objParam[idx] = condObj;
				idx++;
			}
		}
		str += hql.toString();
		List<Enterprise> enterList = enterpriceDao.findListByMap(str, objParam);
		return enterList;
	}
	
	public void uploadLicene(Map<String,Object> map){
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) map.get("multiRequest");
		String path = (String) map.get("path");
		Long entityId = Long.valueOf((String)map.get("entityId"));
		String tpDeadLine = (String)map.get("tpDeadLine");//道路运输经营许可证
		String icDeadLine = (String)map.get("icDeadLine");//工商营业执照
		String saveDeadLine = (String)map.get("saveDeadLine");//安全生产管理制度
		String emergencyDeadLine = (String)map.get("emergencyDeadLine");//安全应急制度
		
        String fileName = null;
        String fname = null;
        List<AnnexDetail> detailList = new ArrayList<AnnexDetail>();
        List<String> upList = new ArrayList<String>();
        
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdf.format(date);
        
        //取得request中的所有文件名  
        Iterator<String> iter = multiRequest.getFileNames(); 
        while(iter.hasNext()){
        	AnnexDetail detail = new AnnexDetail();
        	MultipartFile file = multiRequest.getFile(iter.next()); 
        	fileName = file.getOriginalFilename();
        	fname = file.getName();
			//防止上传文件同名被覆盖
			Long prix = System.currentTimeMillis();
			String prixname = prix.toString();

			String[] nameArr = fileName.split("\\.");
        	String name = nameArr[0];
        	String upPath = path+"/";
        	String savePath = "/upload/";
        	String upStr ="";
        	try {
        		
        		detail.setUploadTime(date);
        		
        		detail.setEntityId(entityId);
        		detail.setEntityType(1);
        		if(fname.equals("tpLicenceFile")){//道路运输经营许可证
        			detail.setFileName("道路运输经营许可证");
        			detail.setUploadType(1);
        			
        			detail.setDeadLine(sdf.parse(tpDeadLine));

        			upPath +="daolu/"+entityId+"/"+dateStr+"/daolu"+prixname+"."+nameArr[1];
        			
        			savePath +="daolu/"+entityId+"/"+dateStr+"/daolu"+prixname+"."+nameArr[1];
        			
        		}else if(fname.equals("icLicenceFile")){
        			detail.setFileName("工商营业执照");
        			detail.setUploadType(2);
        			
        			if(icDeadLine==null||"".equals(icDeadLine)){
        				detail.setDeadLine(null);
        			}else{
        				detail.setDeadLine(sdf.parse(icDeadLine));	
        			};
        			upPath +="gongshang/"+entityId+"/"+dateStr+"/gongshang"+prixname+"."+nameArr[1];
        			savePath +="gongshang/"+entityId+"/"+dateStr+"/gongshang"+prixname+"."+nameArr[1];
        		}else if(fname.equals("saveLicence")){
        			detail.setFileName("安全生产管理制度");
        			detail.setUploadType(3);
        			
        			if(saveDeadLine==null||"".equals(saveDeadLine)){
        				detail.setDeadLine(null);
        			}else{
        				detail.setDeadLine(sdf.parse(saveDeadLine));	
        			};
        			upPath +="anquanshengchan/"+entityId+"/"+dateStr+"/anquanshengchan"+prixname+"."+nameArr[1];
        			savePath +="anquanshengchan/"+entityId+"/"+dateStr+"/anquanshengchan"+prixname+"."+nameArr[1];
        		}else if(fname.equals("emergencyLicence")){
        			detail.setFileName("安全应急制度");
        			detail.setUploadType(4);
        			
        			if(emergencyDeadLine==null||"".equals(emergencyDeadLine)){
        				detail.setDeadLine(null);
        			}else{
        				detail.setDeadLine(sdf.parse(emergencyDeadLine));	
        			};
        			
        			upPath +="anquanyingji/"+entityId+"/"+dateStr+"/anquanyingji"+prixname+"."+nameArr[1];
        			savePath +="anquanyingji/"+entityId+"/"+dateStr+"/anquanyingji"+prixname+"."+nameArr[1];
        		}
        		detail.setFileUrl(savePath);
        		detailList.add(detail);
        		upStr = name+"-"+entityId+"-"+"1";
        		
        		upList.add(upStr);
        		File uploadFile = new File(upPath);
        		
        		if(!uploadFile.exists()){
        			uploadFile.mkdirs();
        		}
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
        }
        for(AnnexDetail details : detailList){
    		try {
				annexDetailDao.save(details);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
        enterpriceDao.batchUpd(upList);
	}
	
	public void uploadRecord(Map<String,Object> map){
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) map.get("multiRequest");
		String path = (String) map.get("path");
		Long entityId = Long.valueOf((String)map.get("regulateObjId"));
        Iterator<String> iter = multiRequest.getFileNames(); 
        String fileName = null;
        String fname = null;
        List<AnnexDetail> detailList = new ArrayList<AnnexDetail>();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdf.format(date);
        while(iter.hasNext()){
        	AnnexDetail detail = new AnnexDetail();
        	MultipartFile file = multiRequest.getFile(iter.next()); 
        	fileName = file.getOriginalFilename();
        	fname = file.getName();
			//防止上传文件同名被覆盖
			Long prix = System.currentTimeMillis();
			String prixname = prix.toString();

			String[] nameArr = fileName.split("\\.");
        	String name = nameArr[0];
        	String upPath = path+"/";
        	String savePath = "/upload/";
        	try {
        		
        		detail.setUploadTime(date);
        		detail.setEntityId(entityId);
        		detail.setEntityType(1);
        		if(fname.equals("recorder")){
        			detail.setFileName("月度安全生产演练记录");
        			detail.setUploadType(5);
        			upPath +="yueyanlianjilu/"+entityId+"/"+dateStr+"/yueyanlianjilu"+prixname+"."+nameArr[1];
        			savePath +="yueyanlianjilu/"+entityId+"/"+dateStr+"/yueyanlianjilu"+prixname+"."+nameArr[1];
        		}else if(fname.equals("monthXCRecorder")){
        			detail.setFileName("月度安全生产巡查记录");
        			detail.setUploadType(6);
        			upPath +="yuexunchajilu/"+entityId+"/"+dateStr+"/yuexunchajilu"+prixname+"."+nameArr[1];
        			savePath +="yuexunchajilu/"+entityId+"/"+dateStr+"/yuexunchajilu"+prixname+"."+nameArr[1];
        		}else if(fname.equals("seasonRecorder")){
        			detail.setFileName("季度安全生产巡查记录");
        			detail.setUploadType(7);
        			upPath +="jixunchajilu/"+entityId+"/"+dateStr+"/jixunchajilu"+prixname+"."+nameArr[1];
        			savePath +="jixunchajilu/"+entityId+"/"+dateStr+"/jixunchajilu"+prixname+"."+nameArr[1];
        		}
        		detail.setFileUrl(savePath);
        		detailList.add(detail);
        		File uploadFile = new File(upPath);
        		if(!uploadFile.exists()){
        			uploadFile.mkdirs();
        		}
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
        for(AnnexDetail details : detailList){
    		try {
				annexDetailDao.save(details);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
	}
	
	public void uploadCarInfo(Map<String,Object> map){
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) map.get("multiRequest");
		String path = (String) map.get("path");
		Long entityId = Long.valueOf((String)map.get("entityId"));
		String tranlicenceDate = (String)map.get("tranlicenceDate");
		String carlicenceDate = (String)map.get("carlicenceDate");
		String carRegDate = (String)map.get("carRegDate");
		String insuranceDate = (String)map.get("insuranceDate");
		String environTagDate = (String)map.get("environTagDate");
		String GPSDate = (String)map.get("GPSDate");
		String GPSInstallDate = (String)map.get("GPSInstallDate");
		String specialReportDate = (String)map.get("specialReportDate");
		String oilCastListDate = (String)map.get("oilCastListDate");
        Iterator<String> iter = multiRequest.getFileNames(); 
        String fileName = null;
        String fname = null;
        List<AnnexDetail> detailList = new ArrayList<AnnexDetail>();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdf.format(date);

        while(iter.hasNext()){
        	AnnexDetail detail = new AnnexDetail();
        	MultipartFile file = multiRequest.getFile(iter.next()); 
        	fileName = file.getOriginalFilename();
        	fname = file.getName();
			//防止上传文件同名被覆盖
			Long prix = System.currentTimeMillis();
			String prixname = prix.toString();

        	String[] nameArr = fileName.split("\\.");
        	String name = nameArr[0];
        	String upPath = path+"/";
        	String savePath = "/upload/";
        	try {
        		
        		detail.setUploadTime(date);
        		detail.setEntityId(entityId);
        		detail.setEntityType(2);
        		if(fname.equals("tranLicence")){
        			detail.setFileName("道路运输证");
        			detail.setUploadType(8);
        			
        			if(tranlicenceDate==null||"".equals(tranlicenceDate)){
        				detail.setDeadLine(null);
        			}else{
        				detail.setDeadLine(sdf.parse(tranlicenceDate));
        			}
        			
        			upPath +="daoluyunshu/"+entityId+"/"+dateStr+"/daoluyunshu"+prixname+"."+nameArr[1];
        			savePath +="daoluyunshu/"+entityId+"/"+dateStr+"/daoluyunshu"+prixname+"."+nameArr[1];
        		}else if(fname.equals("carLicence")){
        			detail.setFileName("机动车行驶证");
        			detail.setUploadType(9);
        			detail.setDeadLine(sdf.parse(carlicenceDate));
        			upPath +="xingshizheng/"+entityId+"/"+dateStr+"/xingshizheng"+prixname+"."+nameArr[1];
        			savePath +="xingshizheng/"+entityId+"/"+dateStr+"/xingshizheng"+prixname+"."+nameArr[1];
        		}else if(fname.equals("carRegLicence")){
        			detail.setFileName("机动车登记证书");
        			detail.setUploadType(10);
        			
        			if(carRegDate==null||"".equals(carRegDate)){
        				detail.setDeadLine(null);
        			}else{
        				detail.setDeadLine(sdf.parse(carRegDate));
        			};
        			
        			upPath +="dengjizheng/"+entityId+"/"+dateStr+"/dengjizheng"+prixname+"."+nameArr[1];
        			savePath +="dengjizheng/"+entityId+"/"+dateStr+"/dengjizheng"+prixname+"."+nameArr[1];
        		}else if(fname.equals("insurance")){
        			detail.setFileName("承运人责任险");
        			detail.setUploadType(11);
        			detail.setDeadLine(sdf.parse(insuranceDate));
        			upPath +="zerenxian/"+entityId+"/"+dateStr+"/zerenxian"+prixname+"."+nameArr[1];
        			savePath +="zerenxian/"+entityId+"/"+dateStr+"/zerenxian"+prixname+"."+nameArr[1];
        		}else if(fname.equals("environmentTag")){
        			detail.setFileName("环保标志");
        			detail.setUploadType(12);
        			detail.setDeadLine(sdf.parse(environTagDate));
        			upPath +="huanbaoTag/"+entityId+"/"+dateStr+"/huanbaoTag"+prixname+"."+nameArr[1];
        			savePath +="huanbaoTag/"+entityId+"/"+dateStr+"/huanbaoTag"+prixname+"."+nameArr[1];
        		}else if(fname.equals("GPS")){
        			detail.setFileName("GPS接入证明");
        			detail.setUploadType(13);

        			if(GPSDate==null||"".equals(GPSDate)){
        				detail.setDeadLine(null);
        			}else{
        				detail.setDeadLine(sdf.parse(GPSDate));
        			}
        			
        			upPath +="GPS/"+entityId+"/"+dateStr+"/GPS"+prixname+"."+nameArr[1];
        			savePath +="GPS/"+entityId+"/"+dateStr+"/GPS"+prixname+"."+nameArr[1];
        		}else if(fname.equals("GPSInstall")){
					detail.setFileName("GPS安装证明");
					detail.setUploadType(18);

					if(GPSInstallDate==null||"".equals(GPSInstallDate)){
						detail.setDeadLine(null);
					}else{
						detail.setDeadLine(sdf.parse(GPSInstallDate));
					}

					upPath +="GPSInstall/"+entityId+"/"+dateStr+"/GPSInstall"+prixname+"."+nameArr[1];
					savePath +="GPSInstall/"+entityId+"/"+dateStr+"/GPSInstall"+prixname+"."+nameArr[1];
				}else if(fname.equals("specialReport")){
					detail.setFileName("专项检测报告");
					detail.setUploadType(19);

					if(specialReportDate==null||"".equals(specialReportDate)){
						detail.setDeadLine(null);
					}else{
						detail.setDeadLine(sdf.parse(specialReportDate));
					}

					upPath +="specialReport/"+entityId+"/"+dateStr+"/specialReport"+prixname+"."+nameArr[1];
					savePath +="specialReport/"+entityId+"/"+dateStr+"/specialReport"+prixname+"."+nameArr[1];
				}else if(fname.equals("oilCastList")){
					detail.setFileName("燃油消耗表");
					detail.setUploadType(20);

					if(oilCastListDate==null||"".equals(oilCastListDate)){
						detail.setDeadLine(null);
					}else{
						detail.setDeadLine(sdf.parse(oilCastListDate));
					}

					upPath +="oilCastList/"+entityId+"/"+dateStr+"/oilCastList"+prixname+"."+nameArr[1];
					savePath +="oilCastList/"+entityId+"/"+dateStr+"/oilCastList"+prixname+"."+nameArr[1];
				}

        		
        		detail.setFileUrl(savePath);
        		detailList.add(detail);
        		File uploadFile = new File(upPath);
        		if(!uploadFile.exists()){
        			uploadFile.mkdirs();
        		}
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
        }
        for(AnnexDetail details : detailList){
    		try {
				annexDetailDao.save(details);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
	}
	
	public void uploadEmpInfo(Map<String,Object> map){
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) map.get("multiRequest");
		String path = (String) map.get("path");
		Long entityId = Long.valueOf((String)map.get("entityId"));
		String identityDate = (String)map.get("identityDate");
		String certificateDate = (String)map.get("certificateDate");
		String driverDate = (String)map.get("driverDate");
		String contractDate = (String)map.get("contractDate");
        Iterator<String> iter = multiRequest.getFileNames(); 
        String fileName = null;
        String fname = null;
        List<AnnexDetail> detailList = new ArrayList<AnnexDetail>();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdf.format(date);
        while(iter.hasNext()){
        	AnnexDetail detail = new AnnexDetail();
        	MultipartFile file = multiRequest.getFile(iter.next());
        	fname = file.getName();
        	fileName = file.getOriginalFilename();
			//防止上传文件同名被覆盖
			Long prix = System.currentTimeMillis();
			String prixname = prix.toString();

        	String[] nameArr = fileName.split("\\.");
        	String name = nameArr[0];
        	String upPath = path+"/";
        	String savePath = "/upload/";
        	try {
        		detail.setUploadTime(date);
        		detail.setEntityId(entityId);
        		detail.setEntityType(3);
        		if(fname.equals("identity")){
        			detail.setFileName("身份证");
        			detail.setUploadType(14);

        			if(identityDate==null||"".equals(identityDate)){
        				detail.setDeadLine(null);
        			}else{
        				detail.setDeadLine(sdf.parse(identityDate));
        			}
        			
        			upPath +="shenfenzheng/"+entityId+"/"+dateStr+"/shenfenzheng"+prixname+"."+nameArr[1];
        			savePath +="shenfenzheng/"+entityId+"/"+dateStr+"/shenfenzheng"+prixname+"."+nameArr[1];
        		}else if(fname.equals("certificateNo")){
        			detail.setFileName("从业资格证");
        			detail.setUploadType(15);
        			detail.setDeadLine(sdf.parse(certificateDate));
        			upPath +="congyezheng/"+entityId+"/"+dateStr+"/congyezheng"+prixname+"."+nameArr[1];
        			savePath +="congyezheng/"+entityId+"/"+dateStr+"/congyezheng"+prixname+"."+nameArr[1];
        		}else if(fname.equals("driverLincene")){
        			detail.setFileName("驾驶证");
        			detail.setUploadType(16);
        			detail.setDeadLine(sdf.parse(driverDate));
        			upPath +="jiashizheng/"+entityId+"/"+dateStr+"/jiashizheng"+prixname+"."+nameArr[1];
        			savePath +="jiashizheng/"+entityId+"/"+dateStr+"/jiashizheng"+prixname+"."+nameArr[1];
        		}else if(fname.equals("contract")){
        			detail.setFileName("劳动合同");
        			detail.setUploadType(17);
        			
        			if(contractDate==null||"".equals(contractDate)){
        				detail.setDeadLine(null);
        			}else{
        				detail.setDeadLine(sdf.parse(contractDate));
        			}
        			
        			upPath +="laodonghetong/"+entityId+"/"+dateStr+"/laodonghetong"+prixname+"."+nameArr[1];
        			savePath +="laodonghetong/"+entityId+"/"+dateStr+"/laodonghetong"+prixname+"."+nameArr[1];
        		}
        		
        		detail.setFileUrl(savePath);
        		detailList.add(detail);
        		File uploadFile = new File(upPath);
        		if(!uploadFile.exists()){
        			uploadFile.mkdirs();
        		}
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
        }
        for(AnnexDetail details : detailList){
    		try {
				annexDetailDao.save(details);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
	}
	
	public List<AnnexDetail> getEpUploadInfo(Map<String,Object> map){
		StringBuffer hql = new StringBuffer();
		hql.append("from annexdetail where entityId=? and uploadType=? and isValidity is null");
		Object[] params = new Object[]{map.get("entityId"),map.get("typeId")};
		List<AnnexDetail> list = annexDetailDao.findListByMap(hql.toString(), params);
		return list;
	}
	
	public List<Enterprise> getEpName(){
		StringBuffer hql = new StringBuffer();
		hql.append(" select ep.id,ep.epName from enterprise ep");
		return enterpriceDao.findListByMap(hql.toString(), new Object[]{});
	}
	
	public AnnexDetail getAnnexDetail(Map<String,Object> map){
		Long id = Long.parseLong((String)map.get("id"));
		AnnexDetail annex = annexDetailDao.findById(id);
		return annex;
	}
	
	public List<Enterprise> getAll() {
		return null;
	}

	public List<Enterprise> getByMap(Object[] params) {
		return null;
	}
	
	public void batchSave(List<Enterprise> epList) throws Exception{
		for(Enterprise ep :epList){
			enterpriceDao.save(ep);
		}
	}

	public void addEntity(Enterprise entity) throws Exception{
		enterpriceDao.save(entity);
	}
	
	public void deleteEntity(Enterprise entity) {
		
	}
	
	public void delEntitys(String ids) throws Exception{
		
		enterpriceDao.delEntitys(ids);
	}

	public Enterprise getById(Serializable id) {
		return enterpriceDao.findById(id);
	}

	public void updateEntity(Enterprise entity) {
		enterpriceDao.update(entity);
	}

	

	public EnterpriceDao getEnterpriceDao() {
		return enterpriceDao;
	}

	public void setEnterpriceDao(EnterpriceDao enterpriceDao) {
		this.enterpriceDao = enterpriceDao;
	}

	public AnnexDetailDao getAnnexDetailDao() {
		return annexDetailDao;
	}

	public void setAnnexDetailDao(AnnexDetailDao annexDetailDao) {
		this.annexDetailDao = annexDetailDao;
	}

}
