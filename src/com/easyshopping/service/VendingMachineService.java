/*
 * 

 * 
 */
package com.easyshopping.service;

import java.util.List;

import com.easyshopping.Page;
import com.easyshopping.Pageable;
import com.easyshopping.entity.Vendor;

/**
 * Service - 标签
 * 
 * 
 * @version 1.0
 */
public interface VendingMachineService extends BaseService<Vendor, Long> {

	List<Vendor> findList(String longitude,String latitude);

	Page<Vendor> findPageByCodeOrName(String searchText, Pageable pageable);
	
}