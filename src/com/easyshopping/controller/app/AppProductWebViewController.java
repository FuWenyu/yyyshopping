/*
 * 

 * 
 */
package com.easyshopping.controller.app;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyshopping.AppMessage;
import com.easyshopping.entity.Ad.Type;
import com.easyshopping.entity.Product;
import com.easyshopping.service.BrandService;
import com.easyshopping.service.ProductCategoryService;
import com.easyshopping.service.ProductService;

/**
 * Controller - 商品介绍WebView
 * 
 * 
 * @version 1.0
 */
@Controller("appProductWebViewController")
@RequestMapping("/app/product")
public class AppProductWebViewController extends BaseController {

	@Resource(name = "productServiceImpl")
	private ProductService productService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/webview", method = RequestMethod.GET)
	public String webView(Long id,ModelMap model) {
		Product product = productService.find(id);
//		Product product = productService.find(Long.parseLong(httpServletRequest.getParameter("id")));
		model.addAttribute("product", product);
		return "/app/webview/product";
	}
}