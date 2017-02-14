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
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.service.ModelServiceImpl;
import com.paxonpilot.dgtransport.service.RoleServiceImpl;
import com.paxonpilot.dgtransport.service.UserServiceImpl;
import com.paxonpilot.dgtransport.util.Page;

@Controller
public class UserController extends BaseController{
	
	@Autowired
	public RoleServiceImpl roleService;
	@Autowired
	public UserServiceImpl userService;
	
	@RequestMapping(value="/user")
	public String userList(User user,@RequestParam(required=false,defaultValue="20") Integer iDisplayLength,
			@RequestParam(required=false,defaultValue="0") Integer iDisplayStart,ModelMap map,
			@RequestParam(required=false,defaultValue="1") Integer currentPage){
		Page page = userService.getByEntity(user, iDisplayLength, iDisplayStart,currentPage);
		map.addAttribute("page",page);
		return "user";
	}
	
	@RequestMapping(value="/userEdit")
	public String userEdit(ModelMap map){
		List<Role> list = roleService.getAll();
		map.addAttribute("role", list);
		return "useredit";
	}
	
	@RequestMapping(value="/userSave") 
	@ResponseBody
	public Map<String,Object> addUser(User user){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			userService.addEntity(user);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "failed");
		}
		return map;
	}
	
	@RequestMapping(value="/userToEdit")
	public String userToEdit(@RequestParam Long id,ModelMap map){
		return "roleedit";
	}
	
	@RequestMapping(value="/userDel")
	@ResponseBody
	public Map<String,Object> delUser(@RequestParam Long id){
		Map<String,Object> map = new HashMap<String,Object>();
		return map;
	}
	
	@RequestMapping(value="/userUpd") 
	@ResponseBody
	public Map<String,Object> updUser(User user){
		Map<String,Object> map = new HashMap<String,Object>();
		return map;
	}

	public RoleServiceImpl getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleServiceImpl roleService) {
		this.roleService = roleService;
	}

	public UserServiceImpl getUserService() {
		return userService;
	}

	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}

}
