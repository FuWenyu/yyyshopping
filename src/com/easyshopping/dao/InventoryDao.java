/*
 * 

 * 
 */
package com.easyshopping.dao;

import java.util.List;

import com.easyshopping.entity.Inventory;

/**
 * Dao - 库存（售货机-商品关联）
 * 
 * 
 * @version 1.0
 */
public interface InventoryDao extends BaseDao<Inventory, Long> {
	
	List<Inventory> queryCount(long vendor_id,long product_id);

	
}
