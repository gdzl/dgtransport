package com.paxonpilot.dgtransport.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.DVConstraint;
import org.apache.poi.hssf.usermodel.HSSFDataValidation;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.springframework.web.servlet.view.document.AbstractXlsView;

public class EmployeeModelExcelView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Sheet sheet = workbook.createSheet("人员信息");
		Row header = sheet.createRow(0);
		Cell nameCell = header.createCell(0);
		Cell identityNoCell = header.createCell(1);
		Cell phoneCell = header.createCell(2);
		Cell provinceNoCell = header.createCell(3);
		Cell cityNoCell = header.createCell(4);
		Cell epNameCell = header.createCell(5);
		Cell certificateNoCell = header.createCell(6);
		Cell empTypeNameCell = header.createCell(7);
		Cell carTypeNameCell = header.createCell(8);
		Cell certificateDateCell = header.createCell(9);
		Cell driveDateCell = header.createCell(10);
		Cell checkinDateCell = header.createCell(11);
		Cell empStateCell = header.createCell(12);
		Cell propertyCell = header.createCell(13);
		nameCell.setCellValue("姓名");
		identityNoCell.setCellValue("身份证号");
		phoneCell.setCellValue("联系电话");
		provinceNoCell.setCellValue("户籍所在省");
		cityNoCell.setCellValue("户籍所在市");
		epNameCell.setCellValue("企业名称");
		certificateNoCell.setCellValue("从业资格证号");
		empTypeNameCell.setCellValue("从业资格类别");
		carTypeNameCell.setCellValue("准驾车型");
		certificateDateCell.setCellValue("初领从业资格证时间");
		driveDateCell.setCellValue("初领驾驶证日期");
		checkinDateCell.setCellValue("入职时间");
		empStateCell.setCellValue("人员状态");
		propertyCell.setCellValue("人员属性");
		
		Row row = sheet.createRow(1);
		row.createCell(0).setCellValue("张三");
		row.createCell(1).setCellValue("1212121212");
		row.createCell(2).setCellValue("13512312231");
		row.createCell(3).setCellValue("广东省");
		row.createCell(4).setCellValue("广州市");
		row.createCell(5).setCellValue("XXXXXX公司");
		row.createCell(6).setCellValue("vvvvvv123");
		row.createCell(7).setCellValue("类别1");
		row.createCell(8).setCellValue("C1");
		row.createCell(9).setCellValue("2016-8-9");
		row.createCell(10).setCellValue("2016-8-9");
		row.createCell(11).setCellValue("2016-8-9");
		row.createCell(12).setCellValue("请选择人员状态");
		String[] empStateList = {"在职","离职"};
		CellRangeAddressList stateRegions = new CellRangeAddressList(1,1,12,12);
		DVConstraint stateConstraint = DVConstraint.createExplicitListConstraint(empStateList);
		HSSFDataValidation stateData = new HSSFDataValidation(stateRegions,stateConstraint);
		sheet.addValidationData(stateData);
		row.createCell(13).setCellValue("请选择人员属性");
		String[] propertyList = {"驾驶员","管理员","押运员"};
		CellRangeAddressList propertyRegions = new CellRangeAddressList(1,1,13,13);
		DVConstraint propertyConstraint = DVConstraint.createExplicitListConstraint(propertyList);
		HSSFDataValidation propertyData = new HSSFDataValidation(propertyRegions,propertyConstraint);
		sheet.addValidationData(propertyData);
		
		response.setHeader("Content-Disposition","attachment;filename="+new String("人员信息模板".getBytes(),"iso8859-1")+".xls");
	}


}
