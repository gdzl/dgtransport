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


public class EnterpriseModelExcelView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Sheet sheet = workbook.createSheet("企业信息");
		Row header = sheet.createRow(0);
		Cell epNoCell = header.createCell(0);
		Cell epNameCell = header.createCell(1);
		Cell addressCell = header.createCell(2);
		Cell scopeNoCell = header.createCell(3);
		Cell tpLicenceCell = header.createCell(4);
		Cell icLicenceCell = header.createCell(5);
		Cell corporationCell = header.createCell(6);
		Cell corcontactCell = header.createCell(7);
		Cell businessorCell = header.createCell(8);
		Cell contactCell = header.createCell(9);
		Cell cityNoCell = header.createCell(10);
		Cell epStateCell = header.createCell(11);
		epNoCell.setCellValue("编号");
		epNameCell.setCellValue("业户名称");
		addressCell.setCellValue("经营地址");
		scopeNoCell.setCellValue("经营范围");
		tpLicenceCell.setCellValue("道路运输经营许可证号");
		icLicenceCell.setCellValue("工商营业执照号");
		corporationCell.setCellValue("法定代表人");
		corcontactCell.setCellValue("法定代表人联系方式");
		businessorCell.setCellValue("业务联系人");
		contactCell.setCellValue("业务联系人联系方式");
		cityNoCell.setCellValue("所属镇街");
		epStateCell.setCellValue("企业状态");
		
		Row row = sheet.createRow(1);
		row.createCell(0).setCellValue("001");
		row.createCell(1).setCellValue("XXX公司");
		row.createCell(2).setCellValue("XXX路");
		row.createCell(3).setCellValue("石油");
//		CellRangeAddressList regions = new CellRangeAddressList(1,2,3,3);
//		String[] scopeList = {"家具","物流","石油","汽油"};
//		DVConstraint constraint = DVConstraint.createExplicitListConstraint(scopeList);
//		HSSFDataValidation data_validation = new HSSFDataValidation(regions,constraint);
//		sheet.addValidationData(data_validation);
		row.createCell(4).setCellValue("123XXXX22");
		row.createCell(5).setCellValue("XXXXX3344455");
		row.createCell(6).setCellValue("张三");
		row.createCell(7).setCellValue("135123123123");
		row.createCell(8).setCellValue("李四");
		row.createCell(9).setCellValue("135123123123");
		row.createCell(10).setCellValue("请选择镇街");
		String[] streetList = {"大良","勒流","伦教","容桂","陈村","均安","杏坛","龙江","乐从","北滘"};
		CellRangeAddressList streetRegions = new CellRangeAddressList(1,1,10,10);
		DVConstraint streetConstraint = DVConstraint.createExplicitListConstraint(streetList);
		HSSFDataValidation streetData = new HSSFDataValidation(streetRegions,streetConstraint);
		sheet.addValidationData(streetData);
		row.createCell(11).setCellValue("请选择企业状态");
		String[] stateList = {"营业","歇业","注销"};
		CellRangeAddressList stateRegions = new CellRangeAddressList(1,1,11,11);
		DVConstraint stateConstraint = DVConstraint.createExplicitListConstraint(stateList);
		HSSFDataValidation stateData = new HSSFDataValidation(stateRegions,stateConstraint);
		sheet.addValidationData(stateData);
		response.setHeader("Content-Disposition","attachment;filename="+new String("企业信息模板".getBytes(),"iso8859-1")+".xls");
	}


}
