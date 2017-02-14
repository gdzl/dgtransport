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
		Sheet sheet = workbook.createSheet("��Ա��Ϣ");
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
		nameCell.setCellValue("����");
		identityNoCell.setCellValue("���֤��");
		phoneCell.setCellValue("��ϵ�绰");
		provinceNoCell.setCellValue("��������ʡ");
		cityNoCell.setCellValue("����������");
		epNameCell.setCellValue("��ҵ����");
		certificateNoCell.setCellValue("��ҵ�ʸ�֤��");
		empTypeNameCell.setCellValue("��ҵ�ʸ����");
		carTypeNameCell.setCellValue("׼�ݳ���");
		certificateDateCell.setCellValue("�����ҵ�ʸ�֤ʱ��");
		driveDateCell.setCellValue("�����ʻ֤����");
		checkinDateCell.setCellValue("��ְʱ��");
		empStateCell.setCellValue("��Ա״̬");
		propertyCell.setCellValue("��Ա����");
		
		Row row = sheet.createRow(1);
		row.createCell(0).setCellValue("����");
		row.createCell(1).setCellValue("1212121212");
		row.createCell(2).setCellValue("13512312231");
		row.createCell(3).setCellValue("�㶫ʡ");
		row.createCell(4).setCellValue("������");
		row.createCell(5).setCellValue("XXXXXX��˾");
		row.createCell(6).setCellValue("vvvvvv123");
		row.createCell(7).setCellValue("���1");
		row.createCell(8).setCellValue("C1");
		row.createCell(9).setCellValue("2016-8-9");
		row.createCell(10).setCellValue("2016-8-9");
		row.createCell(11).setCellValue("2016-8-9");
		row.createCell(12).setCellValue("��ѡ����Ա״̬");
		String[] empStateList = {"��ְ","��ְ"};
		CellRangeAddressList stateRegions = new CellRangeAddressList(1,1,12,12);
		DVConstraint stateConstraint = DVConstraint.createExplicitListConstraint(empStateList);
		HSSFDataValidation stateData = new HSSFDataValidation(stateRegions,stateConstraint);
		sheet.addValidationData(stateData);
		row.createCell(13).setCellValue("��ѡ����Ա����");
		String[] propertyList = {"��ʻԱ","����Ա","Ѻ��Ա"};
		CellRangeAddressList propertyRegions = new CellRangeAddressList(1,1,13,13);
		DVConstraint propertyConstraint = DVConstraint.createExplicitListConstraint(propertyList);
		HSSFDataValidation propertyData = new HSSFDataValidation(propertyRegions,propertyConstraint);
		sheet.addValidationData(propertyData);
		
		response.setHeader("Content-Disposition","attachment;filename="+new String("��Ա��Ϣģ��".getBytes(),"iso8859-1")+".xls");
	}


}
