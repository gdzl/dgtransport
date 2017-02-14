package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxonpilot.dgtransport.dao.EmployeeDao;
import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.Employee;
import com.paxonpilot.dgtransport.util.Page;

@Service("employeeSerivce")
public class EmployeeSerivceImpl implements BaseService<Employee> {

	@Autowired
	private EmployeeDao employeeDao;
	
	public Page getByEntity(Employee employee,Integer pageSize,Integer startIndex,Integer cityNo) {
		Page page = employeeDao.findByEntity(employee,pageSize,startIndex,cityNo);
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		List list = page.getDatas();
		for(int i=0;i<list.size();i++){
			Object[] arr = (Object[]) list.get(i);
			Map<String,Object> valueMap = new HashMap<String,Object>();
			valueMap.put("name", arr[0]);
			valueMap.put("properties", arr[1]);
			valueMap.put("identityNo", arr[2]);
			valueMap.put("phone",arr[3]);
			valueMap.put("provinceNo", arr[4]);
			valueMap.put("cityNo", arr[5]);
			valueMap.put("checkbox", arr[6]);
			valueMap.put("upd", arr[6]);
			valueMap.put("street", arr[7]);
			valueMap.put("idx", i+1);
			valueMap.put("show", arr);
			mapList.add(valueMap);
		}
		page.setDatas(mapList);
		return page;
	}
	
	public List<String> getByIds(String name,String epName,String identityNo,Long cityNo,
			Integer empState,Object[] params) throws Exception {
		StringBuffer hql = null;
		Object[] objParam  = null;
		String str = "";
		List<Object> list = new ArrayList<Object>();
		if(params!=null&&params.length>=1){
			String sqlStr = "";
			hql = new StringBuffer();
			hql.append(" select employee.name,employee.properties,employee.identityNo ")
				.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
				.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
				.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
				.append(" ,employee.checkinDate,employee.empState ")
			    .append(" from employee left join enterprise ")
			    .append(" on employee.epNo=enterprise.id where employee.id in (");
			for(int i=0;i<params.length;i++){
				list.add(Long.parseLong(params[i].toString()));
				hql.append("?,");
			}
			sqlStr = hql.substring(0, hql.length()-1)+")";
			hql.setLength(0);
			hql.append(sqlStr);
		}else{
			hql = new StringBuffer();
			hql.append(" select employee.name,employee.properties,employee.identityNo ")
				.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
				.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
				.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
				.append(" ,employee.checkinDate,employee.empState ")
			    .append(" from employee left join enterprise ")
			    .append(" on employee.epNo=enterprise.id where 1=1 ");
		}
		if(name !=null&&!name.equals("")){
			if(hql==null){
				hql = new StringBuffer();
				hql.append(" select employee.name,employee.properties,employee.identityNo ")
				.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
				.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
				.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
				.append(" ,employee.checkinDate,employee.empState ")
			    .append(" from employee left join enterprise ")
			    .append(" on employee.epNo=enterprise.id where 1=1 and name like ? ");
			}else{
				hql.append(" and name like ? ");
			}
			list.add("%"+new String(name.getBytes("iso8859-1"),"UTF-8")+"%");
		}
		if(epName !=null&&!epName.equals("")){
			if(hql==null){
				hql = new StringBuffer();
				hql.append(" select employee.name,employee.properties,employee.identityNo ")
				.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
				.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
				.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
				.append(" ,employee.checkinDate,employee.empState ")
			    .append(" from employee left join enterprise ")
			    .append(" on employee.epNo=enterprise.id where 1=1 and enterprise.epName like ? ");
			}else{
				hql.append(" and enterprise.epName like ? ");
			}
			list.add("%"+new String(epName.getBytes("iso8859-1"),"UTF-8")+"%");
		}
		if(identityNo !=null&&!identityNo.equals("")){
			if(hql==null){
				hql = new StringBuffer();
				hql.append(" select employee.name,employee.properties,employee.identityNo ")
				.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
				.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
				.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
				.append(" ,employee.checkinDate,employee.empState ")
			    .append(" from employee left join enterprise ")
			    .append(" on employee.epNo=enterprise.id where 1=1 and identityNo like ? ");
			}else{
				hql.append(" and identityNo like ? ");
			}
			list.add("%"+identityNo+"%");
		}
		if(!cityNo.equals(0L)){
			if(hql==null){
				hql = new StringBuffer();
				hql.append(" select employee.name,employee.properties,employee.identityNo ")
				.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
				.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
				.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
				.append(" ,employee.checkinDate,employee.empState ")
			    .append(" from employee left join enterprise ")
			    .append(" on employee.epNo=enterprise.id where 1=1 and enterprise.cityNo=? ");
			}else{
				hql.append(" and enterprise.cityNo=? ");
			}
			list.add(cityNo);
		}
		if(!empState.equals(0)){
			if(hql==null){
				hql = new StringBuffer();
				hql.append(" select employee.name,employee.properties,employee.identityNo ")
				.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
				.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
				.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
				.append(" ,employee.checkinDate,employee.empState ")
			    .append(" from employee left join enterprise ")
			    .append(" on employee.epNo=enterprise.id where 1=1 and empState=? ");
			}else{
				hql.append(" and empState=? ");
			}
			list.add(empState);
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
		List<String> employeeList = employeeDao.findBySql(str, objParam);
		return employeeList;
	}
	
	public Map<String,Object> getEmployeeStreetById(Long id){
		StringBuffer hql = new StringBuffer();
		hql.append(" select employee.id,employee.certificateDate,employee.certificateNo ")
		   .append(" ,employee.checkinDate,employee.cityNo,employee.driveDate,employee.epName ")
		   .append(" ,employee.epNo,employee.identityNo,employee.name,employee.phone ")
		   .append(" ,employee.properties,employee.provinceNo,employee.empState,employee.carTypeName ")
		   .append(" ,employee.empTypeName,enterprise.cityNo as street from employee left join enterprise ")
		   .append(" on employee.epNo=enterprise.id where employee.id=? ");
		Object[] params = new Object[]{id};
		Map<String,Object> empMap = new HashMap<String,Object>();
		List list = employeeDao.findBySql(hql.toString(), params);
		Object[] objs =(Object[])list.get(0);
		empMap.put("id", objs[0]==null?"":objs[0]);
		empMap.put("certificateDate", objs[1]==null?"":objs[1]);
		empMap.put("certificateNo", objs[2]==null?"":objs[2]);
		empMap.put("checkinDate", objs[3]==null?"":objs[3]);
		empMap.put("cityNo", objs[4]==null?"":objs[4]);
		empMap.put("driveDate", objs[5]==null?"":objs[5]);
		empMap.put("epName", objs[6]==null?"":objs[6]);
		empMap.put("epNo", objs[7]==null?"":objs[7]);
		empMap.put("identityNo", objs[8]==null?"":objs[8]);
		empMap.put("name", objs[9]==null?"":objs[9]);
		empMap.put("phone", objs[10]==null?"":objs[10]);
		empMap.put("properties", objs[11]==null?"":objs[11]);
		empMap.put("provinceNo", objs[12]==null?"":objs[12]);
		empMap.put("empState", objs[13]==null?"":objs[13]);
		empMap.put("carTypeName", objs[14]==null?"":objs[14]);
		empMap.put("empTypeName", objs[15]==null?"":objs[15]);
		empMap.put("street", objs[16]==null?"":objs[16]);
		return empMap;
	}
	
	public List<String> getIdentityNo(){
		StringBuffer hql = new StringBuffer();
		hql.append("select identityNo from employee where 1=1 ");
		return employeeDao.findBySql(hql.toString(), new Object[]{});
	}
	
	public List getEntityBySql(Integer taskState,String taskName,String ids) {
		List mapList = employeeDao.findEntityBySql(taskState,taskName,ids);
		return mapList;
	}
	
	public Page getEntityBySql(Integer taskState,String taskName,Integer pageSize,Integer startIndex) {
		Page page = employeeDao.findEntityBySql(taskState,taskName,pageSize,startIndex);
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		List<Object[]> list = page.getDatas();
		int idx = 1;
		for(Object[] str : list){
			Map<String,Object> valueMap = new HashMap<String,Object>();
			valueMap.put("name", str[0]);
			valueMap.put("properties", str[1]);
			valueMap.put("identityNo", str[2]);
			valueMap.put("phone",str[3]);
			valueMap.put("provinceNo", str[4]);
			valueMap.put("cityNo", str[5]);
			valueMap.put("checkbox", str[6]);
			valueMap.put("upd", str[6]);
//			valueMap.put("street", str[7]);
			valueMap.put("idx", idx);
			mapList.add(valueMap);
			idx++;
		}
		page.setDatas(mapList);
		return page;
	}
	
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Employee> getByMap(Object[] params) {
		return null;
	}
	
	public boolean validateNo(Object[] params) {
		StringBuffer hql = new StringBuffer();
		hql.append("select id from employee where identityNo=?");
		List list = employeeDao.findListByMap(hql.toString(), params);
		if(list.size()>0){
			return true;
		}
		return false;
	}

	public void addEntity(Employee entity) throws Exception {
		employeeDao.save(entity);
	}

	public Employee getById(Serializable id) {
		return employeeDao.findById(id);
	}

	public void updateEntity(Employee entity) {
		employeeDao.update(entity);
	}

	public void deleteEntity(Employee entity) {
		// TODO Auto-generated method stub
		
	}

	public void delEntitys(String ids) throws Exception{
		employeeDao.delEntitys(ids);
	}



}
