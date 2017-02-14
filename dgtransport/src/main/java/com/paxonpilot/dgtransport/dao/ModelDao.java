package com.paxonpilot.dgtransport.dao;

import java.util.List;
import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.util.Page;
import com.paxonpilot.dgtransport.util.PageUtil;

@Repository("modelDao")
public class ModelDao extends BaseDao<SubSystem> {
	public Page findByEntity(SubSystem model,Integer pageSize,Integer startIndex,Integer currentPage){
		DetachedCriteria criteria=DetachedCriteria.forClass(model.getClass());
		if(model.getSystemName()!=null&&!model.getSystemName().equals("")){
			criteria.add(Restrictions.like("systemName", model.getSystemName(),MatchMode.ANYWHERE));
		}
		if(model.getSystemUrl()!=null&&!model.getSystemUrl().equals("")){
			criteria.add(Restrictions.like("systemUrl", model.getSystemUrl(),MatchMode.ANYWHERE));
		}
		List<SubSystem> totalList = this.findByCriteria(criteria);
		List<SubSystem> list = this.findByPage(startIndex, pageSize, criteria);
		Page page = PageUtil.getPage(pageSize, startIndex, totalList.size(), list);
		page.setCurrentPage(PageUtil.getCurrentPage(currentPage));
		page.setTotalPage(PageUtil.getTotalPage(pageSize, totalList.size()));
		return page;
		
	}
}
