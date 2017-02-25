package com.easyshopping.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyshopping.Message;
import com.easyshopping.Pageable;
import com.easyshopping.entity.BaseEntity.Save;
import com.easyshopping.entity.Vendor;
import com.easyshopping.service.VendingMachineService;

/**
 * Controller - 售货机管理
 * 
 * 
 * @version 1.0
 */
@Controller("vendingMachineController")
@RequestMapping("/admin/vending_machine")
public class VendingMachineController extends BaseController {

	@Resource(name = "vendingMachineServiceImpl")
	private VendingMachineService vendingMachineService;

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/vending_machine/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Vendor bean, RedirectAttributes redirectAttributes, @RequestParam("imageFile") MultipartFile file, HttpSession session) {
		if (!isValid(bean, Save.class)) {
			return ERROR_VIEW;
		}
		String relativePath = "upload\\image\\vendingMachine\\" + date2FileName("yyyyMMdd_HHmmss", ".jpg");
		String path=session.getServletContext().getRealPath("/") + relativePath;
		File newFile=new File(path);
		//通过CommonsMultipartFile的方法直接写文件
        try {
			file.transferTo(newFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return ERROR_VIEW;
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR_VIEW;
		}
        bean.setImage(relativePath);
		vendingMachineService.save(bean);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("Vendor", vendingMachineService.find(id));
		return "/admin/vending_machine/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Vendor bean, RedirectAttributes redirectAttributes, @RequestParam("imageFile") MultipartFile file, HttpSession session) {
		if (!isValid(bean)) {
			return ERROR_VIEW;
		}
		if(file.getSize()!=0){
			String relativePath = "upload\\image\\vendingMachine\\" + date2FileName("yyyyMMdd_HHmmss", ".jpg");
			String path=session.getServletContext().getRealPath("/") + relativePath;
			File newFile=new File(path);
			//通过CommonsMultipartFile的方法直接写文件
	        try {
				file.transferTo(newFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				return ERROR_VIEW;
			} catch (IOException e) {
				e.printStackTrace();
				return ERROR_VIEW;
			}
	        bean.setImage(relativePath);
		}
		vendingMachineService.update(bean, "orders");
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", vendingMachineService.findPage(pageable));
		return "/admin/vending_machine/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		vendingMachineService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
	/**
	 * 使用当前的系统时间来命名文件。
	 * 
	 * @param nameFormat
	 *            要命名的文件的日期格式 如："yyyyMMdd_HHmmss"
	 * @param fileType
	 *            文件的类型 如：".mp3"
	 * @return
	 */
	public static String date2FileName(String nameFormat, String fileType) {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat(nameFormat);
		String fileName = dateFormat.format(date) + fileType;
		return fileName;
	}
}
