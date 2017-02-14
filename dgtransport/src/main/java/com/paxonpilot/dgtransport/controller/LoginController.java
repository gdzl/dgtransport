package com.paxonpilot.dgtransport.controller;


import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.service.LoginServiceImpl;
import com.paxonpilot.dgtransport.util.AppContant;


@Controller
public class LoginController extends BaseController{
	
	@Autowired
	public LoginServiceImpl loginService;
	
	@RequestMapping(value="/sys/login")
	public ModelAndView login(HttpServletRequest request,User user){
		
		ModelAndView mav = new ModelAndView();
		String userName = user.getUserName();
		String password = user.getPassword();
		Object[] objs = new Object[]{userName};
		User dbUser = loginService.getLoginInfo(objs);
		//权限查询
		List authorityList= loginService.getLoginAllInfo(objs);
		mav.setViewName("forward:/index.jsp");
		if(dbUser==null){
			mav.addObject("msg", "用户名不存在");
		}else if(!password.equals(dbUser.getPassword())){
			mav.addObject("msg", "密码不正确");
		}else{
			setUserSession(request,dbUser,authorityList);
			//request.getSession().setAttribute(AppContant.USER_CONTEXT, dbUser);
			String toUrl = (String)request.getSession().getAttribute(AppContant.LOGIN_PATH);
			if(StringUtils.isEmpty(toUrl)){
				toUrl = "/sys/mainview";
			}
 		    mav.setViewName("redirect:"+toUrl);

		}
		return mav;
	}

	public LoginServiceImpl getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginServiceImpl loginService) {
		this.loginService = loginService;
	}

}
