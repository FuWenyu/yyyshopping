/*
 * 

 * 
 */
package com.easyshopping.dao;

import java.util.List;

import com.easyshopping.Page;
import com.easyshopping.Pageable;
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

	/**
	 * 根据售货机编码/名称查询
	 * @param searchText
	 * @param pageable
	 * @return
	 */
	Page<Vendor> findPageByCodeOrName(String searchText, Pageable pageable);
	
}