/*
 * 

 * 
 */
package com.easyshopping.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.easyshopping.dao.InventoryDao;
import com.easyshopping.entity.Inventory;
import com.easyshopping.service.InventoryService;

/**
 * Service -  库存（商品、售货机关联）
 * 
 * 
 * @version 1.0
 */
@Service("inventoryServiceImpl")
public class InventoryServiceImpl extends BaseServiceImpl<Inventory, Long> implements InventoryService {

	@Resource(name = "inventoryDaoImpl")
	private InventoryDao inventoryDao;

	@Resource(name = "inventoryDaoImpl")
	public void setBaseDao(InventoryDao inventoryDao) {
		super.setBaseDao(inventoryDao);
	}

}