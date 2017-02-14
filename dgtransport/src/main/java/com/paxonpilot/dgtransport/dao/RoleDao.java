package com.paxonpilot.dgtransport.dao;

import java.util.List;
import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.util.Page;
import com.paxonpilot.dgtransport.util.PageUtil;

@Repository("roleDao")
public class RoleDao extends BaseDao<Role> {
	public Page findByEntity(Role role,Integer pageSize,Integer startIndex,Integer currentPage){
		DetachedCriteria criteria=DetachedCriteria.forClass(role.getClass());
		if(role.getRoleName()!=null&&!role.getRoleName().equals("")){
			criteria.add(Restrictions.like("roleName", role.getRoleName(),MatchMode.ANYWHERE));
		}
		List<Role> totalList = this.findByCriteria(criteria);
		List<Role> list = this.findByPage(startIndex, pageSize, criteria);
		Page page = PageUtil.getPage(pageSize, startIndex, totalList.size(), list);
		page.setCurrentPage(PageUtil.getCurrentPage(currentPage));
		page.setTotalPage(PageUtil.getTotalPage(pageSize, totalList.size()));
		return page;
		
	}
}
