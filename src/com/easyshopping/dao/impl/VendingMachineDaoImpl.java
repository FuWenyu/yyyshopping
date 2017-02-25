/*
 * 

 * 
 */
package com.easyshopping.dao.impl;

import java.util.List;

import javax.persistence.FlushModeType;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.easyshopping.dao.VendingMachineDao;
import com.easyshopping.entity.Vendor;

/**
 * Dao - 售货机
 * 
 * 
 * @version 1.0
 */
@Repository("vendingMachineDaoImpl")
public class VendingMachineDaoImpl extends BaseDaoImpl<Vendor, Long> implements VendingMachineDao {

	@Override
	public List<Vendor> findList(String longitude, String latitude) {
		String jpql = "from Vendor";
		TypedQuery<Vendor> query = entityManager.createQuery(jpql, Vendor.class).setFlushMode(FlushModeType.COMMIT);
		return query.getResultList();
	}

}