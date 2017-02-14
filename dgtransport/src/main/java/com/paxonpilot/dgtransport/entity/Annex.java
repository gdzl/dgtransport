package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

//@Entity(name="annex")
public class Annex implements Serializable{
	private static final long serialVersionUID = 3069528032932354591L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=100)
	private String fileName;//�ļ���
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String uploadTime;//�ϴ�ʱ��
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String deadLine;//��Чʱ��
	@Column
	private Long entityId;//ʵ��Id
	@Column
	private Integer typeId;//ʵ������(1:��ҵ;2:����;3:Ա��)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}
	public Long getEntityId() {
		return entityId;
	}
	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
}
