/*
 * 

 * 
 */
package com.easyshopping.service;

import java.util.List;

import com.easyshopping.entity.Inventory;

/**
 * Service - 库存（商品、售货机关联）
 * 
 * 
 * @version 1.0
 */
public interface InventoryService extends BaseService<Inventory, Long> {

	List<Inventory> queryCount(String vendor_id,String product_id);
}