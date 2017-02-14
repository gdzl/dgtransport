package com.paxonpilot.dgtransport.controller;

import java.util.HashMap;
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
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.service.ModelServiceImpl;
import com.paxonpilot.dgtransport.util.Page;

@Controller
public class ModelController extends BaseController{
	
	@Autowired
	public ModelServiceImpl modelService;
	
	@RequestMapping(value="/model")
	@ControllerLogDesc(description="模块列表")
	public String modelList(SubSystem model,@RequestParam(required=false,defaultValue="20") Integer iDisplayLength,
			@RequestParam(required=false,defaultValue="0") Integer iDisplayStart,ModelMap map,
			@RequestParam(required=false,defaultValue="1") Integer currentPage){
		Page page = modelService.getByEntity(model, iDisplayLength, iDisplayStart,currentPage);
		map.addAttribute("page",page);
		return "model";
	}
	
	@RequestMapping(value="/modeledit")
	@ControllerLogDesc(description="进入模块新增页面")
	public String modelEdit(){
		return "modeledit";
	}
	
	@RequestMapping(value="/modelSave") 
	@ResponseBody
	@ControllerLogDesc(description="模块保存操作")
	public Map<String,Object> addModel(SubSystem model){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			modelService.addEntity(model);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	@RequestMapping(value="/modelToEdit")
	@ControllerLogDesc(description="进入模块修改页面")
	public String modelToEdit(@RequestParam Long id,ModelMap map){
		SubSystem model = modelService.getById(id);
		map.addAttribute("model", model);
		return "modeledit";
	}
	
	@RequestMapping(value="/modelDel")
	@ResponseBody
	@ControllerLogDesc(description="模块删除操作")
	public Map<String,Object> delMode(@RequestParam Long id){
		Map<String,Object> map = new HashMap<String,Object>();
		SubSystem model = modelService.getById(id);
		try {
			modelService.deleteEntity(model);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "failed");
		}
		return map;
	}
	
	@RequestMapping(value="/modelUpd") 
	@ResponseBody
	@ControllerLogDesc(description="模块更新操作")
	public Map<String,Object> updModel(SubSystem model){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			modelService.updateEntity(model);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}

	public ModelServiceImpl getModelService() {
		return modelService;
	}

	public void setModelService(ModelServiceImpl modelService) {
		this.modelService = modelService;
	}

}
