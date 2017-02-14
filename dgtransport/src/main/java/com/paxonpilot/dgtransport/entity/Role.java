package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * ½ÇÉ«
 * @author Administrator
 *
 */
@Entity(name="role")
public class Role implements Serializable {

	private static final long serialVersionUID = -5034307539868327687L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String roleId;
	
	@Column(length=50)
	private String roleName;
	@Column
	private Long systemNo;
	@Column
	private Integer priviledge;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Long getSystemNo() {
		return systemNo;
	}
	public void setSystemNo(Long systemNo) {
		this.systemNo = systemNo;
	}
	public Integer getPriviledge() {
		return priviledge;
	}
	public void setPriviledge(Integer priviledge) {
		this.priviledge = priviledge;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

}
