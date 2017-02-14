package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * Ä£¿é¹ÜÀí
 * @author Administrator
 *
 */
@Entity(name="subsystem")
public class SubSystem implements Serializable {
	private static final long serialVersionUID = 2491539686386736594L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private Long roleId;
	
	@Column
	private int systemNo;
	@Column(length=50)
	private String systemName;
	@Column(length=200)
	private String systemUrl;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSystemName() {
		return systemName;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	public String getSystemUrl() {
		return systemUrl;
	}
	public void setSystemUrl(String systemUrl) {
		this.systemUrl = systemUrl;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public int getSystemNo() {
		return systemNo;
	}
	public void setSystemNo(int systemNo) {
		this.systemNo = systemNo;
	}
}
