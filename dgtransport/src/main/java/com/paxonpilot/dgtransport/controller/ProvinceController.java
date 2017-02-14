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
public class ProvinceController extends BaseController{
	
	@RequestMapping(value="/provinceEdit")
	public String provinceEdit(){
		return "provinceedit";
	}

}
