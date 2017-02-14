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
import com.paxonpilot.dgtransport.entity.BusinessScope;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.util.Page;

@Service("roleService")
public class RoleServiceImpl implements BaseService<Role> {
	
	@Autowired
	public RoleDao roleDao;
	
	@Autowired
	public ModelDao modelDao;
	
	public Page getByEntity(Role role,Integer pageSize,Integer startIndex,Integer currentPage) {
		Page page = roleDao.findByEntity(role,pageSize,startIndex,currentPage);
		List<Role> roleList = page.getDatas();
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		List<SubSystem> modelList = modelDao.findAll();
		for(SubSystem models :modelList){
			modelMap.put(models.getId().toString(), models.getSystemName());
		}
		for(Role roles : roleList){
			if(modelMap.containsKey(roles.getSystemNo().toString())){
				Map<String,Object> valMap = new HashMap<String,Object>();
				valMap.put("id", roles.getId());
				valMap.put("roleName", roles.getRoleName());
				valMap.put("sysName", modelMap.get(roles.getSystemNo().toString()));
				mapList.add(valMap);
			}
		}
		page.setDatas(mapList);
		return page;
	}

	@Override
	public List<Role> getAll() {
		return roleDao.findAll();
	}

	@Override
	public List<Role> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addEntity(Role entity) throws Exception {
		roleDao.save(entity);
	}

	@Override
	public Role getById(Serializable id) {
		return roleDao.findById(id);
	}

	@Override
	public void updateEntity(Role entity) throws Exception{
		roleDao.update(entity);
	}

	@Override
	public void deleteEntity(Role entity) throws Exception {
		roleDao.delete(entity);
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public ModelDao getModelDao() {
		return modelDao;
	}

	public void setModelDao(ModelDao modelDao) {
		this.modelDao = modelDao;
	}
	
	


}
