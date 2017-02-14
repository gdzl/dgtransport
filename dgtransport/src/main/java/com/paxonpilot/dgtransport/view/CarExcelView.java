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
import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.service.DictionaryServiceImpl;
import com.paxonpilot.dgtransport.util.StringUtil;

public class CarExcelView extends AbstractXlsView{
	
	@Autowired
	private DictionaryServiceImpl dictionaryService;

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Object[] params = new Object[]{3,2};
		List<Dictionary> diclist = dictionaryService.getByIn(params);
		Map<Integer,String> map = new HashMap<Integer,String>();
		for(Dictionary dic : diclist){
			map.put(Integer.valueOf(dic.getId().toString()), dic.getDictionaryName());
		}
		Sheet sheet = workbook.createSheet("车辆信息");
		Row header = sheet.createRow(0);
		Cell carNoCell = header.createCell(0);
		Cell colorCell = header.createCell(1);
		Cell epNameCell = header.createCell(2);
		Cell transportNoCell = header.createCell(3);
		Cell scopeNoCell = header.createCell(4);
		Cell carTypeCell = header.createCell(5);
		Cell brandNoCell = header.createCell(6);
		Cell vinCell = header.createCell(7);
		Cell engineNoCell = header.createCell(8);
		Cell engineStyleCell = header.createCell(9);
		Cell regDateCell = header.createCell(10);
		Cell scrapDateCell = header.createCell(11);
		Cell carStateCell = header.createCell(12);
		carNoCell.setCellValue("车牌号");
		colorCell.setCellValue("车牌颜色");
		epNameCell.setCellValue("业户名称");
		transportNoCell.setCellValue("道路运输证号");
		scopeNoCell.setCellValue("经营范围");
		carTypeCell.setCellValue("车辆类型");
		brandNoCell.setCellValue("品牌型号");
		vinCell.setCellValue("车架号");
		engineNoCell.setCellValue("发动机号");
		engineStyleCell.setCellValue("发动机型号");
		regDateCell.setCellValue("行驶证注册日期");
		scrapDateCell.setCellValue("强制报废日期");
		carStateCell.setCellValue("车辆状态");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String task = model.get("task")==null?"":model.get("task").toString();
		int cellIndex = 1;
		if(task==null||task.equals("")){
			List<Car> list = (List<Car>)model.get("list");
			for(Car car :list){
				Row row = sheet.createRow(cellIndex);
				row.createCell(0).setCellValue(StringUtil.stringisNull(car.getCarNo()));
				row.createCell(1).setCellValue(map.get(Integer.valueOf(car.getCarColor())));
				row.createCell(2).setCellValue(StringUtil.stringisNull(car.getEpName()));
				row.createCell(3).setCellValue(car.getTransportNo());
				row.createCell(4).setCellValue(StringUtil.stringisNull(car.getScopeName()));
				row.createCell(5).setCellValue(StringUtil.stringisNull(car.getCarTypeName()));
				row.createCell(6).setCellValue(StringUtil.stringisNull(car.getBrandNo()));
				row.createCell(7).setCellValue(StringUtil.stringisNull(car.getVin()));
				row.createCell(8).setCellValue(StringUtil.stringisNull(car.getEngineNo()));
				row.createCell(9).setCellValue(StringUtil.stringisNull(car.getEngineStyle()));
				row.createCell(10).setCellValue(car.getRegDate()==null?"":sdf.format(car.getRegDate()));
				row.createCell(11).setCellValue(car.getScrapDate()==null?"":sdf.format(car.getScrapDate()));
				row.createCell(12).setCellValue(map.get(car.getCarState()));
				cellIndex++;
			}
		}else{
			List<Object[]> list = (List<Object[]>)model.get("list");
			for(Object[] car :list){
				Row row = sheet.createRow(cellIndex);
				row.createCell(0).setCellValue(StringUtil.stringisNull(car[0]==null?"":car[0].toString()));
				row.createCell(1).setCellValue(map.get(Integer.valueOf(car[1]==null?"":car[1].toString())));
				row.createCell(2).setCellValue(StringUtil.stringisNull(car[2]==null?"":car[2].toString()));
				row.createCell(3).setCellValue(car[3]==null?"":car[3].toString());
				row.createCell(4).setCellValue(StringUtil.stringisNull(car[4]==null?"":car[4].toString()));
				row.createCell(5).setCellValue(StringUtil.stringisNull(car[5]==null?"":car[5].toString()));
				row.createCell(6).setCellValue(StringUtil.stringisNull(car[6]==null?"":car[6].toString()));
				row.createCell(7).setCellValue(StringUtil.stringisNull(car[7]==null?"":car[7].toString()));
				row.createCell(8).setCellValue(StringUtil.stringisNull(car[8]==null?"":car[8].toString()));
				row.createCell(9).setCellValue(StringUtil.stringisNull(car[9]==null?"":car[9].toString()));
				row.createCell(10).setCellValue(car[10]==null?"":sdf.format(car[10]));
				row.createCell(11).setCellValue(car[11]==null?"":sdf.format(car[11]));
				row.createCell(12).setCellValue(map.get(Integer.valueOf(car[12]==null?"-1":car[12].toString())));
				cellIndex++;
			}
		}
		
		response.setHeader("Content-Disposition","attachment;filename="+new String("车辆信息".getBytes(),"iso8859-1")+".xls");
	}

	public DictionaryServiceImpl getDictionaryService() {
		return dictionaryService;
	}

	public void setDictionaryService(DictionaryServiceImpl dictionaryService) {
		this.dictionaryService = dictionaryService;
	}


}
