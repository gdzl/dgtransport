package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.paxonpilot.dgtransport.dao.StreetDao;
import com.paxonpilot.dgtransport.entity.Street;

@Service("streetService")
public class StreetServiceImpl implements BaseService<Street> {
	
	@Autowired
	public StreetDao streetDao;

	@Override
	public List<Street> getAll() {
		return streetDao.findAll();
	}

	@Override
	public List<Street> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addEntity(Street entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Street getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateEntity(Street entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEntity(Street entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
