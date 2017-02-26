package com.easyshopping.controller.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyshopping.Message;
import com.easyshopping.Pageable;
import com.easyshopping.entity.BaseEntity.Save;
import com.easyshopping.entity.Inventory;
import com.easyshopping.service.InventoryService;

/**
 * Controller - 库存（商品、售货机关联）
 * 
 * 
 * @version 1.0
 */
@Controller("inventoryController")
@RequestMapping("/admin/inventory")
public class InventoryController extends BaseController {

	@Resource(name = "inventoryServiceImpl")
	private InventoryService inventoryService;

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/inventory/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Inventory bean, RedirectAttributes redirectAttributes) {
		if (!isValid(bean, Save.class)) {
			return ERROR_VIEW;
		}
		inventoryService.save(bean);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("inventory", inventoryService.find(id));
		return "/admin/inventory/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Inventory bean, RedirectAttributes redirectAttributes) {
		if (!isValid(bean)) {
			return ERROR_VIEW;
		}
		inventoryService.update(bean, "orders");
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", inventoryService.findPage(pageable));
		return "/admin/inventory/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		inventoryService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}
