/*
 * 

 * 
 */
package com.easyshopping.controller.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyshopping.AppMessage;
import com.easyshopping.entity.Vendor;
import com.easyshopping.service.VendingMachineService;

/**
 * Controller - 商品分类-APP
 * 
 * 
 * @version 1.0
 */
@Controller("appVendorController")
@RequestMapping("/app/vendor")
public class AppVendorController extends BaseController {

	@Resource(name = "vendingMachineServiceImpl")
	private VendingMachineService vendingMachineService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public AppMessage list(HttpServletRequest httpServletRequest) {
		String longitude = (String)httpServletRequest.getAttribute("longitude");
		String latitude = (String)httpServletRequest.getAttribute("latitude");
		List<Vendor> list = vendingMachineService.findList(longitude,latitude);
		return new AppMessage().success("查询成功", list);
	}
	
	/**
	 * 购买
	 */
	@RequestMapping(value = "/buy")
	@ResponseBody
	public AppMessage buy(HttpServletRequest httpServletRequest) {
		Map<String,Object> map = new HashMap<String,Object>();
		String vendor_id = httpServletRequest.getParameter("vendor_d");
		String product_id = httpServletRequest.getParameter("product_id");
		String count = httpServletRequest.getParameter("product_id");
		//List<Vendor> list = vendingMachineService.findList(longitude,latitude);
		return new AppMessage().success("查询成功", map);
	}

}