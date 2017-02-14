package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
@Entity(name="sysdictionary")
public class Dictionary implements Serializable {

	private static final long serialVersionUID = 5752921215922041252L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=100)
	private String dictionaryName;
	@Column
	private Integer type;//字典类型(1:企业状态)
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDictionaryName() {
		return dictionaryName;
	}
	public void setDictionaryName(String dictionaryName) {
		this.dictionaryName = dictionaryName;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}

}
