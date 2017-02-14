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
import com.paxonpilot.dgtransport.entity.BusinessScope;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.util.Page;

@Service("modelService")
public class ModelServiceImpl implements BaseService<SubSystem> {
	
	@Autowired
	public ModelDao modelDao;
	
	public Page getByEntity(SubSystem model,Integer pageSize,Integer startIndex,Integer currentPage) {
		Page page = modelDao.findByEntity(model,pageSize,startIndex,currentPage);
		return page;
	}

	@Override
	public List<SubSystem> getAll() {
		return modelDao.findAll();
	}

	@Override
	public List<SubSystem> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addEntity(SubSystem entity) throws Exception {
		modelDao.save(entity);
	}

	@Override
	public SubSystem getById(Serializable id) {
		return modelDao.findById(id);
	}

	@Override
	public void updateEntity(SubSystem entity) {
		modelDao.update(entity);
	}

	@Override
	public void deleteEntity(SubSystem entity) throws Exception{
		modelDao.delete(entity);
	}
	


}
