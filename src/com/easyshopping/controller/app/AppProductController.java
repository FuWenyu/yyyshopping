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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyshopping.AppMessage;
import com.easyshopping.entity.Inventory;
import com.easyshopping.entity.Product;
import com.easyshopping.entity.ProductCategory;
import com.easyshopping.entity.Vendor;
import com.easyshopping.service.InventoryService;
import com.easyshopping.service.ProductCategoryService;
import com.easyshopping.service.ProductService;
import com.easyshopping.service.VendingMachineService;

/**
 * Controller - 售货机查询-APP
 * 
 * 
 * @version 1.0
 */
@Controller("appProductController")
@RequestMapping("/app/product")
public class AppProductController extends BaseController {

	@Resource(name = "productServiceImpl")
	private ProductService productService;

	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;
	
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
		Long productCategoryId = Long.valueOf(httpServletRequest.getParameter("productCategoryId"));
		ProductCategory productCategory = productCategoryService.find(productCategoryId);
		List<Product> list = productService.findList(productCategory,null,null);
		return new AppMessage().success("查询成功", list);
	}
	/**
	 * 详情
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	@ResponseBody
	public AppMessage detail(HttpServletRequest httpServletRequest) {
		Long vendorId = Long.valueOf(httpServletRequest.getParameter("vendorId"));
		Long productId = Long.valueOf(httpServletRequest.getParameter("productId"));
		List<Inventory> inventoryList = inventoryService.queryCount(vendorId, productId);
		Product product = productService.find(productId);
		Map<String,Object> map = new HashMap<>();
		product.setStock(inventoryList.get(0).getNumber());
		map.put("product", product);
		return new AppMessage().success("查询成功", map);
	}
	/**
	 * 列表
	 */
	@RequestMapping(value = "/webview", method = RequestMethod.GET)
	public String webView(Long productId,ModelMap model) {
		Product product = productService.find(productId);
		model.addAttribute("product", product);
		return "/app/webview/product";
	}
}