/*
 * 

 * 
 */
package com.easyshopping.dao.impl;

import java.util.List;

import javax.management.Query;
import javax.persistence.FlushModeType;
import javax.persistence.TypedQuery;

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
	public List<Inventory> queryCount(long vendor_id, long product_id) {
		String jpql = "select inventorys from Inventory inventorys where inventorys.vendor_id = :vendor_id ";
		if(product_id!=-1){
			jpql = jpql +" and inventorys.product_id = :product_id ";
		}
		jpql = jpql + " order by inventorys.createDate desc";
		TypedQuery<Inventory> query = entityManager.createQuery(jpql, Inventory.class);
		query.setFlushMode(FlushModeType.COMMIT).setParameter("vendor_id", vendor_id);
		if(product_id!=-1){
			query.setParameter("product_id", product_id);
		}
		return query.getResultList();
	}

}
