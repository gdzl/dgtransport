package com.paxonpilot.dgtransport.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paxonpilot.dgtransport.service.ReportServiceImpl;

@Controller
public class ReportController extends BaseController {
	
	@Autowired
	private ReportServiceImpl reportService;
	
	@RequestMapping("/sys/totalview")
	public String toReport(){
		return "tongjifenxi";
	}
	
	@RequestMapping("/sys/getEpTotal")
	@ResponseBody
	public List<Map<String,Object>> getEpTotal(){
		List<Object[]> objs = reportService.getEpTotal();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		for(Object[] o:objs){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("name", o[1]);
			map.put("total", o[0]);
			list.add(map);
		}
		return list;
	}

	public ReportServiceImpl getReportService() {
		return reportService;
	}

	public void setReportService(ReportServiceImpl reportService) {
		this.reportService = reportService;
	}

	
}
