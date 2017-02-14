package com.paxonpilot.dgtransport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainViewController extends BaseController{
	
	@RequestMapping("/sys/mainview")
	public String mainList(HttpServletRequest request){
		return "/main";
	}
	
	@RequestMapping("/history")
	public String historyList(){
		return "/history";
	}
}
