package com.paxonpilot.dgtransport.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.service.HistoryRecordServiceImpl;
import com.paxonpilot.dgtransport.util.Page;

@Controller
public class HistoryRecordController extends BaseController{
	@Autowired
	private HistoryRecordServiceImpl historyRecordService;
	
	@RequestMapping(value="/sys/historySearch")
	@ResponseBody
	public Map<String,Object> getHistoryRecord(@RequestParam Integer iDisplayLength,
			@RequestParam Integer iDisplayStart,@RequestParam String begOptDate,
			@RequestParam String endOptDate){
		Map<String,Object> contentMap = new HashMap<String,Object>();
		contentMap.put("begOptDate", begOptDate);
		contentMap.put("endOptDate", endOptDate);
		Map<String,Object> map = new HashMap<String,Object>();
		Page page;
		try {
			page = historyRecordService.getByEntity(contentMap,iDisplayLength,iDisplayStart);
			map.put("iTotalRecords", page.getTotalCount());
			map.put("sEcho",0);
			map.put("iTotalDisplayRecords", page.getTotalCount());
			map.put("aaData",  page.getDatas());
			map.put("iDisplayStart", page.getStartIndex());
			map.put("iDisplayLength", page.getPageSize());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return map;
	}

	public HistoryRecordServiceImpl getHistoryRecordService() {
		return historyRecordService;
	}

	public void setHistoryRecordService(HistoryRecordServiceImpl historyRecordService) {
		this.historyRecordService = historyRecordService;
	}

}
