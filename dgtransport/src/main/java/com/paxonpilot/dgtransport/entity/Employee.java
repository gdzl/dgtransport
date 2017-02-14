package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
/**
 * 员工
 * @author Administrator
 *
 */
@Entity(name="employee")
public class Employee implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1218048638438189547L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=20)
	private String name;//姓名
	@Column
	private Integer properties;//人员属性 例如(1:驾驶员2:押运员)
	@Column(length=20)
	private String identityNo;//身份证号
	@Column(length=20)
	private String phone;//联系电话
	@Column
	private Long provinceNo;//户籍所在省
	@Column
	private Long cityNo;//户籍所在市
	@Column(length=100)
	private String epName;//企业名称
	@Column
	private Long epNo;//企业Id
	@Column(length=50)
	private String certificateNo;//从业资格证号
	@Column
	private Integer empType;//从业资格类别  例如(1:运输类2:管理类)
	@Column(length=500)
	private String empTypeName;//从业资格类别名字
	@Column
	private Integer carTpye;//准驾车型 例如(1:C12:B2)
	@Column(length=100)
	private String carTypeName;//准驾车型名字
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date certificateDate;//初领从业资格证时间
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date driveDate;//初领驾驶证日期
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date checkinDate;//入职时间
	@Column
	private Integer empState;//人员状态
	@Column
	private String something;//备用
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getProperties() {
		return properties;
	}
	public void setProperties(Integer properties) {
		this.properties = properties;
	}
	public String getIdentityNo() {
		return identityNo;
	}
	public void setIdentityNo(String identityNo) {
		this.identityNo = identityNo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Long getProvinceNo() {
		return provinceNo;
	}
	public void setProvinceNo(Long provinceNo) {
		this.provinceNo = provinceNo;
	}
	public Long getCityNo() {
		return cityNo;
	}
	public void setCityNo(Long cityNo) {
		this.cityNo = cityNo;
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
	public String getCertificateNo() {
		return certificateNo;
	}
	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}
	public Integer getEmpType() {
		return empType;
	}
	public void setEmpType(Integer empType) {
		this.empType = empType;
	}
	public Integer getCarTpye() {
		return carTpye;
	}
	public void setCarTpye(Integer carTpye) {
		this.carTpye = carTpye;
	}
	public Date getCertificateDate() {
		return certificateDate;
	}
	public void setCertificateDate(Date certificateDate) {
		this.certificateDate = certificateDate;
	}
	public Date getDriveDate() {
		return driveDate;
	}
	public void setDriveDate(Date driveDate) {
		this.driveDate = driveDate;
	}
	public Date getCheckinDate() {
		return checkinDate;
	}
	public void setCheckinDate(Date checkinDate) {
		this.checkinDate = checkinDate;
	}
	public Integer getEmpState() {
		return empState;
	}
	public void setEmpState(Integer empState) {
		this.empState = empState;
	}
	public String getEmpTypeName() {
		return empTypeName;
	}
	public void setEmpTypeName(String empTypeName) {
		this.empTypeName = empTypeName;
	}
	public String getCarTypeName() {
		return carTypeName;
	}
	public void setCarTypeName(String carTypeName) {
		this.carTypeName = carTypeName;
	}
}
