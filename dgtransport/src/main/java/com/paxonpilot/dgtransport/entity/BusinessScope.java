package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * ¾­Óª·¶Î§
 * @author Administrator
 *
 */
@Entity(name="businessscope")
public class BusinessScope implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5699722334580312406L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=50)
	private String scopeName;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getScopeName() {
		return scopeName;
	}
	public void setScopeName(String scopeName) {
		this.scopeName = scopeName;
	}
}
