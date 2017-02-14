package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * ʡ
 * @author Administrator
 *
 */
@Entity(name="province")
public class Province implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7076376521716321450L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=20)
	private String provinceName;
	@Column(length=20)
	private String provinceNo;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getProvinceNo() {
		return provinceNo;
	}
	public void setProvinceNo(String provinceNo) {
		this.provinceNo = provinceNo;
	}
}
