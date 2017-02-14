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
		Sheet sheet = workbook.createSheet("��ҵ��Ϣ");
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
		epNoCell.setCellValue("���");
		epNameCell.setCellValue("ҵ������");
		addressCell.setCellValue("��Ӫ��ַ");
		scopeNoCell.setCellValue("��Ӫ��Χ");
		tpLicenceCell.setCellValue("��·���侭Ӫ���֤��");
		icLicenceCell.setCellValue("����Ӫҵִ�պ�");
		corporationCell.setCellValue("����������");
		corcontactCell.setCellValue("������������ϵ��ʽ");
		businessorCell.setCellValue("ҵ����ϵ��");
		contactCell.setCellValue("ҵ����ϵ����ϵ��ʽ");
		cityNoCell.setCellValue("�������");
		epStateCell.setCellValue("��ҵ״̬");
		
		Row row = sheet.createRow(1);
		row.createCell(0).setCellValue("001");
		row.createCell(1).setCellValue("XXX��˾");
		row.createCell(2).setCellValue("XXX·");
		row.createCell(3).setCellValue("ʯ��");
//		CellRangeAddressList regions = new CellRangeAddressList(1,2,3,3);
//		String[] scopeList = {"�Ҿ�","����","ʯ��","����"};
//		DVConstraint constraint = DVConstraint.createExplicitListConstraint(scopeList);
//		HSSFDataValidation data_validation = new HSSFDataValidation(regions,constraint);
//		sheet.addValidationData(data_validation);
		row.createCell(4).setCellValue("123XXXX22");
		row.createCell(5).setCellValue("XXXXX3344455");
		row.createCell(6).setCellValue("����");
		row.createCell(7).setCellValue("135123123123");
		row.createCell(8).setCellValue("����");
		row.createCell(9).setCellValue("135123123123");
		row.createCell(10).setCellValue("��ѡ�����");
		String[] streetList = {"����","����","�׽�","�ݹ�","�´�","����","��̳","����","�ִ�","����"};
		CellRangeAddressList streetRegions = new CellRangeAddressList(1,1,10,10);
		DVConstraint streetConstraint = DVConstraint.createExplicitListConstraint(streetList);
		HSSFDataValidation streetData = new HSSFDataValidation(streetRegions,streetConstraint);
		sheet.addValidationData(streetData);
		row.createCell(11).setCellValue("��ѡ����ҵ״̬");
		String[] stateList = {"Ӫҵ","Ъҵ","ע��"};
		CellRangeAddressList stateRegions = new CellRangeAddressList(1,1,11,11);
		DVConstraint stateConstraint = DVConstraint.createExplicitListConstraint(stateList);
		HSSFDataValidation stateData = new HSSFDataValidation(stateRegions,stateConstraint);
		sheet.addValidationData(stateData);
		response.setHeader("Content-Disposition","attachment;filename="+new String("��ҵ��Ϣģ��".getBytes(),"iso8859-1")+".xls");
	}


}
