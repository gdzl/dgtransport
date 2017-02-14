package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * 政府部门
 * @author Administrator
 *
 */
@Entity(name="dept")
public class Dept implements Serializable {

	private static final long serialVersionUID = 7813835621011227273L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=50)
	private String deptName;
	@Column(length=20)
	private String deptNo;
	@Column
	private Long officeNo;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public Long getOfficeNo() {
		return officeNo;
	}
	public void setOfficeNo(Long officeNo) {
		this.officeNo = officeNo;
	}

}
