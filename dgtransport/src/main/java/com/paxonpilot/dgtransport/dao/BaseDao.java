package com.paxonpilot.dgtransport.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;

import com.paxonpilot.dgtransport.util.PageUtil;

public class BaseDao<T> {

	@Autowired
	public HibernateTemplate hibernateTemplate;
	
	private Class<T> entityClass;
	
	public BaseDao(){
		Type type= getClass().getGenericSuperclass();
		//System.out.println("type"+type);
		Type[] params = ((ParameterizedType)type).getActualTypeArguments();
		//System.out.println("params"+params);
		entityClass = (Class)params[0];
		//System.out.println("entityClass"+entityClass);
	}
	
	public T findById(Serializable id){
		return getHibernateTemplate().get(entityClass, id);
	}
	
	public List<T> findListByMap(String hql,Object[] params){
		return (List<T>) getHibernateTemplate().find(hql, params);
	}
	
	public List<T> findByPage(Integer startIndex,Integer pageSize,DetachedCriteria criteria){
		return (List<T>) getHibernateTemplate().findByCriteria(criteria, startIndex, pageSize);
	}
	
	public List<T> findByPageSQL(final Integer startIndex,final Integer pageSize,final String hql,final Object[] params){
		return (List<T>) this.getHibernateTemplate().execute(new HibernateCallback<Object>() {  
				public Object doInHibernate(Session session) throws HibernateException {
					Query query = session.createSQLQuery(hql);
					for(int i=0;i<params.length;i++){
						query.setParameter(i, params[i]);
					}
					query.setFirstResult(startIndex);
					query.setMaxResults(pageSize);
					return query.list();
				}  
			});
	}
	
	public List<T> findByCriteria(DetachedCriteria criteria){
		return (List<T>) getHibernateTemplate().findByCriteria(criteria);
	}
	
	public List<T> findAll(){
		return getHibernateTemplate().loadAll(entityClass);
	}
	
	public Session getOpenSession(){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		
		return session;
	}
	
	public Long save(T entity) throws Exception{
		Session session = getOpenSession();
		session.setFlushMode(FlushMode.AUTO);
		Long id = (Long) session.save(entity);
		session.flush();
		session.close();
		return id;
	}
	
	public void update(T entity){
		Session session = getOpenSession();
		session.setFlushMode(FlushMode.COMMIT);
		session.update(entity);
		session.flush();
		session.close();
	}
	
	public void delete(T entity){
		Session session = getOpenSession();
		session.setFlushMode(FlushMode.AUTO);
		session.delete(entity);
		session.flush();
		session.close();
	}
	
	public List findBySql(final String hql,final Object[] params){
		List list = (List) this.getHibernateTemplate().execute(new HibernateCallback<Object>() {  
				public Object doInHibernate(Session session) throws HibernateException {
					Query query = session.createSQLQuery(hql);
					if(params!=null){
						for(int i=0;i<params.length;i++){
							query.setParameter(i, params[i]);
						}
					}
					List list = query.list();
					return list;
				}  
			});
		 
		return list;
	}
	
	public void deleteBySql(final String hql,final Object[] params){
		this.getHibernateTemplate().execute(new HibernateCallback<Object>() {  
				public Object doInHibernate(Session session) throws HibernateException {
					Query query = session.createSQLQuery(hql);
					if(params!=null){
						for(int i=0;i<params.length;i++){
							query.setParameter(i, params[i]);
						}
					}
					int decounts=query.executeUpdate();
					return decounts;
				}  
			});
		return;
	}
	
	public void updBySql(final StringBuffer sql,final Object[] params){
		this.getHibernateTemplate().execute(new HibernateCallback<Object>() {  
			public Object doInHibernate(Session session) throws HibernateException {
				session.createSQLQuery(sql.toString())
					   .setParameter(0, params[0])
					   .setParameter(1, params[1])
					   .setParameter(2, params[2]).executeUpdate();
				return null;
			}  
		});
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
