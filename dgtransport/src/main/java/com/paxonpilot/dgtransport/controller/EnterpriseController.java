package com.paxonpilot.dgtransport.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paxonpilot.dgtransport.annotation.ControllerLogDesc;
import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.Street;
import com.paxonpilot.dgtransport.service.DictionaryServiceImpl;
import com.paxonpilot.dgtransport.service.EnterpriceSerivceImpl;
import com.paxonpilot.dgtransport.service.StreetServiceImpl;
import com.paxonpilot.dgtransport.util.Page;

@Controller
public class EnterpriseController extends BaseController {
	
	@Autowired
	private EnterpriceSerivceImpl enterpriceSerivce;
	@Autowired
	private StreetServiceImpl streetService;
	@Autowired
	private DictionaryServiceImpl dictionaryService;
	
	@RequestMapping(value="/sys/enterpriceSearch")
	@ResponseBody
	@ControllerLogDesc(description="企业搜索操作")
	public Map<String,Object> seachByKey(Enterprise enterprise,@RequestParam Integer iDisplayLength,@RequestParam Integer iDisplayStart){
		Page page = enterpriceSerivce.getByEntity(enterprise,iDisplayLength,iDisplayStart);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("iTotalRecords", page.getTotalCount());
		map.put("sEcho",0);
		map.put("iTotalDisplayRecords", page.getTotalCount());
		map.put("aaData",  page.getDatas());
		map.put("iDisplayStart", page.getStartIndex());
		map.put("iDisplayLength", page.getPageSize());
		return map;
	}
	
	@RequestMapping(value="/sys/enDelete")
	@ResponseBody
	@ControllerLogDesc(description="企业删除操作")
	public Map<String,Object> delEnterprise(String ids){
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			enterpriceSerivce.delEntitys(ids);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/enterpriceSave") 
	@ResponseBody
	@ControllerLogDesc(description="企业保存操作")
	public Map<String,Object> addEnterprise(Enterprise enterprise){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			enterpriceSerivce.addEntity(enterprise);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/enterpriceUpd")
	@ResponseBody
	@ControllerLogDesc(description="企业更新操作")
	public Map<String,Object> updEnterprise(Enterprise enterprise){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			enterpriceSerivce.updateEntity(enterprise);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/enterpriceToupd")
	@ControllerLogDesc(description="进入更新页面")
	public ResponseEntity<Enterprise> toUpdEnterprise(@RequestParam Long id){
		return new ResponseEntity<Enterprise>(enterpriceSerivce.getById(id), HttpStatus.OK);
	}
	
	@RequestMapping(value="/sys/epTask")
	@ControllerLogDesc(description="企业重点通知")
	public String toEnterprise(@RequestParam Long state,@RequestParam String taskName,ModelMap map){
		String name = null;
		try {
			name = new String(taskName.getBytes("iso8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Dictionary> dicList = dictionaryService.getAll();
		List<Dictionary> epState = new ArrayList<Dictionary>();
		for(Dictionary dic : dicList){
			if(dic.getType()==1){
				epState.add(dic);
			}
		}
		map.addAttribute("taskState", state);
		map.addAttribute("taskName", name);
		map.addAttribute("epState", epState);
		map.addAttribute("streetList", streetService.getAll());
		return "enterpriseTask";
	}
	
	@RequestMapping(value="/sys/taskEpList")
	@ResponseBody
	@ControllerLogDesc(description="企业通知列表")
	public Map<String,Object> getEnterpriseTask(@RequestParam Integer taskState,@RequestParam String taskName,
			@RequestParam Integer iDisplayLength,@RequestParam Integer iDisplayStart){
		Page page = enterpriceSerivce.getEntityBySql(taskState,taskName,iDisplayLength,iDisplayStart);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("iTotalRecords", page.getTotalCount());
		map.put("sEcho",0);
		map.put("iTotalDisplayRecords", page.getTotalCount());
		map.put("aaData",  page.getDatas());
		map.put("iDisplayStart", page.getStartIndex());
		map.put("iDisplayLength", page.getPageSize());
		return map;
	}
	
	public EnterpriceSerivceImpl getEnterpriceSerivce() {
		return enterpriceSerivce;
	}

	public void setEnterpriceSerivce(EnterpriceSerivceImpl enterpriceSerivce) {
		this.enterpriceSerivce = enterpriceSerivce;
	}

	public StreetServiceImpl getStreetService() {
		return streetService;
	}

	public void setStreetService(StreetServiceImpl streetService) {
		this.streetService = streetService;
	}

	public DictionaryServiceImpl getDictionaryService() {
		return dictionaryService;
	}

	public void setDictionaryService(DictionaryServiceImpl dictionaryService) {
		this.dictionaryService = dictionaryService;
	}
}
