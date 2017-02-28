/*
 * 

 * 
 */
package com.easyshopping.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.easyshopping.dao.InventoryDao;
import com.easyshopping.entity.Inventory;

/**
 * Dao - 库存（售货机-商品关联）
 * 
 * 
 * @version 1.0
 */
@Repository("inventoryDaoImpl")
public class InventoryDaoImpl extends BaseDaoImpl<Inventory, Long> implements InventoryDao {

	@Override
	public List<Inventory> queryCount(String vendor_d, String product_id) {
		return null;
	}

}