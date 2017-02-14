package com.paxonpilot.dgtransport.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * ’ÚΩ÷
 * @author Administrator
 *
 */
@Entity(name="street")
public class Street implements Serializable {

	private static final long serialVersionUID = 8411530404373327727L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private Long cityNo;
	@Column(length=100)
	private String streetName;
	@Column(length=20)
	private String streetNo;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getStreetNo() {
		return streetNo;
	}
	public void setStreetNo(String streetNo) {
		this.streetNo = streetNo;
	}

}
