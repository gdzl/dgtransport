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

public class CarModelExcelView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Sheet sheet = workbook.createSheet("������Ϣ");
		Row header = sheet.createRow(0);
		Cell carNoCell = header.createCell(0);
		Cell carColorCell = header.createCell(1);
		Cell epNameCell = header.createCell(2);
		Cell transportNoCell = header.createCell(3);
		Cell scopeNameCell = header.createCell(4);
		Cell carTypeNameCell = header.createCell(5);
		Cell brandNoCell = header.createCell(6);
		Cell vinCell = header.createCell(7);
		Cell engineNoCell = header.createCell(8);
		Cell engineStyleCell = header.createCell(9);
		Cell regDateCell = header.createCell(10);
		Cell scrapDateCell = header.createCell(11);
		Cell carStateCell = header.createCell(12);
		carNoCell.setCellValue("���ƺ�");
		carColorCell.setCellValue("������ɫ");
		epNameCell.setCellValue("ҵ������");
		transportNoCell.setCellValue("��·����֤��");
		scopeNameCell.setCellValue("��Ӫ��Χ");
		carTypeNameCell.setCellValue("��������");
		brandNoCell.setCellValue("Ʒ���ͺ�");
		vinCell.setCellValue("���ܺ�");
		engineNoCell.setCellValue("��������");
		engineStyleCell.setCellValue("�������ͺ�");
		regDateCell.setCellValue("��ʻ֤ע������");
		scrapDateCell.setCellValue("ǿ�Ʊ�������");
		carStateCell.setCellValue("����״̬");
		
		Row row = sheet.createRow(1);
		row.createCell(0).setCellValue("��X123123");
		row.createCell(1).setCellValue("��ѡ����ɫ");
		CellRangeAddressList regions = new CellRangeAddressList(1,1,1,1);
		String[] scopeList = {"��ɫ","��ɫ"};
		DVConstraint constraint = DVConstraint.createExplicitListConstraint(scopeList);
		HSSFDataValidation data_validation = new HSSFDataValidation(regions,constraint);
		sheet.addValidationData(data_validation);
		row.createCell(2).setCellValue("XXX��˾");
		row.createCell(3).setCellValue("sadfs123");
		row.createCell(4).setCellValue("ʯ��");
		
//		String[] streetList = {"�͹޳�","����","��","��ҵ��"};
//		CellRangeAddressList streetRegions = new CellRangeAddressList(1,2,5,5);
//		DVConstraint streetConstraint = DVConstraint.createExplicitListConstraint(streetList);
//		HSSFDataValidation streetData = new HSSFDataValidation(streetRegions,streetConstraint);
//		sheet.addValidationData(streetData);
		row.createCell(5).setCellValue("�͹޳�");
		row.createCell(6).setCellValue("�µ�");
		row.createCell(7).setCellValue("vvvvvv123");
		row.createCell(8).setCellValue("aaaa333");
		row.createCell(9).setCellValue("aaaaaaaaa");
		row.createCell(10).setCellValue("2016-8-9");
		row.createCell(11).setCellValue("2016-8-9");
		row.createCell(12).setCellValue("��ѡ����״̬");
		CellRangeAddressList carType = new CellRangeAddressList(1,1,12,12);
		String[] carTypeList = {"Ӫ��","ע��"};
		DVConstraint typeConstraint = DVConstraint.createExplicitListConstraint(carTypeList);
		HSSFDataValidation type_validation = new HSSFDataValidation(carType,typeConstraint);
		sheet.addValidationData(type_validation);
		response.setHeader("Content-Disposition","attachment;filename="+new String("������Ϣģ��".getBytes(),"iso8859-1")+".xls");
	}


}
