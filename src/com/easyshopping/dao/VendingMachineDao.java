/*
 * 

 * 
 */
package com.easyshopping.dao;

import java.util.List;

import com.easyshopping.entity.Vendor;

/**
 * Dao - 售货机
 * 
 * 
 * @version 1.0
 */
public interface VendingMachineDao extends BaseDao<Vendor, Long> {

	/**
	 * 按等级商品分类
	 * 
	 * @param grade
	 *            等级
	 * @return 商品分类列表
	 */
	List<Vendor> findList(String longitude,String latitude);
	
}