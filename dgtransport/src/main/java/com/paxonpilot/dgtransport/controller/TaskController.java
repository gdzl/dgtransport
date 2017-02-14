package com.paxonpilot.dgtransport.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paxonpilot.dgtransport.entity.Task;
import com.paxonpilot.dgtransport.service.TaskServiceImpl;

@Controller
public class TaskController extends BaseController{
	@Autowired
	private TaskServiceImpl taskSerivce;
	
	@RequestMapping(value="/getEpTask")
	@ResponseBody
	public Map<String,Object> getEpTask(@RequestParam Integer entityType){
		Object[] obj = new Object[]{entityType};
		//List<Task> taskList = taskSerivce.getByMap(obj);
		List<Task> taskList = taskSerivce.getByEntityType(entityType);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", taskList);
		map.put("size", taskList.size());
		return map;
	}

	@RequestMapping(value="/getEpTest")
	@ResponseBody
	public void getEpTaskTest(){
		taskSerivce.doEmpJob();
	}


	public TaskServiceImpl getTaskSerivce() {
		return taskSerivce;
	}

	public void setTaskSerivce(TaskServiceImpl taskSerivce) {
		this.taskSerivce = taskSerivce;
	}
}
