/*
 * 

 * 
 */
package com.easyshopping.controller.app;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyshopping.AppMessage;
import com.easyshopping.entity.Inventory;
import com.easyshopping.entity.Vendor;
import com.easyshopping.service.InventoryService;
import com.easyshopping.service.VendingMachineService;

/**
 * Controller - 售货机查询-APP
 * 
 * 
 * @version 1.0
 */
@Controller("appVendorController")
@RequestMapping("/app/vendor")
public class AppVendorController extends BaseController {

	@Resource(name = "vendingMachineServiceImpl")
	private VendingMachineService vendingMachineService;
	
	@Resource(name = "inventoryServiceImpl")
	private InventoryService inventoryService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public AppMessage list(HttpServletRequest httpServletRequest) {
		String longitude = (String)httpServletRequest.getAttribute("longitude");
		String latitude = (String)httpServletRequest.getAttribute("latitude");
		List<Vendor> list = vendingMachineService.findList(longitude,latitude);
		return new AppMessage().success("查询成功", list);
	}
	

	/**
	 * 列表
	 */
	@RequestMapping(value = "/queryInventory", method = RequestMethod.POST)
	@ResponseBody
	public AppMessage queryInventory(HttpServletRequest request) {
		String vendor_id = request.getParameter("vendor_id");
		String product_id = request.getParameter("product_id");
		if(vendor_id==null||"".equals(vendor_id)){
			AppMessage.warn("售货机不能为空");
		}
		if(product_id==null||"".equals(product_id)){
			product_id="-1";
		}
		List<Inventory> list = inventoryService.queryCount(Long.parseLong(vendor_id), Long.parseLong(product_id));
		if(list==null||list.size()==0){
			return AppMessage.warn("售货机无库存");
		}
		return AppMessage.success("查询成功", list);
	}
}