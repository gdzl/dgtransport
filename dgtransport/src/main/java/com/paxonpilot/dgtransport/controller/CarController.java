package com.paxonpilot.dgtransport.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paxonpilot.dgtransport.annotation.ControllerLogDesc;
import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.service.CarSerivceImpl;
import com.paxonpilot.dgtransport.service.DictionaryServiceImpl;
import com.paxonpilot.dgtransport.util.Page;

@Controller
public class CarController extends BaseController {
	
	@Autowired
	private CarSerivceImpl carSerivce;
	
	@Autowired
	private DictionaryServiceImpl dictionaryService;
	
	
	@RequestMapping(value="/sys/carSearch")
	@ControllerLogDesc(description="车辆搜索操作")
	@ResponseBody
	public Map<String,Object> seachByKey(Car car,@RequestParam Integer iDisplayLength,@RequestParam Integer iDisplayStart){
		Page page = carSerivce.getByEntity(car,iDisplayLength,iDisplayStart);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("iTotalRecords", page.getTotalCount());
		map.put("sEcho",0);
		map.put("iTotalDisplayRecords", page.getTotalCount());
		map.put("aaData",  page.getDatas());
		map.put("iDisplayStart", page.getStartIndex());
		map.put("iDisplayLength", page.getPageSize());
		return map;
	}

	@RequestMapping(value="/sys/carSave")
	@ControllerLogDesc(description="车辆保存操作")
	@ResponseBody
	public Map<String,Object> addCar(Car car){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			carSerivce.addEntity(car);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/carDelete")
	@ResponseBody
	@ControllerLogDesc(description="车辆删除操作")
	public Map<String,Object> delEnterprise(String ids){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			carSerivce.delEntitys(ids);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/carUpd")
	@ControllerLogDesc(description="车辆更新操作")
	@ResponseBody
	public Map<String,Object> updCar(Car car){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			carSerivce.updateEntity(car);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/carToupd") 
	@ControllerLogDesc(description="进入车辆更新页面")
	public ResponseEntity<Car> toUpdCar(@RequestParam Long id){
		return new ResponseEntity<Car>(carSerivce.getById(id), HttpStatus.OK);
	}
	
	@RequestMapping(value="/sys/carTask")
	@ControllerLogDesc(description="车辆重点通知")
	public String toEmployee(@RequestParam Long state,@RequestParam String taskName,ModelMap map){
		String name = null;
		try {
			name = new String(taskName.getBytes("iso8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Dictionary> dicList = dictionaryService.getAll();
		List<Dictionary> color = new ArrayList<Dictionary>();
		List<Dictionary> carState = new ArrayList<Dictionary>();
		for(Dictionary dic : dicList){
			if(dic.getType()==2){
				color.add(dic);
			}else if(dic.getType()==3){
				carState.add(dic);
			}
		}
		map.addAttribute("taskState", state);
		map.addAttribute("taskName", name);
		map.addAttribute("color", color);
		map.addAttribute("carState", carState);
		return "carTask";
	}
	
	@RequestMapping(value="/sys/taskCarList")
	@ResponseBody
	@ControllerLogDesc(description="车辆通知列表")
	public Map<String,Object> getCarTask(@RequestParam Integer taskState,@RequestParam String taskName,
			@RequestParam Integer iDisplayLength,@RequestParam Integer iDisplayStart){
		Page page = carSerivce.getEntityBySql(taskState,taskName,iDisplayLength,iDisplayStart);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("iTotalRecords", page.getTotalCount());
		map.put("sEcho",0);
		map.put("iTotalDisplayRecords", page.getTotalCount());
		map.put("aaData",  page.getDatas());
		map.put("iDisplayStart", page.getStartIndex());
		map.put("iDisplayLength", page.getPageSize());
		return map;
	}
	
	public CarSerivceImpl getCarSerivce() {
		return carSerivce;
	}


	public void setCarSerivce(CarSerivceImpl carSerivce) {
		this.carSerivce = carSerivce;
	}

	public DictionaryServiceImpl getDictionaryService() {
		return dictionaryService;
	}

	public void setDictionaryService(DictionaryServiceImpl dictionaryService) {
		this.dictionaryService = dictionaryService;
	}


}
