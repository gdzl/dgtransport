package com.paxonpilot.dgtransport.view;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.service.DictionaryServiceImpl;
import com.paxonpilot.dgtransport.util.AppContant;
import com.paxonpilot.dgtransport.util.StringUtil;

public class EnterpriseExcelView extends AbstractXlsView{
	
	@Autowired
	private DictionaryServiceImpl dictionaryService;

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.addHeader("Content-Disposition","attachment;filename="+new String("企业信息".getBytes(),"iso8859-1")+".xls");
		Object[] params = new Object[]{1};
		List<Dictionary> diclist = dictionaryService.getByMap(params);
		Map<Integer,String> map =  new HashMap<Integer,String>();
		for(Dictionary dic : diclist){
			map.put(Integer.valueOf(dic.getId().toString()), dic.getDictionaryName());
		}
		Sheet sheet = workbook.createSheet("企业信息");
		Row header = sheet.createRow(0);
		Cell epNoCell = header.createCell(0);
		Cell epNameCell = header.createCell(1);
		Cell addressCell = header.createCell(2);
		Cell scopeNoCell = header.createCell(3);
		Cell tpLicenceCell = header.createCell(4);
		Cell icLicenceCell = header.createCell(5);
		Cell corporationCell = header.createCell(6);
		Cell corcontactCell = header.createCell(7);
		Cell businessorCell = header.createCell(8);
		Cell contactCell = header.createCell(9);
		Cell cityNoCell = header.createCell(10);
		Cell epStateCell = header.createCell(11);
		epNoCell.setCellValue("编号");
		epNameCell.setCellValue("业户名称");
		addressCell.setCellValue("经营地址");
		scopeNoCell.setCellValue("经营范围");
		tpLicenceCell.setCellValue("道路运输经营许可证号");
		icLicenceCell.setCellValue("工商营业执照号");
		corporationCell.setCellValue("法定代表人");
		corcontactCell.setCellValue("法定代表人联系方式");
		businessorCell.setCellValue("业务联系人");
		contactCell.setCellValue("业务联系人联系方式");
		cityNoCell.setCellValue("所属镇街");
		epStateCell.setCellValue("企业状态");
		
		
		Map<String,Long> map2 = AppContant.STREETNO;
		Set<Entry<String,Long>> set = map2.entrySet();
		
		int cellIndex = 1;
		String task = model.get("task")==null?"":model.get("task").toString();
		if(task==null||task.equals("")){
			
			List<Enterprise> list = (List<Enterprise>)model.get("list");
			for(Enterprise enterprise :list){
				Iterator<Entry<String,Long>> itor = set.iterator();
				Row row = sheet.createRow(cellIndex);
				row.createCell(0).setCellValue(StringUtil.stringisNull(enterprise.getEpNo()));
				row.createCell(1).setCellValue(StringUtil.stringisNull(enterprise.getEpName()));
				row.createCell(2).setCellValue(StringUtil.stringisNull(enterprise.getAddress()));
				row.createCell(3).setCellValue(enterprise.getScopeName());
				row.createCell(4).setCellValue(StringUtil.stringisNull(enterprise.getTpLicence()));
				row.createCell(5).setCellValue(StringUtil.stringisNull(enterprise.getIcLicence()));
				row.createCell(6).setCellValue(StringUtil.stringisNull(enterprise.getCorporation()));
				row.createCell(7).setCellValue(StringUtil.stringisNull(enterprise.getCorcontact()));
				row.createCell(8).setCellValue(StringUtil.stringisNull(enterprise.getBusinessor()));
				row.createCell(9).setCellValue(StringUtil.stringisNull(enterprise.getContact()));
				while(itor.hasNext()){
					Entry<String,Long> entry = itor.next();
					if(entry.getValue()==enterprise.getCityNo()){
						row.createCell(10).setCellValue(entry.getKey());
						break;
					}else{
						row.createCell(10).setCellValue("");
					}
				}
				row.createCell(11).setCellValue(map.get(enterprise.getEpState()));
				cellIndex++;
			}
		}else{
			
			List<Object[]> list = (List<Object[]>)model.get("list");
			for(Object[] enterprise :list){
				Iterator<Entry<String,Long>> itor = set.iterator();
				Row row = sheet.createRow(cellIndex);
				row.createCell(0).setCellValue(StringUtil.stringisNull(enterprise[0]==null?"":enterprise[0].toString()));
				row.createCell(1).setCellValue(StringUtil.stringisNull(enterprise[1]==null?"":enterprise[1].toString()));
				row.createCell(2).setCellValue(StringUtil.stringisNull(enterprise[2]==null?"":enterprise[2].toString()));
				row.createCell(3).setCellValue(enterprise[3]==null?"":enterprise[3].toString());
				row.createCell(4).setCellValue(StringUtil.stringisNull(enterprise[4]==null?"":enterprise[4].toString()));
				row.createCell(5).setCellValue(StringUtil.stringisNull(enterprise[5]==null?"":enterprise[5].toString()));
				row.createCell(6).setCellValue(StringUtil.stringisNull(enterprise[6]==null?"":enterprise[6].toString()));
				row.createCell(7).setCellValue(StringUtil.stringisNull(enterprise[7]==null?"":enterprise[7].toString()));
				row.createCell(8).setCellValue(StringUtil.stringisNull(enterprise[8]==null?"":enterprise[8].toString()));
				row.createCell(9).setCellValue(StringUtil.stringisNull(enterprise[9]==null?"":enterprise[9].toString()));
				while(itor.hasNext()){
					Entry<String,Long> entry = itor.next();
					if(entry.getValue()==Long.valueOf(enterprise[10]==null?"":enterprise[10].toString())){
						row.createCell(10).setCellValue(entry.getKey());
						break;
					}else{
						row.createCell(10).setCellValue("");
					}
				}
				row.createCell(11).setCellValue(map.get(Integer.valueOf(enterprise[11]==null?"":enterprise[11].toString())));
				cellIndex++;
			}
		}
	}

	public DictionaryServiceImpl getDictionaryService() {
		return dictionaryService;
	}

	public void setDictionaryService(DictionaryServiceImpl dictionaryService) {
		this.dictionaryService = dictionaryService;
	}


}
