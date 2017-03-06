/*
 * 

 * 
 */
package com.easyshopping.controller.app;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyshopping.AppMessage;
import com.easyshopping.service.BrandService;
import com.easyshopping.service.ProductCategoryService;

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
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public AppMessage list(HttpServletRequest httpServletRequest) {
		return new AppMessage().success("查询成功", productCategoryService.findList(1));
	}

}