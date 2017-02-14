package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.util.List;

import com.paxonpilot.dgtransport.entity.BusinessScope;
import com.paxonpilot.dgtransport.entity.Enterprise;

public interface BaseService<T> {
	
	public List<T> getAll();
	
	public List<T> getByMap(Object[] params);
	
	public void addEntity(T entity) throws Exception;
	
    public void deleteEntity(T entity) throws Exception;
	
	public T getById(Serializable id);
	
	public void updateEntity(T entity) throws Exception;
	
}
