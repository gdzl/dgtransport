package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
@Entity(name="sysuser")
public class User implements Serializable {

	private static final long serialVersionUID = 5752921215922041252L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=50)
	private String userName;
	@Column(length=100)
	private String cName;
	@Column(length=50)
	private String password;
	@Column(length=50)
	private String phone;
	@Column
	private Integer state;//1:∆Ù”√,0:Õ£”√
	@Column
	private Long roleId;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", cName=" + cName
				+ ", password=" + password + ", phone=" + phone + ", state="
				+ state + ", roleId=" + roleId + "]";
	}
}
