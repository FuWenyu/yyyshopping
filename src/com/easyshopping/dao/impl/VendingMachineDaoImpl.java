/*
 * 

 * 
 */
package com.easyshopping.dao.impl;

import org.springframework.stereotype.Repository;

import com.easyshopping.dao.VendingMachineDao;
import com.easyshopping.entity.vendor;

/**
 * Dao - 售货机
 * 
 * 
 * @version 1.0
 */
@Repository("vendingMachineDaoImpl")
public class VendingMachineDaoImpl extends BaseDaoImpl<vendor, Long> implements VendingMachineDao {

}