package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxonpilot.dgtransport.dao.BusinessScopeDao;
import com.paxonpilot.dgtransport.dao.CityDao;
import com.paxonpilot.dgtransport.dao.HistoryRecordDao;
import com.paxonpilot.dgtransport.dao.ModelDao;
import com.paxonpilot.dgtransport.dao.ProvinceDao;
import com.paxonpilot.dgtransport.dao.RoleDao;
import com.paxonpilot.dgtransport.dao.UserDao;
import com.paxonpilot.dgtransport.entity.BusinessScope;
import com.paxonpilot.dgtransport.entity.City;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.entity.Province;
import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.util.Page;

@Service("cityService")
public class CityServiceImpl implements BaseService<City> {
	@Autowired
	public CityDao cityDao;

	@Override
	public List<City> getAll() {
		return cityDao.findAll();
	}

	@Override
	public List<City> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addEntity(City entity) throws Exception {
		cityDao.save(entity);
	}

	@Override
	public City getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateEntity(City entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEntity(City entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public CityDao getCityDao() {
		return cityDao;
	}

	public void setCityDao(CityDao cityDao) {
		this.cityDao = cityDao;
	}

}
