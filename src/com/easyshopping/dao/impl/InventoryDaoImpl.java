/*
 * 

 * 
 */
package com.easyshopping.dao.impl;

import java.util.List;

import javax.persistence.FlushModeType;

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
	public List<Inventory> queryCount(String vendor_id, String product_id) {
		String jpql = "select inventorys from Inventory inventorys where inventorys.vendor_id = :vendor_id and inventorys.product_id = :product_id order by inventorys.createDate desc";
		return entityManager.createQuery(jpql, Inventory.class).setFlushMode(FlushModeType.COMMIT).setParameter("vendor_id", vendor_id).setParameter("product_id", product_id).getResultList();
	}

}