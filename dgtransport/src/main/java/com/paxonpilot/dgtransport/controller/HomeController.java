package com.paxonpilot.dgtransport.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.service.CityServiceImpl;
import com.paxonpilot.dgtransport.service.DictionaryServiceImpl;
import com.paxonpilot.dgtransport.service.EnterpriceSerivceImpl;
import com.paxonpilot.dgtransport.service.ProvinceServiceImpl;
import com.paxonpilot.dgtransport.service.StreetServiceImpl;

@Controller
public class HomeController extends BaseController {
	
	@Autowired
	private StreetServiceImpl streetService;
	
	@Autowired
	private DictionaryServiceImpl dictionaryService;
	
	@Autowired
	private EnterpriceSerivceImpl enterpriceSerivce;
	
	@Autowired
	private ProvinceServiceImpl provinceService;
	
	@Autowired
	private CityServiceImpl cityService;
	
	@RequestMapping("/sys/homeview")
	public String toHome(ModelMap model){
		List<Dictionary> dicList = dictionaryService.getAll();
		List<Dictionary> epState = new ArrayList<Dictionary>();
		List<Dictionary> color = new ArrayList<Dictionary>();
		List<Dictionary> carState = new ArrayList<Dictionary>();
		List<Dictionary> empState = new ArrayList<Dictionary>();
		for(Dictionary dic : dicList){
			if(dic.getType()==1){
				epState.add(dic);
			}else if(dic.getType()==2){
				color.add(dic);
			}else if(dic.getType()==3){
				carState.add(dic);
			}else if(dic.getType()==4){
				empState.add(dic);
			}
		}
		
		model.addAttribute("epNameList", enterpriceSerivce.getEpName());
		model.addAttribute("provinceList", provinceService.getAll());
		model.addAttribute("cityList", cityService.getAll());
		model.addAttribute("streetList", streetService.getAll());
		model.addAttribute("epState", epState);
		model.addAttribute("color", color);
		model.addAttribute("carState", carState);
		model.addAttribute("empState", empState);
		return "home";
	}

	public StreetServiceImpl getStreetService() {
		return streetService;
	}

	public void setStreetService(StreetServiceImpl streetService) {
		this.streetService = streetService;
	}

	public DictionaryServiceImpl getDictionaryService() {
		return dictionaryService;
	}

	public void setDictionaryService(DictionaryServiceImpl dictionaryService) {
		this.dictionaryService = dictionaryService;
	}

	public EnterpriceSerivceImpl getEnterpriceSerivce() {
		return enterpriceSerivce;
	}

	public void setEnterpriceSerivce(EnterpriceSerivceImpl enterpriceSerivce) {
		this.enterpriceSerivce = enterpriceSerivce;
	}

	public ProvinceServiceImpl getProvinceService() {
		return provinceService;
	}

	public void setProvinceService(ProvinceServiceImpl provinceService) {
		this.provinceService = provinceService;
	}

	public CityServiceImpl getCityService() {
		return cityService;
	}

	public void setCityService(CityServiceImpl cityService) {
		this.cityService = cityService;
	}
}
