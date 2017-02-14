package com.paxonpilot.dgtransport.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.util.Page;
import com.paxonpilot.dgtransport.util.PageUtil;

@Repository("historyRecordDao")
public class HistoryRecordDao extends BaseDao<HisRecord> {
	public Page findByEntity(Map<String,Object> contentMap,Integer pageSize,Integer startIndex) throws ParseException{
		DetachedCriteria criteria=DetachedCriteria.forClass(HisRecord.class);
		criteria.addOrder(Order.desc("id"));
		String begOptDate = (String) contentMap.get("begOptDate");
		String endOptDate = (String) contentMap.get("endOptDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(!begOptDate.equals("")&&!endOptDate.equals("")){
			criteria.add(Restrictions.between("optDate", sdf.parse(begOptDate), sdf.parse(endOptDate)));
		}
		List<HisRecord> totalList = this.findByCriteria(criteria);
		List<HisRecord> list = this.findByPage(startIndex, pageSize, criteria);
		Page page = PageUtil.getPage(pageSize, startIndex, totalList.size(), list);
		return page;
		
	}
}
