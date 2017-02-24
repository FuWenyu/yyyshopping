/*
 * 

 * 
 */
package com.easyshopping.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.easyshopping.dao.VendingMachineDao;
import com.easyshopping.entity.vendor;
import com.easyshopping.service.VendingMachineService;

/**
 * Service - 售货机
 * 
 * 
 * @version 1.0
 */
@Service("vendingMachineServiceImpl")
public class VendingMachineServiceImpl extends BaseServiceImpl<vendor, Long> implements VendingMachineService {

	@Resource(name = "vendingMachineDaoImpl")
	private VendingMachineDao vendingMachineDao;

	@Resource(name = "vendingMachineDaoImpl")
	public void setBaseDao(VendingMachineDao vendingMachineDao) {
		super.setBaseDao(vendingMachineDao);
	}

}