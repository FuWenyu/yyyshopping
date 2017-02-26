/*
 * 

 * 
 */
package com.easyshopping.dao.impl;

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

}