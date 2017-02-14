package com.paxonpilot.dgtransport.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.collections.iterators.EntrySetMapIterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.Employee;
import com.paxonpilot.dgtransport.util.Page;
import com.paxonpilot.dgtransport.util.PageUtil;

@Repository("employeeDao")
public class EmployeeDao extends BaseDao<Employee> {

	public Page findByEntity(Employee employee,Integer pageSize,Integer startIndex,Integer cityNo){
		Object[] params  = null;
		List paramList = new ArrayList();
		StringBuffer hql = new StringBuffer();
		hql.append(" select employee.name,employee.properties,employee.identityNo ")
		   .append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
		   .append(" ,employee.id,enterprise.cityNo as street from employee left join enterprise ")
		   .append(" on employee.epNo=enterprise.id where 1=1 ");
		StringBuffer counthql = new StringBuffer();
		counthql.append(" select count(employee.id) as total from ")
				.append(" employee left join enterprise on employee.epNo=enterprise.id where 1=1 ");
		if(employee.getName()!=null&&!employee.getName().equals("")){
			hql.append(" and employee.name like ?");
			counthql.append(" and employee.name like ?");
			paramList.add(employee.getName());
		}
		if(employee.getEpName()!=null&&!employee.getEpName().equals("")){
			hql.append(" and employee.epName like ?");
			counthql.append(" and employee.epName like ?");
			paramList.add(employee.getEpName());
		}
		if(employee.getIdentityNo()!=null&&!employee.getIdentityNo().equals("")){
			hql.append(" and employee.identityNo like ?");
			counthql.append(" and employee.identityNo like ?");
			paramList.add(employee.getIdentityNo());
		}
		if(cityNo!=null&&cityNo!=0){
			hql.append(" and enterprise.cityNo=?");
			counthql.append(" and enterprise.cityNo=?");
			paramList.add(cityNo);
		}
		if(employee.getEmpState()!=null&&!employee.getEmpState().equals(0)){
			hql.append(" and employee.empState=?");
			counthql.append(" and employee.empState=?");
			paramList.add(employee.getEmpState());
		}
		if(employee.getProperties()!=null&&!employee.getProperties().equals(0)){
			hql.append(" and employee.properties=?");
			counthql.append(" and employee.properties=?");
			paramList.add(employee.getProperties());
		}
		params = new Object[paramList.size()];
		for(int i=0;i<paramList.size();i++){
			Object obj = paramList.get(i);
			if(obj.getClass().isInstance(i)){
				params[i] = obj;
			}else{
				params[i] = "%"+obj+"%";
			}
		}

		hql.append(" order by employee.id desc ");


		List totalList = this.findBySql(counthql.toString(), params);
		List list = this.findByPageSQL(startIndex, pageSize, hql.toString(),params);
		Page page = PageUtil.getPage(pageSize, startIndex, Integer.valueOf(totalList.get(0).toString()), list);
		return page;
		
	}
	
	public Page findEntityBySql(Integer taskState,String taskName,Integer pageSize,Integer startIndex){
		StringBuffer hql = new StringBuffer();
		StringBuffer counthql = new StringBuffer();

		if(taskState == 0) {
			hql.append("select e.name,e.properties,e.identityNo,e.phone,e.provinceNo,e.cityNo,e.id from employee e where " +
					"not exists (select * from annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.fileName =?)");

			counthql.append("select count(e.id) from employee e where " +
					"not exists (select * from annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.fileName =?)");
		}

//		hql.append(" select employee.name,employee.properties,employee.identityNo ")
//		   .append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
//		   .append(" ,employee.id,enterprise.cityNo as street ")
//		   .append(" from task inner join employee on task.entityId=employee.id ")
//		   .append(" left join enterprise on employee.epNo=enterprise.id ")
//		   .append(" where taskState=? and taskName=? ");
//		counthql.append(" select count(employee.id) as total from task inner join employee on task.entityId=employee.id ")
//				.append(" left join enterprise on employee.epNo=enterprise.id ")
//				.append(" where taskState=? and taskName=? ");
		if (taskState == 4){
			hql.append("select e.name,e.properties,e.identityNo,e.phone,e.provinceNo,e.cityNo,e.id from employee e " +
					", annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') and a.fileName =?");

			counthql.append("select count(e.id) from employee e " +
					", annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') and a.fileName =?");
		}
		Object[] params = new Object[]{taskName};
//		Object[] params = new Object[]{taskState,taskName};
		List totalList = this.findBySql(counthql.toString(),params);
		List list = this.findByPageSQL(startIndex, pageSize, hql.toString(),params);
		Page page = PageUtil.getPage(pageSize, startIndex, Integer.valueOf(totalList.get(0).toString()), list);
		return page;
	}
	
	public List findEntityBySql(Integer taskState,String taskName,String ids){
		StringBuffer hql = new StringBuffer();
		Object[] params = null;
		String sql = "";
		if(ids.equals("")){
			hql.append(" select employee.name,employee.properties,employee.identityNo ")
			.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
			.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
			.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
			.append(" ,employee.checkinDate,employee.empState ")
			.append(" from task inner join employee on task.entityId=employee.id ")
			.append(" left join enterprise on employee.epNo=enterprise.id ")
			.append(" where taskState=? and taskName=? ");
			sql = hql.toString();
			params = new Object[]{taskState,taskName};
		}else{
			String[] idArray = ids.split(",");
			params = new Object[idArray.length];
			hql.append(" select employee.name,employee.properties,employee.identityNo ")
			.append(" ,employee.phone,employee.provinceNo,employee.cityNo ")
			.append(" ,employee.epName,employee.certificateNo,employee.empTypeName ")
			.append(" ,employee.carTypeName,employee.certificateDate,employee.driveDate ")
			.append(" ,employee.checkinDate,employee.empState ")
			.append(" from employee where employee.id in ( ");
			int idx = 0;
			for(String str :idArray){
				hql.append("?,");
				params[idx] = str; 
				idx++;
			}
			sql = hql.substring(0, hql.length()-1)+")";
		}
		
		List list = this.findBySql(sql,params);
		return list;
	}
	
	/**
	 * 批量删除人员
	 * @author zhr
	 */
	public void delEntitys(String ids){
		StringBuffer hql = new StringBuffer();
		Object[] params = null;
		String sql = "";
			String[] idArray = ids.split(",");
			params = new Object[idArray.length];
			hql.append(" delete from employee where employee.id in ( ");
			int idx = 0;
			for(String str :idArray){
				hql.append("?,");
				params[idx] = str; 
				idx++;
			}
			sql = hql.substring(0, hql.length()-1)+")";		
	     this.deleteBySql(sql,params);
		 return;
		
	}
	
}
