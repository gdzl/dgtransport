package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxonpilot.dgtransport.dao.LoginDao;
import com.paxonpilot.dgtransport.entity.User;

@Service("loginService")
public class LoginServiceImpl implements BaseService<User> {
	@Autowired
	public LoginDao loginDao;

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public User getLoginInfo(Object[] params){
		List<User> list = getByMap(params);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	//角色信息，权限信息等
	public List getLoginAllInfo(Object[] params){
		StringBuffer hql = new StringBuffer();
		hql.append(" select u.id ,s.systemurl from sysuser u left join role  r on u.roleid=r.roleid left join subsystem  s on r.systemno=s.systemno where u.username=?");
		List list = loginDao.findBySql(hql.toString(), params);;
		
		if(list!=null&&list.size()>0){
			List urlList = new ArrayList();
			Object[] loginobj=null;
			for(int i=0;i<list.size();i++){
				loginobj=(Object[]) list.get(i);
				String loginurl=(String) loginobj[1];
				urlList.add(loginurl);
			}
			return urlList;
		}
		return null;
	}

	@Override
	public List<User> getByMap(Object[] params) {
		StringBuffer hql = new StringBuffer();
		hql.append("from sysuser where userName=?");
		return loginDao.findListByMap(hql.toString(), params);
	}

	@Override
	public void addEntity(User entity) throws Exception {
		// TODO Auto-generated method stub
		
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

	
}
