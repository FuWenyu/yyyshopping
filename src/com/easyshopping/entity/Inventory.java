/*
 * 

 * 
 */
package com.easyshopping.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Store;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Entity - 库存（商品、售货机关联）
 * 
 * 
 * @version 1.0
 */
@Entity
@Table(name = "xx_inventory")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_inventory_sequence")
public class Inventory extends BaseEntity {

	private static final long serialVersionUID = 2868960983255085643L;

	/** 访问路径前缀 */
	private static final String PATH_PREFIX = "/inventory/list";

	/** 访问路径后缀 */
	private static final String PATH_SUFFIX = ".jhtml";

	/** 售货机ID */
	private Long vendor_id;

	/** 自动售货机编码 */
	private String vendor_code;

	/** 售货机名称 */
	private String vendor_name;

	/** 商品ID */
	private Long product_id;

	/** 商品编号 */
	private String sn;

	/** 商品名称 */
	private String product_name;

	/** 该售货机的对应的商品余量 */
	private int number;

	@JsonProperty
	@NotNull
	@Column(nullable = false)
	public Long getVendor_id() {
		return vendor_id;
	}

	public void setVendor_id(Long vendor_id) {
		this.vendor_id = vendor_id;
	}

	@JsonProperty
	@NotNull
	@Column(nullable = false)
	public Long getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Long product_id) {
		this.product_id = product_id;
	}

	@JsonProperty
	@NotNull
	@Column(nullable = false)
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

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
	public String getVendor_name() {
		return vendor_name;
	}

	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}

	@JsonProperty
	@Pattern(regexp = "[\\s\\S]*")
	@Length(max = 100)
	@Column(nullable = false, unique = true, length = 100)
	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	@JsonProperty
	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

}