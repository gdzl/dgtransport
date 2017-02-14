package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;
/**
 * ����
 * @author Administrator
 *
 */
@Entity(name="car")
public class Car implements Serializable{

	private static final long serialVersionUID = 2696334822562905538L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=50)
	private String carNo;//���ƺ�
	@Column(length=10)
	private String carColor;//������ɫ
	@Column(length=100)
	private String epName;//��ҵ����
	@Column
	private Long epNo;//��ҵId
	@Column(length=50)
	private String transportNo;//��·����֤��
	@Column
	private Long scopeNo;//��Ӫ��Χ
	@Column(length=1000)
	private String scopeName;//��Ӫ��Χ
	@Column
	private Long carType;//�������� ����(1:�͹޳�2:����)
	@Column(length=100)
	private String carTypeName;//����������
	@Column(length=20)
	private String brandNo;//Ʒ���ͺ�
	@Column(length=50)
	private String vin;//���ܺ�
	@Column(length=50)
	private String engineNo;//��������
	@Column(length=50)
	private String engineStyle;//�������ͺ�
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;//��ʻ֤ע������
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date scrapDate;//ǿ�Ʊ�������
	@Column
	private Integer carState;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCarNo() {
		return carNo;
	}
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	public String getCarColor() {
		return carColor;
	}
	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	public String getEpName() {
		return epName;
	}
	public void setEpName(String epName) {
		this.epName = epName;
	}
	public Long getEpNo() {
		return epNo;
	}
	public void setEpNo(Long epNo) {
		this.epNo = epNo;
	}
	public String getTransportNo() {
		return transportNo;
	}
	public void setTransportNo(String transportNo) {
		this.transportNo = transportNo;
	}
	public Long getScopeNo() {
		return scopeNo;
	}
	public void setScopeNo(Long scopeNo) {
		this.scopeNo = scopeNo;
	}
	public Long getCarType() {
		return carType;
	}
	public void setCarType(Long carType) {
		this.carType = carType;
	}
	public String getBrandNo() {
		return brandNo;
	}
	public void setBrandNo(String brandNo) {
		this.brandNo = brandNo;
	}
	public String getVin() {
		return vin;
	}
	public void setVin(String vin) {
		this.vin = vin;
	}
	public String getEngineNo() {
		return engineNo;
	}
	public void setEngineNo(String engineNo) {
		this.engineNo = engineNo;
	}
	public String getEngineStyle() {
		return engineStyle;
	}
	public void setEngineStyle(String engineStyle) {
		this.engineStyle = engineStyle;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getScrapDate() {
		return scrapDate;
	}
	public void setScrapDate(Date scrapDate) {
		this.scrapDate = scrapDate;
	}
	public Integer getCarState() {
		return carState;
	}
	public void setCarState(Integer carState) {
		this.carState = carState;
	}
	public String getScopeName() {
		return scopeName;
	}
	public void setScopeName(String scopeName) {
		this.scopeName = scopeName;
	}
	public String getCarTypeName() {
		return carTypeName;
	}
	public void setCarTypeName(String carTypeName) {
		this.carTypeName = carTypeName;
	}
	
}
