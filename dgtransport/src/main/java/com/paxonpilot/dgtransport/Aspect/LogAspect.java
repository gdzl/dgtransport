package com.paxonpilot.dgtransport.Aspect;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.metadata.Scope;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.paxonpilot.dgtransport.annotation.ControllerLogDesc;
import com.paxonpilot.dgtransport.entity.HisRecord;
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.service.BusinessScopeServiceImpl;
import com.paxonpilot.dgtransport.service.HistoryRecordServiceImpl;
import com.paxonpilot.dgtransport.util.AppContant;


@Aspect
@Component
public class LogAspect {
	
	@Autowired
	public HistoryRecordServiceImpl historyRecordService;
	
	@Before("within(@org.springframework.stereotype.Controller *) && @annotation(log)")
	public void inLog(ControllerLogDesc log) throws Exception{
		ServletRequestAttributes atts = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest  request = atts.getRequest();
		String ip = request.getRemoteAddr();
		String desc = log.description();
		HisRecord record = new HisRecord();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(AppContant.USER_CONTEXT);
		record.setUserName(user.getcName());
		record.setIpAddress(ip);
		record.setOptContent(desc);
		record.setOptDate(new Date());
		record.setSystemName("危运行业档案管理系统");
		historyRecordService.addEntity(record);
	}

	public HistoryRecordServiceImpl getHistoryRecordService() {
		return historyRecordService;
	}

	public void setHistoryRecordService(HistoryRecordServiceImpl historyRecordService) {
		this.historyRecordService = historyRecordService;
	}

	
}
