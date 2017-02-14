package com.paxonpilot.dgtransport.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.paxonpilot.dgtransport.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paxonpilot.dgtransport.annotation.ControllerLogDesc;
import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.City;
import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.entity.Employee;
import com.paxonpilot.dgtransport.entity.Province;
import com.paxonpilot.dgtransport.util.Page;

/**
 * @author zhr
 *
 */
@Controller
public class EmployeeController extends BaseController {
	
	@Autowired
	private EmployeeSerivceImpl employeeSerivce; 
	
	@Autowired
	private DictionaryServiceImpl dictionaryService;



	@Autowired
	private EnterpriceSerivceImpl enterpriceSerivce;
	
	@Autowired
	private ProvinceServiceImpl provinceService;
	
	@Autowired
	private StreetServiceImpl streetService;
	
	@Autowired
	private CityServiceImpl cityService;
	
	private Employee employee = new Employee();
	
	
	@RequestMapping(value="/sys/employeeSearch") 
	@ControllerLogDesc(description="人员搜索操作")
	@ResponseBody
	public Map<String,Object> seachByKey(Employee employee,@RequestParam Integer iDisplayLength,@RequestParam Integer iDisplayStart,@RequestParam(required=false) Integer cityNo){
		Page page = employeeSerivce.getByEntity(employee,iDisplayLength,iDisplayStart,cityNo);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("iTotalRecords", page.getTotalCount());
		map.put("sEcho",0);
		map.put("iTotalDisplayRecords", page.getTotalCount());
		map.put("aaData",  page.getDatas());
		map.put("iDisplayStart", page.getStartIndex());
		map.put("iDisplayLength", page.getPageSize());
		return map;
	}
	
	@RequestMapping(value="/sys/employeeSave")
	@ControllerLogDesc(description="人员保存操作")
	@ResponseBody
	public Map<String,Object> addEmployee(Employee employee){
		Map<String,Object> map = new HashMap<String,Object>();
		try {

			if(employee.getEpNo() != 0){
				if(employee.getEpName() == null || "".equals(employee.getEpName())) {
					Long epNo = employee.getEpNo();
					String epName = enterpriceSerivce.getUinoEpName(epNo);
					employee.setEpName(epName);
				}
			}
			employeeSerivce.addEntity(employee);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}


	/**
	 * @人员批量删除操作
	 * 
	 */
	@RequestMapping(value="/sys/empDelete")
	@ResponseBody
	@ControllerLogDesc(description="人员删除操作")
	public Map<String,Object> delEnterprise(String ids){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			employeeSerivce.delEntitys(ids);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/employeeUpd") 
	@ControllerLogDesc(description="人员更新操作")
	@ResponseBody
	public Map<String,Object> updCar(Employee employee){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			if(employee.getEpName() == null || "".equals(employee.getEpName())|| " ".equals(employee.getEpName())) {
				Long epNo = employee.getEpNo();
				String epName = enterpriceSerivce.getUinoEpName(epNo);
				employee.setEpName(epName);
			}
			employeeSerivce.updateEntity(employee);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/employeeToupd")
	@ControllerLogDesc(description="进入人员更新页面")
	public ResponseEntity<Map<String,Object>> toUpdCar(@RequestParam Long id){
		Map<String,Object> map = employeeSerivce.getEmployeeStreetById(id);
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value="/sys/validateIdentityNo")
	@ResponseBody
	public Map<String,Object> validateNo(@RequestParam String identityNo){
		Object[] params = new Object[]{identityNo};
		Map<String,Object> map = new HashMap<String,Object>();
		boolean isExists= employeeSerivce.validateNo(params);
		if(isExists==true){
			map.put("msg", "已存在该身份证号");
		}
		return map;
	}
	
	@RequestMapping(value="/sys/empTask")
	@ControllerLogDesc(description="人员重点通知")
	public String toEmployee(@RequestParam Long state,@RequestParam String taskName,ModelMap map){
		String name = null;
		try {
			name = new String(taskName.getBytes("iso8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Dictionary> dicList = dictionaryService.getAll();
		List<Dictionary> empState = new ArrayList<Dictionary>();
		for(Dictionary dic : dicList){
			if(dic.getType()==4){
				empState.add(dic);
			}
		}
		map.addAttribute("taskState", state);
		map.addAttribute("taskName", name);
		map.addAttribute("empState", empState);
		map.addAttribute("provinceList", provinceService.getAll());
		map.addAttribute("cityList", cityService.getAll());
		map.addAttribute("streetList", streetService.getAll());
		return "employeeTask";
	}
	
	@RequestMapping(value="/sys/taskEmpList")
	@ResponseBody
	@ControllerLogDesc(description="人员通知列表")
	public Map<String,Object> getEmpTask(@RequestParam Integer taskState,@RequestParam String taskName,
			@RequestParam Integer iDisplayLength,@RequestParam Integer iDisplayStart){
		Page page = employeeSerivce.getEntityBySql(taskState,taskName,iDisplayLength,iDisplayStart);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("iTotalRecords", page.getTotalCount());
		map.put("sEcho",0);
		map.put("iTotalDisplayRecords", page.getTotalCount());
		map.put("aaData",  page.getDatas());
		map.put("iDisplayStart", page.getStartIndex());
		map.put("iDisplayLength", page.getPageSize());
		return map;
	}

	public EmployeeSerivceImpl getEmployeeSerivce() {
		return employeeSerivce;
	}


	public void setEmployeeSerivce(EmployeeSerivceImpl employeeSerivce) {
		this.employeeSerivce = employeeSerivce;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public DictionaryServiceImpl getDictionaryService() {
		return dictionaryService;
	}

	public void setDictionaryService(DictionaryServiceImpl dictionaryService) {
		this.dictionaryService = dictionaryService;
	}

	public ProvinceServiceImpl getProvinceService() {
		return provinceService;
	}

	public void setProvinceService(ProvinceServiceImpl provinceService) {
		this.provinceService = provinceService;
	}

	public CityServiceImpl getCityService() {
		return cityService;
	}

	public void setCityService(CityServiceImpl cityService) {
		this.cityService = cityService;
	}

	public StreetServiceImpl getStreetService() {
		return streetService;
	}

	public void setStreetService(StreetServiceImpl streetService) {
		this.streetService = streetService;
	}

	public EnterpriceSerivceImpl getEnterpriceSerivce() {
		return enterpriceSerivce;
	}

	public void setEnterpriceSerivce(EnterpriceSerivceImpl enterpriceSerivce) {
		this.enterpriceSerivce = enterpriceSerivce;
	}
}
