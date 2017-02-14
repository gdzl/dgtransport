package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name="annexdetail")
public class AnnexDetail implements Serializable{
	private static final long serialVersionUID = 3069528032932354591L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=100)
	private String fileName;//文件名
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date uploadTime;//上传时间
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deadLine;//有效时间
	@Column
	private Long entityId;//实体Id
	@Column(length=200)
	private String fileUrl;
	@Column
	private Integer uploadType;//(1:道路运输经营许可证;2:工商营业执照;3:安全生产管理制度;4:安全应急制度)
	@Column
	private Integer entityType;//(1:企业;2:车辆;3:人员)
	@Column
	private Integer isValidity;//(删除标识)
	
	public void setId(Long id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public Long getId() {
		return id;
	}
	public Long getEntityId() {
		return entityId;
	}
	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}
	public Integer getUploadType() {
		return uploadType;
	}
	public void setUploadType(Integer uploadType) {
		this.uploadType = uploadType;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public Date getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}
	public Integer getEntityType() {
		return entityType;
	}
	public void setEntityType(Integer entityType) {
		this.entityType = entityType;
	}
	public Integer getIsValidity() {
		return isValidity;
	}
	public void setIsValidity(Integer isValidity) {
		this.isValidity = isValidity;
	}
	
}
