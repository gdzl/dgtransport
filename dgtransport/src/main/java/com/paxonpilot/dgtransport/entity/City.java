package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * ÊÐ
 * @author Administrator
 *
 */
@Entity(name="city")
public class City implements Serializable{

	private static final long serialVersionUID = 899605814232996586L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private Long provinceNo;
	@Column(length=20)
	private String cityName;
	@Column(length=20)
	private String cityNo;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getCityNo() {
		return cityNo;
	}
	public void setCityNo(String cityNo) {
		this.cityNo = cityNo;
	}
	public Long getProvinceNo() {
		return provinceNo;
	}
	public void setProvinceNo(Long provinceNo) {
		this.provinceNo = provinceNo;
	}
}
