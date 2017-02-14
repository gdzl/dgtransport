package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxonpilot.dgtransport.dao.CarDao;
import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.util.Page;

@Service("carSerivce")
public class CarSerivceImpl implements BaseService<Car> {

	@Autowired
	public CarDao carDao;
	
	public Page getByEntity(Car car,Integer pageSize,Integer startIndex) {
		Page page = carDao.findByEntity(car,pageSize,startIndex);
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		List<Car> list = page.getDatas();
		int idx = 1;
		for(Car cars: list){
			Map<String,Object> valueMap = new HashMap<String,Object>();
			valueMap.put("carNo", cars.getCarNo());
			valueMap.put("carColor", cars.getCarColor());
			valueMap.put("epName", cars.getEpName());
			valueMap.put("transportNo",cars.getTransportNo());
			valueMap.put("scopeName", cars.getScopeName());
			valueMap.put("checkbox", cars.getId());
			valueMap.put("upd", cars.getId());
			valueMap.put("idx", idx);
			valueMap.put("show", cars);
			mapList.add(valueMap);
			idx++;
		}
		page.setDatas(mapList);
		return page;
	}
	
	public Page getEntityBySql(Integer taskState,String taskName,Integer pageSize,Integer startIndex) {
		Page page = carDao.findEntityBySql(taskState,taskName,pageSize,startIndex);
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		List<Object[]> list = page.getDatas();
		int idx = 1;
		for(Object[] str : list){
			Map<String,Object> valueMap = new HashMap<String,Object>();
			valueMap.put("idx", idx);
			valueMap.put("checkbox", str[0]);
			valueMap.put("upd", str[0]);
			valueMap.put("show", str[0]);
			valueMap.put("carNo", str[1]);
			valueMap.put("carColor", str[2]);
			valueMap.put("epName", str[3]);
			valueMap.put("transportNo", str[4]);
			valueMap.put("scopeName", str[5]);
			mapList.add(valueMap);
			idx++;
		}
		page.setDatas(mapList);
		return page;
	}
	
	public List getEntityBySql(Integer taskState,String taskName,String ids) {
		List mapList = carDao.findEntityBySql(taskState,taskName,ids);
		return mapList;
	}
	
	public List<Car> getByIds(String carNo,String transportNo,String carColor,String epName
			,Integer carState,Object[] params) throws Exception {
		StringBuffer hql = null;
		Object[] objParam  = null;
		List<Object> list = new ArrayList<Object>();
		String str = "";
		if(params!=null&&params.length>=1){
			String sqlStr = "";
			hql = new StringBuffer(" from car where id in (");
			for(int i=0;i<params.length;i++){
				list.add(Long.parseLong(params[i].toString()));
				hql.append("?,");
			}
			sqlStr = hql.substring(0, hql.length()-1)+")";
			hql.setLength(0);
			hql.append(sqlStr);
		}else{
			hql = new StringBuffer(" from car where 1=1 ");
		}
		if(carNo !=null&&!carNo.equals("")){
			if(hql==null){
				hql = new StringBuffer(" from car where 1=1 and carNo like ? ");
			}else{
				hql.append(" and carNo like ? ");
			}
			list.add("%"+carNo+"%");
		}
		if(transportNo !=null&&!transportNo.equals("")){
			if(hql==null){
				hql = new StringBuffer(" from car where 1=1 and transportNo like ? ");
			}else{
				hql.append(" and transportNo like ? ");
			}
			list.add("%"+transportNo+"%");
		}
		if(carColor !=null&&!carColor.equals("0")){
			if(hql==null){
				hql = new StringBuffer(" from car where 1=1 and carColor=? ");
			}else{
				hql.append(" and carColor=? ");
			}
			list.add(carColor);
		}
		if(epName !=null&&!epName.equals("")){
			if(hql==null){
				hql = new StringBuffer(" from car where 1=1 and epName like ? ");
			}else{
				hql.append(" and epName like ? ");
			}
			list.add("%"+new String(epName.getBytes("iso8859-1"),"UTF-8")+"%");
		}
		if(!carState.equals(0)){
			if(hql==null){
				hql = new StringBuffer(" from car where 1=1 and carState=? ");
			}else{
				hql.append(" and carState=? ");
			}
			list.add(carState);
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
		List<Car> carList = carDao.findListByMap(str, objParam);
		return carList;
	}
	
	public List<Car> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Car> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

	public void addEntity(Car entity) throws Exception {
		carDao.save(entity);
	}

	public Car getById(Serializable id) {
		return carDao.findById(id);
	}

	public void updateEntity(Car entity) {
		carDao.update(entity);
	}

	public void deleteEntity(Car entity) {
		// TODO Auto-generated method stub
		
	}
	public void delEntitys(String ids) throws Exception{
		carDao.delEntitys(ids);
	}

	public CarDao getCarDao() {
		return carDao;
	}

	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}




}
