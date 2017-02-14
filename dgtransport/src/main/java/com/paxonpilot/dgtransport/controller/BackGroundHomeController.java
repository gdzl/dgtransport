package com.paxonpilot.dgtransport.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BackGroundHomeController extends BaseController{
	
	@RequestMapping(value="/bghome")
	public String bgHome(){
		
		return "background";
	}

	@RequestMapping(value="/leftmenu")
	public String leftMenu(){
		
		return "leftmenu";
	}
	
	@RequestMapping(value="/middle")
	public String middleMenu(){
		
		return "middle";
	}
	
	@RequestMapping(value="/top")
	public String topMenu(){
		
		return "top";
	}
	
	@RequestMapping(value="/province")
	public String provinceList(){
		
		return "provincemanager";
	}
	
	
	
}
