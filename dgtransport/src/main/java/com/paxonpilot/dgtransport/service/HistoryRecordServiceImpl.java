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
import com.paxonpilot.dgtransport.entity.BusinessScope;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.util.Page;

@Service("historyRecordService")
public class HistoryRecordServiceImpl implements BaseService<HisRecord> {
	
	@Autowired
	public HistoryRecordDao historyRecordDao;
	
	public Page getByEntity(Map<String,Object> contentMap,Integer pageSize,Integer startIndex) throws ParseException {
		Page page = historyRecordDao.findByEntity(contentMap,pageSize,startIndex);
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		List<HisRecord> list = page.getDatas();
		int idx = 1;
		for(HisRecord records: list){
			Map<String,Object> valueMap = new HashMap<String,Object>();
			valueMap.put("userName", records.getUserName());
			valueMap.put("optDate", records.getOptDate());
			valueMap.put("optContent", records.getOptContent());
			valueMap.put("ipAddress",records.getIpAddress());
			valueMap.put("systemName", records.getSystemName());
			valueMap.put("checkbox", records.getId());
			valueMap.put("idx", idx);
			valueMap.put("upd", records.getId());
			mapList.add(valueMap);
			idx++;
		}
		page.setDatas(mapList);
		return page;
	}
	
	public List<HisRecord> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<HisRecord> getByMap(Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

	public void addEntity(HisRecord entity) throws Exception {
		historyRecordDao.save(entity);
	}

	public HisRecord getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateEntity(HisRecord entity) {
		// TODO Auto-generated method stub
		
	}

	public void deleteEntity(HisRecord entity) {
		// TODO Auto-generated method stub
		
	}

	public HistoryRecordDao getHistoryRecordDao() {
		return historyRecordDao;
	}

	public void setHistoryRecordDao(HistoryRecordDao historyRecordDao) {
		this.historyRecordDao = historyRecordDao;
	}
	


}
