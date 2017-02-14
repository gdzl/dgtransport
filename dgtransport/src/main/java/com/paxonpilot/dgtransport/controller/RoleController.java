package com.paxonpilot.dgtransport.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paxonpilot.dgtransport.annotation.ControllerLogDesc;
import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.service.ModelServiceImpl;
import com.paxonpilot.dgtransport.service.RoleServiceImpl;
import com.paxonpilot.dgtransport.util.Page;

@Controller
public class RoleController extends BaseController{
	
	@Autowired
	public RoleServiceImpl roleService;
	
	@Autowired
	public ModelServiceImpl modelService;
	
	@RequestMapping(value="/role")
	public String roleList(Role role,@RequestParam(required=false,defaultValue="20") Integer iDisplayLength,
			@RequestParam(required=false,defaultValue="0") Integer iDisplayStart,ModelMap map,
			@RequestParam(required=false,defaultValue="1") Integer currentPage){
		Page page = roleService.getByEntity(role, iDisplayLength, iDisplayStart,currentPage);
		map.addAttribute("page",page);
		return "role";
	}
	
	@RequestMapping(value="/roleEdit")
	public String roleEdit(ModelMap map){
		List<SubSystem> list = modelService.getAll();
		map.addAttribute("list", list);
		return "roleedit";
	}
	
	@RequestMapping(value="/roleSave") 
	@ResponseBody
	public Map<String,Object> addRole(Role role){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			roleService.addEntity(role);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "failed");
		}
		return map;
	}
	
	@RequestMapping(value="/roleToEdit")
	public String roleToEdit(@RequestParam Long id,ModelMap map){
		Role role = roleService.getById(id);
		List<SubSystem> list = modelService.getAll();
		SubSystem model = modelService.getById(role.getSystemNo());
		map.addAttribute("list", list);
		map.addAttribute("role", role);
		map.addAttribute("model", model);
		return "roleedit";
	}
	
	@RequestMapping(value="/roleDel")
	@ResponseBody
	public Map<String,Object> delRole(@RequestParam Long id){
		Map<String,Object> map = new HashMap<String,Object>();
		Role role = roleService.getById(id);
		try {
			roleService.deleteEntity(role);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "failed");
		}
		return map;
	}
	
	@RequestMapping(value="/roleUpd") 
	@ResponseBody
	public Map<String,Object> updRole(Role role){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			roleService.updateEntity(role);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "failed");
		}
		return map;
	}

	public RoleServiceImpl getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleServiceImpl roleService) {
		this.roleService = roleService;
	}

	public ModelServiceImpl getModelService() {
		return modelService;
	}

	public void setModelService(ModelServiceImpl modelService) {
		this.modelService = modelService;
	}

}
