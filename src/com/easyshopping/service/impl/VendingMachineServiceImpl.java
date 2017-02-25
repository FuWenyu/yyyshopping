/*
 * 

 * 
 */
package com.easyshopping.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.easyshopping.dao.VendingMachineDao;
import com.easyshopping.entity.Vendor;
import com.easyshopping.service.VendingMachineService;

/**
 * Service - 售货机
 * 
 * 
 * @version 1.0
 */
@Service("vendingMachineServiceImpl")
public class VendingMachineServiceImpl extends BaseServiceImpl<Vendor, Long> implements VendingMachineService {

	@Resource(name = "vendingMachineDaoImpl")
	private VendingMachineDao vendingMachineDao;

	@Resource(name = "vendingMachineDaoImpl")
	public void setBaseDao(VendingMachineDao vendingMachineDao) {
		super.setBaseDao(vendingMachineDao);
	}

	@Override
	public List<Vendor> findList(String longitude, String latitude) {
		return vendingMachineDao.findList(longitude, latitude);
	}

}