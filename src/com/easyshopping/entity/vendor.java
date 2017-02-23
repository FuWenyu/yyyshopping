/*
 * 

 * 
 */
package com.easyshopping.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity - 自动售货机
 * 
 * 
 * @version 1.0
 */
@Entity
@Table(name = "xx_vendor")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_vendor_sequence")
public class vendor extends OrderEntity {

	private static final long serialVersionUID = 5095521437302782717L;

	/** 访问路径前缀 */
	private static final String PATH_PREFIX = "/vendor/list";

	/** 访问路径后缀 */
	private static final String PATH_SUFFIX = ".jhtml";

	/** 自动售货机编码 */
	private String vendor_code;

	/** 坐标（经纬度） */
	private String position;

	/** 地址*/
	private String address;

	/** 营业时间*/
	private String shophours;

	@NotEmpty
	@Length(max = 10)
	@Column(nullable = false)
	public String getVendor_code() {
		return vendor_code;
	}

	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
	}
	@NotEmpty
	@Length(max = 50)
	@Column(nullable = false)
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@NotEmpty
	@Length(max = 10)
	@Column(nullable = false)
	public String getShophours() {
		return shophours;
	}

	public void setShophours(String shophours) {
		this.shophours = shophours;
	}

}