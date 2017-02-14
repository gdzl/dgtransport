package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;
@Entity(name="task")
public class Task implements Serializable{
	private static final long serialVersionUID = -2280765212960754748L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=200)
	private String taskName;
	@Column(length=200)
	private String taskDesc;
	@Column
	private Integer taskState;//(0:未完成;1:已完成)
	@Column
	private Long entityId;
	@Column
	private Integer entityType;//(1:企业;2:车辆;3:人员)
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createTime;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public Integer getTaskState() {
		return taskState;
	}
	public void setTaskState(Integer taskState) {
		this.taskState = taskState;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getEntityType() {
		return entityType;
	}
	public void setEntityType(Integer entityType) {
		this.entityType = entityType;
	}
	public String getTaskDesc() {
		return taskDesc;
	}
	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}
	public Long getEntityId() {
		return entityId;
	}
	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}

}
