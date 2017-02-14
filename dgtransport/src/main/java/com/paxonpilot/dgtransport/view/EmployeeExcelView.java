package com.paxonpilot.dgtransport.view;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.City;
import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.entity.Employee;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.entity.Province;
import com.paxonpilot.dgtransport.service.CityServiceImpl;
import com.paxonpilot.dgtransport.service.DictionaryServiceImpl;
import com.paxonpilot.dgtransport.service.ProvinceServiceImpl;
import com.paxonpilot.dgtransport.util.AppContant;
import com.paxonpilot.dgtransport.util.StringUtil;

public class EmployeeExcelView extends AbstractXlsView{
	
	@Autowired
	private DictionaryServiceImpl dictionaryService;
	@Autowired
	private ProvinceServiceImpl provinceService;
	@Autowired
	private CityServiceImpl cityService;

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Object[] params = new Object[]{4};
		List<Dictionary> diclist = dictionaryService.getByMap(params);
		Map<Integer,String> map = new HashMap<Integer,String>();
		for(Dictionary dic : diclist){
			map.put(Integer.valueOf(dic.getId().toString()), dic.getDictionaryName());
		}
		List<Province> pvnList=provinceService.getAll();
		Map<Long,String> pvnMap = new HashMap<Long,String>();
		for(Province pvn : pvnList){
			pvnMap.put(pvn.getId(), pvn.getProvinceName());
		}
		List<City> ctyList = cityService.getAll();
		Map<Long,String> ctyMap = new HashMap<Long,String>();
		for(City cty :ctyList){
			ctyMap.put(cty.getId(), cty.getCityName());
		}
		Map<Integer,String> property = AppContant.PROPERTY;
		Sheet sheet = workbook.createSheet("人员信息");
		Row header = sheet.createRow(0);
		Cell nameCell = header.createCell(0);
		Cell identityNoCell = header.createCell(1);
		Cell phoneCell = header.createCell(2);
		Cell provinceNoCell = header.createCell(3);
		Cell cityNoCell = header.createCell(4);
		Cell epNameCell = header.createCell(5);
		Cell certificateNoCell = header.createCell(6);
		Cell empTypeCell = header.createCell(7);
		Cell carTpyeCell = header.createCell(8);
		Cell certificateDateCell = header.createCell(9);
		Cell driveDateCell = header.createCell(10);
		Cell checkinDateCell = header.createCell(11);
		Cell stateCell = header.createCell(12);
		Cell propertyCell = header.createCell(13);
		nameCell.setCellValue("姓名");
		identityNoCell.setCellValue("身份证号");
		phoneCell.setCellValue("联系电话");
		provinceNoCell.setCellValue("户籍所在省");
		cityNoCell.setCellValue("户籍所在市");
		epNameCell.setCellValue("企业名称");
		certificateNoCell.setCellValue("从业资格证号");
		empTypeCell.setCellValue("从业资格类别");
		carTpyeCell.setCellValue("准驾车型");
		certificateDateCell.setCellValue("初领从业资格证时间");
		driveDateCell.setCellValue("初领驾驶证日期");
		checkinDateCell.setCellValue("入职时间");
		stateCell.setCellValue("人员状态");
		propertyCell.setCellValue("人员属性");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String task = model.get("task")==null?"":model.get("task").toString();
		int cellIndex = 1;
		if(task==null||task.equals("")){
			List<Employee> list = (List<Employee>)model.get("list");
			for(Employee employee :list){
				Row row = sheet.createRow(cellIndex);
				row.createCell(0).setCellValue(StringUtil.stringisNull(employee.getName()));
				row.createCell(1).setCellValue(StringUtil.stringisNull(employee.getIdentityNo()));
				row.createCell(2).setCellValue(StringUtil.stringisNull(employee.getPhone()));
				row.createCell(3).setCellValue(pvnMap.get(employee.getProvinceNo()));
				row.createCell(4).setCellValue(ctyMap.get(employee.getCityNo()));
				row.createCell(5).setCellValue(StringUtil.stringisNull(employee.getEpName()));
				row.createCell(6).setCellValue(StringUtil.stringisNull(employee.getCertificateNo()));
				row.createCell(7).setCellValue(employee.getEmpTypeName());
				row.createCell(8).setCellValue(employee.getCarTypeName());
				row.createCell(9).setCellValue(employee.getCertificateDate()==null?"":sdf.format(employee.getCertificateDate()));
				row.createCell(10).setCellValue(employee.getDriveDate()==null?"":sdf.format(employee.getDriveDate()));
				row.createCell(11).setCellValue(employee.getCheckinDate()==null?"":sdf.format(employee.getCheckinDate()));
				row.createCell(12).setCellValue(map.get(employee.getEmpState()));
				row.createCell(13).setCellValue(property.get(employee.getProperties()));
				cellIndex++;
			}
		}else{
			List<Object[]> list = (List<Object[]>) model.get("list");
			for(Object[] employee :list){
				Row row = sheet.createRow(cellIndex);
				row.createCell(0).setCellValue(StringUtil.stringisNull(employee[0]==null?"":employee[0].toString()));
				row.createCell(1).setCellValue(StringUtil.stringisNull(employee[2]==null?"":employee[2].toString()));
				row.createCell(2).setCellValue(StringUtil.stringisNull(employee[3]==null?"":employee[3].toString()));
				row.createCell(3).setCellValue(pvnMap.get(Long.valueOf(employee[4]==null?"0":employee[4].toString())));
				row.createCell(4).setCellValue(ctyMap.get(Long.valueOf(employee[5]==null?"0":employee[5].toString())));
				row.createCell(5).setCellValue(StringUtil.stringisNull(employee[6]==null?"":employee[6].toString()));
				row.createCell(6).setCellValue(StringUtil.stringisNull(employee[7]==null?"":employee[7].toString()));
				row.createCell(7).setCellValue(employee[8]==null?"":employee[8].toString());
				row.createCell(8).setCellValue(employee[9]==null?"":employee[9].toString());
				row.createCell(9).setCellValue(employee[10]==null?"":sdf.format(employee[10]));
				row.createCell(10).setCellValue(employee[11]==null?"":sdf.format(employee[11]));
				row.createCell(11).setCellValue(employee[12]==null?"":sdf.format(employee[12]));
				row.createCell(12).setCellValue(map.get(employee[13]==null?"":employee[13]));
				row.createCell(13).setCellValue(property.get(employee[1]==null?"":employee[1]));
				cellIndex++;
			}
		}
		response.setHeader("Content-Disposition","attachment;filename="+new String("人员信息".getBytes(),"iso8859-1")+".xls");
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


}
