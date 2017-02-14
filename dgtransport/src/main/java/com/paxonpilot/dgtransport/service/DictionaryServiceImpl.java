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
import com.paxonpilot.dgtransport.dao.DictionaryDao;
import com.paxonpilot.dgtransport.dao.HistoryRecordDao;
import com.paxonpilot.dgtransport.dao.ModelDao;
import com.paxonpilot.dgtransport.dao.ProvinceDao;
import com.paxonpilot.dgtransport.dao.RoleDao;
import com.paxonpilot.dgtransport.dao.StreetDao;
import com.paxonpilot.dgtransport.dao.UserDao;
import com.paxonpilot.dgtransport.entity.BusinessScope;
import com.paxonpilot.dgtransport.entity.City;
import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.entity.Province;
import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.Street;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.util.Page;

@Service("dictionaryService")
public class DictionaryServiceImpl implements BaseService<Dictionary> {
	
	@Autowired
	public DictionaryDao dictionaryDao;
	
	@Override
	public List<Dictionary> getAll() {
		return dictionaryDao.findAll();
	}

	@Override
	public List<Dictionary> getByMap(Object[] params) {
		StringBuffer hql = new StringBuffer();
		hql.append("from sysdictionary where type=?");
		return dictionaryDao.findListByMap(hql.toString(), params);
	}
	
	public List<Dictionary> getByIn(Object[] params) {
		StringBuffer hql = new StringBuffer();
		hql.append("from sysdictionary where type in(");
		for(int i=0;i<params.length;i++){
			hql.append("?,");
		}
		String hqlStr = hql.substring(0, hql.length()-1);
		hqlStr +=")";
		return dictionaryDao.findListByMap(hqlStr, params);
	}

	@Override
	public void addEntity(Dictionary entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Dictionary getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateEntity(Dictionary entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEntity(Dictionary entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public DictionaryDao getDictionaryDao() {
		return dictionaryDao;
	}

	public void setDictionaryDao(DictionaryDao dictionaryDao) {
		this.dictionaryDao = dictionaryDao;
	}

}
