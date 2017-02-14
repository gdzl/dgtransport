package com.paxonpilot.dgtransport.controller;


import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.util.Assert;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.paxonpilot.dgtransport.entity.Employee;
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.util.AppContant;

public class BaseController {
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Employee.class, new CustomDateEditor(dateFormat, true));
	}
	
	public User getUserSession(HttpServletRequest request){
		return (User)request.getSession().getAttribute(AppContant.USER_CONTEXT);
	}
	
	public void setUserSession(HttpServletRequest request,User user,List list){
		request.getSession().setAttribute(AppContant.USER_CONTEXT, user);
		request.getSession().setAttribute("authorityList",list);
	}
	
	public String getAppbaseUrl(HttpServletRequest request,String url){
		Assert.hasLength(url,"url不能为空");
		Assert.isTrue(url.startsWith("/"),"必须以/开头");
		return request.getContextPath()+url;
	}
}
