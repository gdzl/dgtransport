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
import com.paxonpilot.dgtransport.dao.HistoryRecordDao;
import com.paxonpilot.dgtransport.dao.ModelDao;
import com.paxonpilot.dgtransport.dao.ProvinceDao;
import com.paxonpilot.dgtransport.dao.RoleDao;
import com.paxonpilot.dgtransport.dao.UserDao;
import com.paxonpilot.dgtransport.entity.BusinessScope;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.entity.Province;
import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.util.Page;

@Service("provinceService")
public class ProvinceServiceImpl implements BaseService<Province> {
	
	@Autowired
	public ProvinceDao provinceDao;

	@Override
	public List<Province> getAll() {
		return provinceDao.findAll();
	}

	@Override
	public List<Province> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Long addEntityReturn(Province entity) throws Exception{
		return provinceDao.save(entity);
	}

	@Override
	public void addEntity(Province entity) throws Exception {
		provinceDao.save(entity);
	}

	@Override
	public Province getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateEntity(Province entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEntity(Province entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public ProvinceDao getProvinceDao() {
		return provinceDao;
	}

	public void setProvinceDao(ProvinceDao provinceDao) {
		this.provinceDao = provinceDao;
	}
	

}
