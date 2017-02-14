package com.paxonpilot.dgtransport.dao;

import java.util.List;
import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.util.Page;
import com.paxonpilot.dgtransport.util.PageUtil;

@Repository("userDao")
public class UserDao extends BaseDao<User> {
	public Page findByEntity(User user,Integer pageSize,Integer startIndex,Integer currentPage){
		DetachedCriteria criteria=DetachedCriteria.forClass(user.getClass());
		if(user.getUserName()!=null&&!user.getUserName().equals("")){
			criteria.add(Restrictions.like("userName", user.getUserName(),MatchMode.ANYWHERE));
		}
		List<User> totalList = this.findByCriteria(criteria);
		List<User> list = this.findByPage(startIndex, pageSize, criteria);
		Page page = PageUtil.getPage(pageSize, startIndex, totalList.size(), list);
		page.setCurrentPage(PageUtil.getCurrentPage(currentPage));
		page.setTotalPage(PageUtil.getTotalPage(pageSize, totalList.size()));
		return page;
		
	}
}
