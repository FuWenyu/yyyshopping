/*
 * 

 * 
 */
package com.easyshopping.controller.app;


import javax.annotation.Resource;

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
	public ModelMap list(ModelMap model) {
		model.addAttribute("productCategoryTree", productCategoryService.findTree());
		return model;
	}


}