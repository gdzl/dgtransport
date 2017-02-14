package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxonpilot.dgtransport.dao.AnnexDetailDao;
import com.paxonpilot.dgtransport.dao.CarDao;
import com.paxonpilot.dgtransport.entity.AnnexDetail;
import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.util.Page;

@Service("annuxSerivce")
public class AnnuxSerivceImpl implements BaseService<AnnexDetail> {

	@Autowired
	private AnnexDetailDao annexDetailDao;
	

	public List<AnnexDetail> getAll() {
		// TODO Auto-generated method stub
		return null;
	}


	public List<AnnexDetail> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}


	public void addEntity(AnnexDetail entity) throws Exception {
		// TODO Auto-generated method stub
		
	}


	public AnnexDetail getById(Serializable id) {
		return annexDetailDao.findById(id);
	}


	public void updateEntity(AnnexDetail entity) throws Exception {
		annexDetailDao.update(entity);
	}


	public void deleteEntity(AnnexDetail entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public AnnexDetailDao getAnnexDetailDao() {
		return annexDetailDao;
	}

	public void setAnnexDetailDao(AnnexDetailDao annexDetailDao) {
		this.annexDetailDao = annexDetailDao;
	}


	public List<AnnexDetail> getFileBeanByMap(Object[] params) {
		StringBuffer sql = new StringBuffer();
		sql.append("select a.fileUrl from annexdetail a where a.entityId=? and a.entityType= ? and a.isValidity is null ");
		List list = annexDetailDao.findListByMap(sql.toString(), params);
		return list;
	}

}
