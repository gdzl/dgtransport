package com.paxonpilot.dgtransport.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.util.Page;
import com.paxonpilot.dgtransport.util.PageUtil;

@Repository("carDao")
public class CarDao extends BaseDao<Car> {

	public Page findByEntity(Car car,Integer pageSize,Integer startIndex){
		DetachedCriteria criteria=DetachedCriteria.forClass(car.getClass());
		if(car.getCarNo()!=null&&!car.getCarNo().equals("")){
			criteria.add(Restrictions.like("carNo", car.getCarNo(),MatchMode.ANYWHERE));
		}
		if(car.getTransportNo()!=null&&!car.getTransportNo().equals("")){
			criteria.add(Restrictions.like("transportNo", car.getTransportNo(),MatchMode.ANYWHERE));
		}
		if(car.getEpName()!=null&&!car.getEpName().equals("")){
			criteria.add(Restrictions.like("epName", car.getEpName(),MatchMode.ANYWHERE));
		}
		if(car.getCarColor()!=null&&!car.getCarColor().equals("0")){
			criteria.add(Restrictions.eq("carColor", car.getCarColor()));
		}
		if(car.getCarState()!=null&&!car.getCarState().equals(0)){
			criteria.add(Restrictions.eq("carState", car.getCarState()));
		}
		criteria.addOrder(Order.desc("id"));//20161223
		List<Car> totalList = this.findByCriteria(criteria);
		List<Car> list = this.findByPage(startIndex, pageSize, criteria);


		Page page = PageUtil.getPage(pageSize, startIndex, totalList.size(), list);
		return page;
		
	}
	
	public Page findEntityBySql(Integer taskState,String taskName,Integer pageSize,Integer startIndex){
		StringBuffer hql = new StringBuffer();
		StringBuffer counthql = new StringBuffer();

		if(taskState == 0) {
			hql.append("select e.id,e.carNo,e.carColor,e.epName,e.transportNo,e.scopeName from car e where " +
					"not exists (select * from annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.fileName =?)");

			counthql.append("select count(e.id) from car e where " +
					"not exists (select * from annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.fileName =?)");






		}


		//select * from car where left join annexdeatil on a.entityId = e.id a.isValidity is null group by a.fileName=?

//		hql.append(" select car.id,car.carNo,car.carColor,car.epName,car.transportNo,  ")
//				.append(" car.scopeName")
//				.append(" from task inner join car on task.entityId=car.id ")
//				.append(" where taskState=? and taskName=? ");
//		counthql.append(" select count(car.id) as total from task inner join car on task.entityId=car.id ")
//				.append(" where taskState=? and taskName=? ");

		if (taskState == 4){
			hql.append("select e.id,e.carNo,e.carColor,e.epName,e.transportNo,e.scopeName from car e" +
					", annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') and a.fileName =?");

			counthql.append("select count(e.id) from car e" +
					", annexdetail a where a.entityId = e.id and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') and a.fileName =?");
		}

		//Object[] params = new Object[]{taskState,taskName};
		Object[] params = new Object[]{taskName};
//		hql.append(" order by car.id desc");

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
			hql.append(" select car.carNo,car.carColor,car.epName ")
			.append(" ,car.transportNo,car.scopeName ")
			.append(" ,car.carTypeName,car.brandNo,car.vin ")
			.append(" ,car.engineNo,car.engineStyle,car.regDate ")
			.append(" ,car.scrapDate,car.carState ")
			.append(" from task inner join car on task.entityId=car.id ")
			.append(" where taskState=? and taskName=? ");
			sql = hql.toString();
			params = new Object[]{taskState,taskName};
		}else{
			String[] idArray = ids.split(",");
			params = new Object[idArray.length];
			hql.append(" select car.carNo,car.carColor,car.epName ")
			.append(" ,car.transportNo,car.scopeName ")
			.append(" ,car.carTypeName,car.brandNo,car.vin ")
			.append(" ,car.engineNo,car.engineStyle,car.regDate ")
			.append(" ,car.scrapDate,car.carState ")
			.append(" from car where car.id in ( ");
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
	 * ÅúÁ¿É¾³ýcar
	 */
	public void delEntitys(String ids){
		StringBuffer hql = new StringBuffer();
		Object[] params = null;
		String sql = "";
			String[] idArray = ids.split(",");
			params = new Object[idArray.length];
			hql.append(" delete from car where car.id in ( ");
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
