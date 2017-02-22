/*
 * 

 * 
 */
package com.easyshopping.controller.app;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.easyshopping.service.BrandService;
import com.easyshopping.service.ProductCategoryService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Controller - 商品分类-APP
 * 
 * 
 * @version 1.0
 */
@Controller("appProductCategoryController")
@RequestMapping("/app/product_category")
public class AppProductCategoryController extends BaseController {

	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String ,Object> list(HttpServletRequest httpServletRequest) {
		Map<String ,Object>  map = new HashMap<>();
		map.put("productCategoryTree", productCategoryService.findTree());
		return map;
	}

}