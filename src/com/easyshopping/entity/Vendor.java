/*
 * 

 * 
 */
package com.easyshopping.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Entity - 自动售货机
 * 
 * 
 * @version 1.0
 */
@Entity
@Table(name = "xx_vendor")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_vendor_sequence")
public class Vendor extends OrderEntity {

	private static final long serialVersionUID = 5095521437302782717L;

	/** 访问路径前缀 */
	private static final String PATH_PREFIX = "/vendor/list";

	/** 访问路径后缀 */
	private static final String PATH_SUFFIX = ".jhtml";

	/** 自动售货机编码 */
	private String vendor_code;

	/** 坐标（经纬度） */
	private String position;

	/** 地址 */
	private String address;

	/** 营业时间 */
	private String shophours;

	/** 名称 */
	private String name;

	/** 折扣 */
	private String discount;

	/** 优惠 */
	private String privilege;

	/** 图片 */
	private String image;

	@JsonProperty
	@NotEmpty
	@Length(max = 10)
	@Column(nullable = false)
	public String getVendor_code() {
		return vendor_code;
	}

	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
	}

	@JsonProperty
	@NotEmpty
	@Length(max = 50)
	@Column(nullable = false)
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@JsonProperty
	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@JsonProperty
	@NotEmpty
	@Length(max = 10)
	@Column(nullable = false)
	public String getShophours() {
		return shophours;
	}

	public void setShophours(String shophours) {
		this.shophours = shophours;
	}

	@JsonProperty
	@NotEmpty
	@Length(max = 50)
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@JsonProperty
	@NotEmpty
	@Length(max = 10)
	@Column(nullable = false)
	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	@JsonProperty
	@NotEmpty
	@Length(max = 50)
	@Column(nullable = false)
	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

	@JsonProperty
	@NotEmpty
	@Length(max = 100)
	@Column(nullable = false)
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}