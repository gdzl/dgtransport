package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxonpilot.dgtransport.dao.ReportDao;
import com.paxonpilot.dgtransport.dao.StreetDao;
import com.paxonpilot.dgtransport.entity.Street;

@Service("reportService")
public class ReportServiceImpl implements BaseService<Map> {
	@Autowired
	private ReportDao reportDao;

	@Override
	public List<Map> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map> getByMap(Object[] params) {
		
		return null;
	}
	
	public List<Object[]> getEpTotal(){
		StringBuffer sql = new StringBuffer();
		sql.append(" select COUNT(enterprise.id) as total,street.streetName ")
		   .append(" from enterprise inner join street on enterprise.cityNo=street.id ")
		   .append(" group by street.streetName");
		return reportDao.findBySql(sql.toString(), new Object[]{});
	}

	@Override
	public void addEntity(Map entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateEntity(Map entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEntity(Map entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public ReportDao getReportDao() {
		return reportDao;
	}

	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}

}
