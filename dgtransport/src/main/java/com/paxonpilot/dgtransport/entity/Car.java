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
 * 车辆
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
	private String carNo;//车牌号
	@Column(length=10)
	private String carColor;//车牌颜色
	@Column(length=100)
	private String epName;//企业名称
	@Column
	private Long epNo;//企业Id
	@Column(length=50)
	private String transportNo;//道路运输证号
	@Column
	private Long scopeNo;//经营范围
	@Column(length=1000)
	private String scopeName;//经营范围
	@Column
	private Long carType;//车辆类型 例如(1:油罐车2:货车)
	@Column(length=100)
	private String carTypeName;//车辆类型名
	@Column(length=20)
	private String brandNo;//品牌型号
	@Column(length=50)
	private String vin;//车架号
	@Column(length=50)
	private String engineNo;//发动机号
	@Column(length=50)
	private String engineStyle;//发动机型号
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;//行驶证注册日期
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date scrapDate;//强制报废日期
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
