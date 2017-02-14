package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxonpilot.dgtransport.dao.BusinessScopeDao;
import com.paxonpilot.dgtransport.entity.BusinessScope;

@Service("businessScopeService")
public class BusinessScopeServiceImpl implements BaseService<BusinessScope> {
	
	@Autowired
	public BusinessScopeDao businessScopeDao;
	
	public List<BusinessScope> getAll() {
		return businessScopeDao.findAll();
	}

	public List<BusinessScope> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

	public void addEntity(BusinessScope entity) {
		// TODO Auto-generated method stub
		
	}

	public BusinessScope getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateEntity(BusinessScope entity) {
		// TODO Auto-generated method stub
		
	}

	public void deleteEntity(BusinessScope entity) {
		// TODO Auto-generated method stub
		
	}

	public BusinessScopeDao getBusinessScopeDao() {
		return businessScopeDao;
	}

	public void setBusinessScopeDao(BusinessScopeDao businessScopeDao) {
		this.businessScopeDao = businessScopeDao;
	}


}
