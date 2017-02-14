package com.paxonpilot.dgtransport.dao;

import java.util.List;

import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.Task;
import com.paxonpilot.dgtransport.util.Page;
import com.paxonpilot.dgtransport.util.PageUtil;

@Repository("enterpriceDao")
public class EnterpriceDao extends BaseDao<Enterprise> {

	public Page findByEntity(Enterprise enterprise,Integer pageSize,Integer startIndex){
		DetachedCriteria criteria=DetachedCriteria.forClass(enterprise.getClass());
		if(enterprise.getEpName()!=null&&!enterprise.getEpName().equals("")){
			criteria.add(Restrictions.like("epName", enterprise.getEpName(),MatchMode.ANYWHERE));
		}
		if(enterprise.getTpLicence()!=null&&!enterprise.getTpLicence().equals("")){
			criteria.add(Restrictions.like("tpLicence", enterprise.getTpLicence(),MatchMode.ANYWHERE));
		}
		if(enterprise.getCityNo()!=null&&enterprise.getCityNo()!=0){
			criteria.add(Restrictions.eq("cityNo", enterprise.getCityNo()));
		}
		if(enterprise.getEpState()!=null&&enterprise.getEpState()!=0){
			criteria.add(Restrictions.eq("epState", enterprise.getEpState()));
		}
		criteria.addOrder(Order.desc("id"));
		List<Enterprise> totalList = this.findByCriteria(criteria);
		List<Enterprise> list = this.findByPage(startIndex, pageSize, criteria);
		Page page = PageUtil.getPage(pageSize, startIndex, totalList.size(), list);
		return page;
		
	}
	
	public Page findEntityBySql(Integer taskState,String taskName,Integer pageSize,Integer startIndex){
		StringBuffer hql = new StringBuffer();
		StringBuffer counthql = new StringBuffer();


		if(taskState == 0) {
			hql.append("select e.id,e.epName,e.address,e.scopeName,e.cityNo,e.epState from enterprise e where " +
					"not exists (select * from annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.fileName =?)");

			counthql.append("select count(e.id) from enterprise e where " +
					"not exists (select * from annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.fileName =?)");
		}
		if (taskState == 4){
			hql.append("select e.id,e.epName,e.address,e.scopeName,e.cityNo,e.epState from enterprise e" +
					", annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') and a.fileName =?");

			counthql.append("select count(e.id) from enterprise e " +
					", annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') and a.fileName =?");
		}
//		hql.append(" select enterprise.id,enterprise.epName,enterprise.address, ")
//		   .append(" enterprise.scopeName,enterprise.cityNo,enterprise.epState ")
//		   .append(" from task inner join enterprise on task.entityId=enterprise.id ")
//		   .append(" where taskState=? and taskName=? ");
//		counthql.append(" select count(enterprise.id) as total from task inner join enterprise on task.entityId=enterprise.id ")
//				.append(" where taskState=? and taskName=? ");



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
			hql.append(" select enterprise.epNo,enterprise.epName,enterprise.address ")
			.append(" ,enterprise.scopeName,enterprise.tpLicence,enterprise.icLicence ")
			.append(" ,enterprise.corporation,enterprise.corcontact,enterprise.businessor ")
			.append(" ,enterprise.contact,enterprise.cityNo,enterprise.epState ")
			.append(" from task inner join enterprise on task.entityId=enterprise.id ")
			.append(" where taskState=? and taskName=? ");
			sql = hql.toString();
			params = new Object[]{taskState,taskName};
		}else{
			String[] idArray = ids.split(",");
			params = new Object[idArray.length];
			hql.append(" select enterprise.epNo,enterprise.epName,enterprise.address ")
			.append(" ,enterprise.scopeName,enterprise.tpLicence,enterprise.icLicence ")
			.append(" ,enterprise.corporation,enterprise.corcontact,enterprise.businessor ")
			.append(" ,enterprise.contact,enterprise.cityNo,enterprise.epState ")
			.append(" from enterprise where enterprise.id in ( ");
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
	 * 批量删除企业
	 */
	public void delEntitys(String ids){
		StringBuffer hql = new StringBuffer();
		Object[] params = null;
		String sql = "";
			String[] idArray = ids.split(",");
			params = new Object[idArray.length];
			hql.append(" delete from enterprise where enterprise.id in ( ");
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
	
	public void batchUpd(List<String> stringList){
		for(int i=0;i<stringList.size();i++){
			StringBuffer sql = new StringBuffer();
			String paramStr = stringList.get(i);
			String[] paramArr = paramStr.split("-");
			System.out.println("taskName"+paramArr[0]);
			sql.append("update task set taskState = 1 where taskName = ? and entityId =? and entityType= ?  ");
			Object[] params = new Object[]{paramArr[0],paramArr[1],paramArr[2]};
			this.updBySql(sql, params);
		}
	}

	/**
	 * 通过企业的epNo获取企业名称
	 * @param epNo
	 * @return
	 */
	public String getUinoEpName(Long epNo){
		Enterprise enterprise = this.findById(epNo);
		if (enterprise != null){
			return enterprise.getEpName();
		}
		return null;
	}
}
