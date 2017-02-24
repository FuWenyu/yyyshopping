/*
 * 

 * 
 */
package com.easyshopping.dao;

import java.util.List;
import java.util.Map;

import com.easyshopping.entity.ProductCategory;

/**
 * Dao - 商品分类
 * 
 * 
 * @version 1.0
 */
public interface ProductCategoryDao extends BaseDao<ProductCategory, Long> {

	/**
	 * 按等级商品分类
	 * 
	 * @param grade
	 *            等级
	 * @return 商品分类列表
	 */
	List<Map<String,Object>> findList(Integer grade);
	
	/**
	 * 查找顶级商品分类
	 * 
	 * @param count
	 *            数量
	 * @return 顶级商品分类
	 */
	List<ProductCategory> findRoots(Integer count);

	/**
	 * 查找上级商品分类
	 * 
	 * @param productCategory
	 *            商品分类
	 * @param count
	 *            数量
	 * @return 上级商品分类
	 */
	List<ProductCategory> findParents(ProductCategory productCategory, Integer count);

	/**
	 * 查找下级商品分类
	 * 
	 * @param productCategory
	 *            商品分类
	 * @param count
	 *            数量
	 * @return 下级商品分类
	 */
	List<ProductCategory> findChildren(ProductCategory productCategory, Integer count);

}