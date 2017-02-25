/*
 * 

 * 
 */
package com.easyshopping.service;

import java.util.List;

import com.easyshopping.entity.Vendor;

/**
 * Service - 标签
 * 
 * 
 * @version 1.0
 */
public interface VendingMachineService extends BaseService<Vendor, Long> {

	List<Vendor> findList(String longitude,String latitude);
	
}