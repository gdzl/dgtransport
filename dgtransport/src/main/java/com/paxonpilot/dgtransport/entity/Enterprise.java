package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * ��ҵ
 * @author Administrator
 *
 */
@Entity(name="enterprise")
public class Enterprise implements Serializable{
	private static final long serialVersionUID = 9221786666889111120L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=50)
	private String epNo;//��˾���
	@Column(length=100)
	private String epName;//��ҵ����
	@Column(length=500)
	private String address;//��Ӫ��ַ
	@Column(length=100)
	private String tpLicence;//��·���侭Ӫ���֤��
	@Column(length=100)
	private String icLicence;//����Ӫҵִ�պ�
	@Column
	private Long scopeNo;//��Ӫ��Χ
	@Column(length=1000)
	private String scopeName;//��Ӫ��Χ����
	@Column(length=100)
	private String corporation;//����������
	@Column(length=100)
	private String corcontact;//������������ϵ��ʽ
	@Column(length=100)
	private String businessor;//ҵ����ϵ��
	@Column(length=100)
	private String contact;//ҵ����ϵ����ϵ��ʽ
	@Column
	private Long cityNo;//�������
	@Column
	private Integer epState;//��ҵ״̬
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEpNo() {
		return epNo;
	}
	public void setEpNo(String epNo) {
		this.epNo = epNo;
	}
	public String getEpName() {
		return epName;
	}
	public void setEpName(String epName) {
		this.epName = epName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTpLicence() {
		return tpLicence;
	}
	public void setTpLicence(String tpLicence) {
		this.tpLicence = tpLicence;
	}
	public String getIcLicence() {
		return icLicence;
	}
	public void setIcLicence(String icLicence) {
		this.icLicence = icLicence;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public String getCorcontact() {
		return corcontact;
	}
	public void setCorcontact(String corcontact) {
		this.corcontact = corcontact;
	}
	public String getBusinessor() {
		return businessor;
	}
	public void setBusinessor(String businessor) {
		this.businessor = businessor;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Integer getEpState() {
		return epState;
	}
	public void setEpState(Integer epState) {
		this.epState = epState;
	}
	public Long getScopeNo() {
		return scopeNo;
	}
	public void setScopeNo(Long scopeNo) {
		this.scopeNo = scopeNo;
	}
	public Long getCityNo() {
		return cityNo;
	}
	public void setCityNo(Long cityNo) {
		this.cityNo = cityNo;
	}
	public String getScopeName() {
		return scopeName;
	}
	public void setScopeName(String scopeName) {
		this.scopeName = scopeName;
	}
	
	
}
