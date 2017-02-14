package com.paxonpilot.dgtransport.dao;

import java.util.List;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import com.paxonpilot.dgtransport.entity.Task;

@Repository("taskDao")
public class TaskDao extends BaseDao<Task> {
	public void batchSave(List<Task> taskList){
		for(int i=0;i<taskList.size();i++){
			Session session = this.getOpenSession();
			Task task = taskList.get(i);
			session.setFlushMode(FlushMode.AUTO);
			session.save(task);
			if(i%50==0){
				session.flush();
			}
			session.close();
		}
	}
	public List findLincene(String hql,Object[] params){
		List list = this.findBySql(hql,params);
		return list;
	}
}
