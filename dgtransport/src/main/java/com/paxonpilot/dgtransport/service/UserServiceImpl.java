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
import com.paxonpilot.dgtransport.dao.RoleDao;
import com.paxonpilot.dgtransport.dao.UserDao;
import com.paxonpilot.dgtransport.entity.BusinessScope;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.util.Page;

@Service("userService")
public class UserServiceImpl implements BaseService<User> {
	
	@Autowired
	public UserDao userDao;
	
	public Page getByEntity(User user,Integer pageSize,Integer startIndex,Integer currentPage) {
		Page page = userDao.findByEntity(user,pageSize,startIndex,currentPage);
		List<Role> roleList = page.getDatas();
//		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
//		
//		Map<String,Object> modelMap = new HashMap<String,Object>();
//		List<SubSystem> modelList = modelDao.findAll();
//		for(SubSystem models :modelList){
//			modelMap.put(models.getId().toString(), models.getSystemName());
//		}
//		for(Role roles : roleList){
//			if(modelMap.containsKey(roles.getSystemNo().toString())){
//				Map<String,Object> valMap = new HashMap<String,Object>();
//				valMap.put("id", roles.getId());
//				valMap.put("roleName", roles.getRoleName());
//				valMap.put("sysName", modelMap.get(roles.getSystemNo().toString()));
//				mapList.add(valMap);
//			}
//		}
//		page.setDatas(mapList);
		return page;
	}
	
	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addEntity(User entity) throws Exception {
		userDao.save(entity);
	}

	@Override
	public User getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateEntity(User entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEntity(User entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	


}
