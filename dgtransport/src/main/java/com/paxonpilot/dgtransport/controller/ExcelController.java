package com.paxonpilot.dgtransport.controller;

import java.io.*;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.configuration.SystemConfiguration;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.paxonpilot.dgtransport.annotation.ControllerLogDesc;
import com.paxonpilot.dgtransport.entity.AnnexDetail;
import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.City;
import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.entity.Employee;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.Province;
import com.paxonpilot.dgtransport.exception.BusinessException;
import com.paxonpilot.dgtransport.service.AnnuxSerivceImpl;
import com.paxonpilot.dgtransport.service.CarSerivceImpl;
import com.paxonpilot.dgtransport.service.CityServiceImpl;
import com.paxonpilot.dgtransport.service.DictionaryServiceImpl;
import com.paxonpilot.dgtransport.service.EmployeeSerivceImpl;
import com.paxonpilot.dgtransport.service.EnterpriceSerivceImpl;
import com.paxonpilot.dgtransport.service.ProvinceServiceImpl;
import com.paxonpilot.dgtransport.util.AppContant;

import net.sf.json.JSONObject;

@Controller
public class ExcelController extends BaseController {

	@Autowired
	private EmployeeSerivceImpl employeeSerivce;

	@Autowired
	private EnterpriceSerivceImpl enterpriceSerivce;

	@Autowired
	private DictionaryServiceImpl dictionaryService;

	@Autowired
	private ProvinceServiceImpl provinceService;

	@Autowired
	private CityServiceImpl cityService;

	@Autowired
	private CarSerivceImpl carSerivce;

	@Autowired
	private AnnuxSerivceImpl annuxSerivce;

	@RequestMapping(value = "/sys/enterpriseXls")
	@ControllerLogDesc(description = "企业excel导出")
	public String enterpriseExport(@RequestParam String enterpriceIds, @RequestParam String epName,
								   @RequestParam String tpLicence, @RequestParam Long cityNo, @RequestParam Integer epState,
								   ModelMap modelMap) {
		Object[] param = null;
		if (!enterpriceIds.equals("")) {
			param = enterpriceIds.split(",");
		}
		List<Enterprise> enterpriseList = new ArrayList<Enterprise>();
		try {
			enterpriseList = enterpriceSerivce.getByIds(epName, tpLicence, cityNo, epState, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("list", enterpriseList);
		return "enterpriseXls";
	}

	@RequestMapping(value = "/sys/enterpriseTaskXls")
	@ControllerLogDesc(description = "企业通知excel导出")
	public String enterpriseTaskExport(@RequestParam Integer taskState, @RequestParam String taskName,
									   @RequestParam String enterpriceIds, ModelMap modelMap) {
		String name = null;
		try {
			name = new String(taskName.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List enterpriseList = enterpriceSerivce.getEntityBySql(taskState, name, enterpriceIds);
		modelMap.addAttribute("list", enterpriseList);
		modelMap.addAttribute("task", "enterprise");
		return "enterpriseXls";
	}

	@RequestMapping(value = "/sys/carXls")
	@ControllerLogDesc(description = "车辆excel导出")
	public String carExport(@RequestParam String carNo, @RequestParam String carIds, @RequestParam String transportNo,
							@RequestParam String carColor, @RequestParam String epName, @RequestParam Integer carState,
							ModelMap modelMap) {
		Object[] param = null;
		if (!carIds.equals("")) {
			param = carIds.split(",");
		}
		List<Car> carList = new ArrayList<Car>();
		try {
			carList = carSerivce.getByIds(carNo, transportNo, carColor, epName, carState, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("list", carList);
		return "carXls";
	}

	@RequestMapping(value = "/sys/carTaskXls")
	@ControllerLogDesc(description = "车辆通知excel导出")
	public String carTaskExport(@RequestParam Integer taskState, @RequestParam String taskName,
								@RequestParam String carIds, ModelMap modelMap) {
		String name = null;
		try {
			name = new String(taskName.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List carList = carSerivce.getEntityBySql(taskState, name, carIds);
		modelMap.addAttribute("list", carList);
		modelMap.addAttribute("task", "car");
		return "carXls";
	}

	@RequestMapping(value = "/sys/employeeXls")
	@ControllerLogDesc(description = "人员excel导出")
	public String employeeExport(@RequestParam String name, @RequestParam String employeeIds,
								 @RequestParam String epName, @RequestParam String identityNo, @RequestParam Long cityNo,
								 @RequestParam Integer empState, ModelMap modelMap) {
		Object[] param = null;
		if (!employeeIds.equals("")) {
			param = employeeIds.split(",");
		}
		List<String> employeeList = new ArrayList<String>();
		try {
			employeeList = employeeSerivce.getByIds(name, epName, identityNo, cityNo, empState, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("list", employeeList);
		modelMap.addAttribute("task", "employee");
		return "employeeXls";
	}

	@RequestMapping(value = "/sys/employeeTaskXls")
	@ControllerLogDesc(description = "人员重点通知excel导出")
	public String employeeTaskExport(@RequestParam Integer taskState, @RequestParam String taskName,
									 @RequestParam String employeeIds, ModelMap modelMap) {
		String name = null;
		try {
			name = new String(taskName.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List employeeList = employeeSerivce.getEntityBySql(taskState, name, employeeIds);
		modelMap.addAttribute("list", employeeList);
		modelMap.addAttribute("task", "employee");
		return "employeeXls";
	}

	@RequestMapping(value = "/sys/enModelXls")
	@ControllerLogDesc(description = "企业excel模板导出")
	public String enterpriseModelExport(ModelMap modelMap) {
		return "enModelXls";
	}

	@RequestMapping(value = "/sys/carModelXls")
	@ControllerLogDesc(description = "车辆excel模板导出")
	public String carModelExport(ModelMap modelMap) {
		return "carModelXls";
	}

	@RequestMapping(value = "/sys/empModelXls")
	@ControllerLogDesc(description = "人员excel模板导出")
	public String empModelExport(ModelMap modelMap) {
		return "empModelXls";
	}

	@RequestMapping(value = "/sys/epExcelImport")
	@ControllerLogDesc(description = "企业excel导入")
	public String enterpriseUpload(@RequestParam("epExcel") MultipartFile epExcel, HttpServletRequest request,
								   HttpServletResponse response) {
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		HSSFWorkbook book = null;
		List<Enterprise> epList = new ArrayList<Enterprise>();
		Map<String, Object> msg = new HashMap<String, Object>();
		PrintWriter out = null;
		int i = 0;
		short j = 0;
		Object[] params = new Object[] { 1 };

		List<Dictionary> diclist = dictionaryService.getByMap(params);

		Map<String, Integer> map = new HashMap<String, Integer>();
		for (Dictionary dic : diclist) {
			map.put(dic.getDictionaryName(), Integer.valueOf(dic.getId().toString()));
		}

		List epLists = enterpriceSerivce.getEpName();

		Map<String, Integer> epmap = new HashMap<String, Integer>();
		for (int z = 0; z < epLists.size(); z++) {
			Object[] objs = (Object[]) epLists.get(z);
			epmap.put(objs[1].toString(), Integer.valueOf(objs[0].toString()));
		}
		Map<String, Long> streetMap = AppContant.STREETNO;
		try {
			out = response.getWriter();
			book = new HSSFWorkbook(epExcel.getInputStream());
			HSSFSheet sheet = book.getSheetAt(0);
			for (i = 1; i <= sheet.getLastRowNum(); i++) {
				Enterprise ep = new Enterprise();
				HSSFRow row = sheet.getRow(i);
				for (j = 0; j < row.getLastCellNum(); j++) {
					HSSFCell cell = row.getCell((int) j);
					//解决导入数据部分字段为空也能正常导入
					if (cell != null) {
						cell.setCellType(Cell.CELL_TYPE_STRING);

						if (j == 0) {
							ep.setEpNo(cell.getStringCellValue());

						} else if (j == 1) {
							String epName = cell.getStringCellValue();
							if (epmap.get(epName) != null) {
								throw new BusinessException("企业名称已存在");
							}
							if (epName !=null && !epName.equals("")) {
								ep.setEpName(epName);
							}else {
								break;
							}

						} else if (j == 2) {
							ep.setAddress(cell.getStringCellValue());
						} else if (j == 3) {
							ep.setScopeName(cell.getStringCellValue());
						} else if (j == 4) {
							ep.setTpLicence(cell.getStringCellValue());
						} else if (j == 5) {
							ep.setIcLicence(cell.getStringCellValue());
						} else if (j == 6) {
							ep.setCorporation(cell.getStringCellValue());
						} else if (j == 7) {
							ep.setCorcontact(cell.getStringCellValue());
						} else if (j == 8) {
							ep.setBusinessor(cell.getStringCellValue());
						} else if (j == 9) {
							ep.setContact(cell.getStringCellValue());
						} else if (j == 10) {
							ep.setCityNo(streetMap.get(cell.getStringCellValue()));
						} else if (j == 11) {
							ep.setEpState(map.get(cell.getStringCellValue()));
						}
					}
				}
				if (ep.getEpName() !=null && !ep.getEpName().equals("")){
					epList.add(ep);
				}
			}
			msg.put("msg", "success");
		} catch (Exception e) {

			e.printStackTrace();
			msg.put("msg", "faild");
			msg.put("detail", "第" + (i + 1) + "行，第" + (j + 1) + "列数据有问题，" + e.getMessage() + "，请检查修正后再导入");
			epList = null;
		}
		try {
			if (epList != null) {

				enterpriceSerivce.batchSave(epList);
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg.put("msg", "faild");

			msg.put("detail", "保存出错" + e.getMessage() + "，请联系管理员");
		}
		out.print(JSONObject.fromObject(msg).toString());
		return null;
	}

	@RequestMapping(value = "/sys/carExcelImport")
	@ControllerLogDesc(description = "车辆excel导入")
	public String carUpload(@RequestParam("carExcel") MultipartFile carExcel, HttpServletRequest request,
							HttpServletResponse response) {
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		HSSFWorkbook book = null;
		List<Car> carList = new ArrayList<Car>();
		Map<String, Object> msg = new HashMap<String, Object>();
		PrintWriter out = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		int i = 0;
		short j = 0;
		Object[] params = new Object[] { 2, 3 };

		List<Dictionary> diclist = dictionaryService.getByIn(params);

		Map<String, Integer> map = new HashMap<String, Integer>();
		for (Dictionary dic : diclist) {

			map.put(dic.getDictionaryName(), Integer.valueOf(dic.getId().toString()));
		}
		// 不应该以车辆信息来判断么？
		List epList = enterpriceSerivce.getEpName();

		Map<String, Integer> epmap = new HashMap<String, Integer>();
		for (int z = 0; z < epList.size(); z++) {
			Object[] objs = (Object[]) epList.get(z);

			epmap.put(objs[1].toString(), Integer.valueOf(objs[0].toString()));
		}
		try {
			out = response.getWriter();
			book = new HSSFWorkbook(carExcel.getInputStream());
			HSSFSheet sheet = book.getSheetAt(0);
			for (i = 1; i <= sheet.getLastRowNum(); i++) {
				Car car = new Car();
				HSSFRow row = sheet.getRow(i);
				for (j = 0; j < row.getLastCellNum(); j++) {
					HSSFCell cell = row.getCell((int) j);
					//解决导入数据部分字段为空也能正常导入
					if (cell != null) {
						cell.setCellType(Cell.CELL_TYPE_STRING);

						if (j == 0) {
							//20161227
							if (cell.getStringCellValue() !=null && !cell.getStringCellValue().equals("")) {
								car.setCarNo(cell.getStringCellValue());
							}else {
								break;
							}
						} else if (j == 1) {

							car.setCarColor(map.get(cell.getStringCellValue()).toString());
							// car.setCarColor(cell.getStringCellValue().toString());
						} else if (j == 2) {
							String epName = cell.getStringCellValue();
							// 不在企业信息中存在则不能有车辆信息？
							if (epmap.get(epName) == null) {
								throw new BusinessException("企业名称不存在");
							} else {
								car.setEpName(epName);
								car.setEpNo(epmap.get(epName).longValue());
							}
						} else if (j == 3) {
							car.setTransportNo(cell.getStringCellValue());
						} else if (j == 4) {
							car.setScopeName(cell.getStringCellValue());
						} else if (j == 5) {
							car.setCarTypeName(cell.getStringCellValue());
						} else if (j == 6) {
							car.setBrandNo(cell.getStringCellValue());
						} else if (j == 7) {
							car.setVin(cell.getStringCellValue());
						} else if (j == 8) {
							car.setEngineNo(cell.getStringCellValue());
						} else if (j == 9) {
							car.setEngineStyle(cell.getStringCellValue());
						} else if (j == 10) {
							String regDate = cell.getStringCellValue();
							if (!regDate.equals("")) {
								car.setRegDate(sdf.parse(cell.getStringCellValue()));
							} else {
								car.setRegDate(null);
							}
						} else if (j == 11) {
							String scrapDate = cell.getStringCellValue();
							if (!scrapDate.equals("")) {
								car.setScrapDate(sdf.parse(cell.getStringCellValue()));
							} else {
								car.setScrapDate(null);
							}

						} else if (j == 12) {
							car.setCarState(map.get(cell.getStringCellValue()));
						}
					}
				}
				if (car.getEpNo() != null && !car.equals("")) {
					carList.add(car);
				}
			}
			msg.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			msg.put("msg", "faild");
			// System.out.println("catchcolor"+carList.get(0).getCarColor());
			msg.put("detail", "第" + (i + 1) + "行，第" + (j + 1) + "列数据有问题，" + e.getMessage() + "，请检查后再导入");
			carList = null;
		}
		if (carList != null) {
			for (Car car : carList) {
				try {

					carSerivce.addEntity(car);
				} catch (Exception e) {
					e.printStackTrace();
					msg.put("msg", "faild");
					msg.put("detail", "保存出错，请联系管理员");
				}
			}
		}
		out.print(JSONObject.fromObject(msg).toString());
		return null;
	}

	@RequestMapping(value = "/sys/employeeExcelImport")
	@ControllerLogDesc(description = "人员excel导入")
	public String employeeUpload(@RequestParam("employeeExcel") MultipartFile employeeExcel, HttpServletRequest request,
								 HttpServletResponse response) {

		List<Province> pvnList = provinceService.getAll();// pvn

		Map<String, Long> pvnMap = new HashMap<String, Long>();

		for (Province pvn : pvnList) {
			pvnMap.put(pvn.getProvinceName(), pvn.getId());
		}

		List<City> ctyList = cityService.getAll();// city

		Map<String, Long> ctyMap = new HashMap<String, Long>();
		for (City cty : ctyList) {
			ctyMap.put(cty.getCityName(), cty.getId());
		}
		Object[] params = new Object[] { 4 };

		List<Dictionary> diclist = dictionaryService.getByMap(params);// dictionary

		Map<String, Integer> map = new HashMap<String, Integer>();
		for (Dictionary dic : diclist) {
			map.put(dic.getDictionaryName(), Integer.valueOf(dic.getId().toString()));
		}

		List epList = enterpriceSerivce.getEpName();// enterprice

		Map<String, Integer> epmap = new HashMap<String, Integer>();
		for (int z = 0; z < epList.size(); z++) {
			Object[] objs = (Object[]) epList.get(z);
			epmap.put(objs[1].toString(), Integer.valueOf(objs[0].toString()));
		}

		List<String> idNoList = employeeSerivce.getIdentityNo();// employeeid

		List<String> exsistList = new ArrayList<String>();
		Map<Integer, String> property = AppContant.PROPERTY;// street 驾驶员
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		HSSFWorkbook book = null;
		List<Employee> empList = new ArrayList<Employee>();
		Map<String, Object> msg = new HashMap<String, Object>();
		PrintWriter out = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int i = 0;
		short j = 0;
		try {
			out = response.getWriter();
			book = new HSSFWorkbook(employeeExcel.getInputStream());
			HSSFSheet sheet = book.getSheetAt(0);
			for (i = 1; i <= sheet.getLastRowNum(); i++) {
				Employee emp = new Employee();
				HSSFRow row = sheet.getRow(i);
				for (j = 0; j < row.getLastCellNum(); j++) {
					HSSFCell cell = row.getCell((int) j);
					//解决导入数据部分字段为空也能正常导入
					if (cell != null) {
						cell.setCellType(Cell.CELL_TYPE_STRING);
						if (j == 0) {
							if (cell.getStringCellValue() != null && !cell.getStringCellValue().equals("")){
								emp.setName(cell.getStringCellValue());
							}else{
								break;
							}
						} else if (j == 1) {
							String idNoVal = cell.getStringCellValue();
							if (idNoVal == null) {
								throw new BusinessException("身份证号为空");
							}
							for (String idNo : idNoList) {
								if (idNoVal.equals(idNo)) {
									throw new BusinessException("身份证号重复");
								}
							}
							for (String idNo : exsistList) {
								if (idNoVal.equals(idNo)) {
									throw new BusinessException("身份证号已存在");
								}
							}
							emp.setIdentityNo(idNoVal);
							exsistList.add(idNoVal);
						} else if (j == 2) {
							//联系方式修改2016-12-14
							String phone = cell.getStringCellValue();
							if (!phone.equals("")) {
								emp.setPhone(phone);
							} else {
								emp.setPhone(null);
							}

						} else if (j == 3) {
							String pvn = cell.getStringCellValue();
							if (pvnMap.get(pvn) == null && pvnMap.get(pvn + "省") == null) {
								throw new BusinessException("省份为空");
							} else {
								if (pvn.contains("省")) {
									emp.setProvinceNo(pvnMap.get(pvn));
								} else {
									if (pvn.equals("广西壮族自治区")) {
										emp.setProvinceNo(pvnMap.get(pvn));
									}else if(pvn.equals("重庆市")){
										emp.setProvinceNo(pvnMap.get(pvn));
									}else if(pvn.equals("北京市")){
										emp.setProvinceNo(pvnMap.get(pvn));
									}else if(pvn.equals("上海市")){
										emp.setProvinceNo(pvnMap.get(pvn));
									}else if(pvn.equals("天津市")){
										emp.setProvinceNo(pvnMap.get(pvn));
									}else if(pvn.equals("澳门特别行政区")){
										emp.setProvinceNo(pvnMap.get(pvn));
									}else if(pvn.equals("内蒙古自治区")){
										emp.setProvinceNo(pvnMap.get(pvn));
									}else if(pvn.equals("香港特别行政区")){
										emp.setProvinceNo(pvnMap.get(pvn));
									}else {
										emp.setProvinceNo(pvnMap.get(pvn + "省"));
									}
								}
							}
						} else if (j == 4) {
							String cty = cell.getStringCellValue();
							if(cty != null && !"".equals(cty)){
								if(ctyMap.get(cty) != null) {
									emp.setCityNo(ctyMap.get(cty));
								}else{
									throw new BusinessException("城市名称不存在");
								}
							}

						} else if (j == 5) {
							String epName = cell.getStringCellValue();
							if (epmap.get(epName) == null) {
								throw new BusinessException("企业名称不存在");
							} else {
								emp.setEpName(epName);
								emp.setEpNo(epmap.get(epName).longValue());
							}
						} else if (j == 6) {
							emp.setCertificateNo(cell.getStringCellValue());
						} else if (j == 7) {
							emp.setEmpTypeName(cell.getStringCellValue());

						} else if (j == 8) {
							emp.setCarTypeName(cell.getStringCellValue());
						} else if (j == 9) {
							String cerDate = cell.getStringCellValue();
							if (!cerDate.equals("")) {
								emp.setCertificateDate(sdf.parse(cerDate));
							} else {
								emp.setCertificateDate(null);
							}

						} else if (j == 10) {
							String driverDate = cell.getStringCellValue();

							if (!driverDate.equals("")) {

								emp.setDriveDate(sdf.parse(cell.getStringCellValue()));
							} else {

								emp.setDriveDate(null);
							}

						} else if (j == 11) {
							String checkDate = cell.getStringCellValue();

							if (!checkDate.equals("")) {

								emp.setCheckinDate(sdf.parse(checkDate));
							} else {

								emp.setCheckinDate(null);
							}

						} else if (j == 12) {

							emp.setEmpState(map.get(cell.getStringCellValue()));
						} else if (j == 13) {

							Set<Entry<Integer, String>> set = property.entrySet();
							Iterator<Entry<Integer, String>> itor = set.iterator();
							while (itor.hasNext()) {
								Entry<Integer, String> entry = itor.next();
								if (cell.getStringCellValue().equals(entry.getValue())) {
									emp.setProperties(entry.getKey());
									break;
								}
							}

						}
					}
				}
				if (emp.getName() != null && !emp.getName().equals("")) {
					empList.add(emp);
				}
			}
			msg.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			msg.put("msg", "faild");
			msg.put("detail", "第" + (i + 1) + "行，第" + (j + 1) + "列数据有问题，" + e.getMessage() + "，请检查后再导入");
			empList = null;
		}
		if (empList != null) {
			for (Employee emp : empList) {
				try {
					employeeSerivce.addEntity(emp);
				} catch (Exception e) {
					e.printStackTrace();
					msg.put("msg", "faild");
					msg.put("detail", "保存出错，请联系管理员");
				}
			}
		}
		out.print(JSONObject.fromObject(msg).toString());
		return null;
	}

	@RequestMapping(value = "/sys/enterpriseLicence")
	@ControllerLogDesc(description = "企业附件上传")
	public String enterpriseLicenceUpload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> deadLineMap = new HashMap<String, Object>();
		String emergencyDeadLine = request.getParameter("emergencyDeadLine");
		String saveDeadLine = request.getParameter("saveDeadLine");
		String icDeadLine = request.getParameter("icDeadLine");
		String tpDeadLine = request.getParameter("tpDeadLine");
		String entityId = request.getParameter("entityId");
		String path = request.getSession().getServletContext().getRealPath("upload");

		deadLineMap.put("tpDeadLine", tpDeadLine);
		deadLineMap.put("icDeadLine", icDeadLine);
		deadLineMap.put("saveDeadLine", saveDeadLine);
		deadLineMap.put("emergencyDeadLine", emergencyDeadLine);
		deadLineMap.put("entityId", entityId);
		deadLineMap.put("path", path);
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		PrintWriter out = null;
		Map<String, Object> msg = new HashMap<String, Object>();
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			deadLineMap.put("multiRequest", multiRequest);
			try {
				out = response.getWriter();
				enterpriceSerivce.uploadLicene(deadLineMap);
				msg.put("msg", "success");
			} catch (Exception e) {
				e.printStackTrace();
				msg.put("msg", "faild");
			}
			out.print(JSONObject.fromObject(msg).toString());
		}
		return null;
	}

	@RequestMapping(value = "/sys/getEpUpload")
	@ControllerLogDesc(description = "附件列表操作")
	@ResponseBody
	public List<AnnexDetail> getEpUploadInfo(@RequestParam Long entityId, @RequestParam Integer typeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entityId", entityId);
		map.put("typeId", typeId);
		return enterpriceSerivce.getEpUploadInfo(map);
	}

	@RequestMapping(value = "/sys/enterpriseRecorder")
	@ControllerLogDesc(description = "企业监管信息上传")
	public String enterpriseRecorderUpload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String path = request.getSession().getServletContext().getRealPath("upload");
		map.put("regulateObjId", request.getParameter("regulateObjId"));
		map.put("path", path);
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		PrintWriter out = null;
		Map<String, Object> msg = new HashMap<String, Object>();
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			map.put("multiRequest", multiRequest);
			try {
				out = response.getWriter();
				enterpriceSerivce.uploadRecord(map);
				msg.put("msg", "success");
			} catch (Exception e) {
				e.printStackTrace();
				msg.put("msg", "faild");
			}
			out.print(JSONObject.fromObject(msg).toString());
		}
		return null;
	}

	@RequestMapping(value = "/sys/carUpload")
	@ControllerLogDesc(description = "车辆附件上传")
	public String carUpload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String path = request.getSession().getServletContext().getRealPath("upload");

		map.put("entityId", request.getParameter("entityId"));
		map.put("tranlicenceDate", request.getParameter("tranlicenceDate"));
		map.put("carlicenceDate", request.getParameter("carlicenceDate"));
		map.put("carRegDate", request.getParameter("carRegDate"));
		map.put("insuranceDate", request.getParameter("insuranceDate"));
		map.put("environTagDate", request.getParameter("environTagDate"));
		map.put("GPSDate", request.getParameter("GPSDate"));
		map.put("GPSInstallDate", request.getParameter("GPSInstallDate"));
		map.put("specialReportDate", request.getParameter("specialReportDate"));
		map.put("oilCastListDate", request.getParameter("oilCastListDate"));
		map.put("path", path);
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		PrintWriter out = null;
		Map<String, Object> msg = new HashMap<String, Object>();
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			map.put("multiRequest", multiRequest);
			try {
				out = response.getWriter();
				enterpriceSerivce.uploadCarInfo(map);
				msg.put("msg", "success");
			} catch (Exception e) {
				e.printStackTrace();
				msg.put("msg", "faild");
			}
			out.print(JSONObject.fromObject(msg).toString());
		}
		return null;
	}

	@RequestMapping(value = "/sys/empUpload")
	@ControllerLogDesc(description = "人员附件上传")
	public String empUpload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String path = request.getSession().getServletContext().getRealPath("upload");

		map.put("entityId", request.getParameter("entityId"));
		map.put("identityDate", request.getParameter("identityDate"));
		map.put("certificateDate", request.getParameter("certificateDate"));
		map.put("driverDate", request.getParameter("driverDate"));
		map.put("contractDate", request.getParameter("contractDate"));
		map.put("path", path);
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		PrintWriter out = null;
		Map<String, Object> msg = new HashMap<String, Object>();
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			map.put("multiRequest", multiRequest);
			try {
				out = response.getWriter();
				enterpriceSerivce.uploadEmpInfo(map);
				msg.put("msg", "success");
			} catch (Exception e) {
				e.printStackTrace();
				msg.put("msg", "faild");
			}
			out.print(JSONObject.fromObject(msg).toString());
		}
		return null;
	}

	@RequestMapping(value = "/sys/download")
	@ControllerLogDesc(description = "下载操作")
	public ResponseEntity<byte[]> download(@RequestParam String id, HttpServletRequest request,
										   HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		String path = request.getSession().getServletContext().getRealPath("/");
		AnnexDetail annex = enterpriceSerivce.getAnnexDetail(map);
		String url = annex.getFileUrl();
		File file = new File(path + url);
		HttpHeaders headers = new HttpHeaders();
		String[] txName = url.split("\\.");
		if (txName[1].equals("jpg")||txName[1].equals("JPG")) {
			headers.setContentType(MediaType.IMAGE_JPEG);
			headers.setContentDispositionFormData("attachment",
					URLEncoder.encode(annex.getFileName() + ".jpg", "utf-8"));
		} else if (txName[1].equals("png")||txName[1].equals("PNG")) {
			headers.setContentType(MediaType.IMAGE_JPEG);
			headers.setContentDispositionFormData("attachment",
					URLEncoder.encode(annex.getFileName() + ".png", "utf-8"));
		} else {
			headers.setContentType(MediaType.parseMediaType("application/pdf"));
			headers.setContentDispositionFormData("attachment",
					URLEncoder.encode(annex.getFileName() + ".pdf", "utf-8"));
		}

		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/sys/deleteAnnux")
	@ControllerLogDesc(description = "删除附件")
	@ResponseBody
	public Map<String, Object> deleteAnnux(@RequestParam Long id) {
		Map<String, Object> map = new HashMap<String, Object>();
		AnnexDetail detail = annuxSerivce.getById(id);
		detail.setIsValidity(1);
		try {
			annuxSerivce.updateEntity(detail);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "failed");
		}
		return map;
	}

//	@RequestMapping(value = "/sys/changeValDate")
//	@ControllerLogDesc(description = "修改附件有效期")
//	@ResponseBody
//	public Map<String, Object> changeValDate(@ModelAttribute AnnexDetail annex) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		Long aid = annex.getId();
//		AnnexDetail detail = annuxSerivce.getById(aid);
//		detail.setDeadLine(annex.getDeadLine());
//		try {
//			annuxSerivce.updateEntity(detail);
//			map.put("msg", "success");
//		} catch (Exception e) {
//			e.printStackTrace();
//			map.put("msg", "failed");
//		}
//		return map;
//	}




	public EmployeeSerivceImpl getEmployeeSerivce() {
		return employeeSerivce;
	}

	public void setEmployeeSerivce(EmployeeSerivceImpl employeeSerivce) {
		this.employeeSerivce = employeeSerivce;
	}

	public EnterpriceSerivceImpl getEnterpriceSerivce() {
		return enterpriceSerivce;
	}

	public void setEnterpriceSerivce(EnterpriceSerivceImpl enterpriceSerivce) {
		this.enterpriceSerivce = enterpriceSerivce;
	}

	public CarSerivceImpl getCarSerivce() {
		return carSerivce;
	}

	public void setCarSerivce(CarSerivceImpl carSerivce) {
		this.carSerivce = carSerivce;
	}

	public DictionaryServiceImpl getDictionaryService() {
		return dictionaryService;
	}

	public void setDictionaryService(DictionaryServiceImpl dictionaryService) {
		this.dictionaryService = dictionaryService;
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

	public AnnuxSerivceImpl getAnnuxSerivce() {
		return annuxSerivce;
	}

	public void setAnnuxSerivce(AnnuxSerivceImpl annuxSerivce) {
		this.annuxSerivce = annuxSerivce;
	}

}
