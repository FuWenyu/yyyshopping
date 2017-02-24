/*
 * 

 * 
 */
package com.easyshopping.controller.app;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyshopping.Message;
import com.easyshopping.entity.Area;
import com.easyshopping.entity.Member;
import com.easyshopping.entity.Member.Gender;
import com.easyshopping.service.AreaService;
import com.easyshopping.service.CaptchaService;
import com.easyshopping.service.CartService;
import com.easyshopping.service.MemberAttributeService;
import com.easyshopping.service.MemberRankService;
import com.easyshopping.service.MemberService;
import com.easyshopping.service.RSAService;

/**
 * Controller - 会员注册
 * 
 * 
 * @version 1.0
 */
@Controller("appRegisterController")
@RequestMapping("/app/register")
public class RegisterController extends BaseController {

	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;
	@Resource(name = "rsaServiceImpl")
	private RSAService rsaService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "memberRankServiceImpl")
	private MemberRankService memberRankService;
	@Resource(name = "memberAttributeServiceImpl")
	private MemberAttributeService memberAttributeService;
	@Resource(name = "areaServiceImpl")
	private AreaService areaService;
	@Resource(name = "cartServiceImpl")
	private CartService cartService;

	/**
	 * 检查用户名是否被禁用或已存在
	 */
	@RequestMapping(value = "/check_username", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkUsername(String username) {
		if (StringUtils.isEmpty(username)) {
			return false;
		}
		if (memberService.usernameDisabled(username) || memberService.usernameExists(username)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 检查E-mail是否存在
	 */
	@RequestMapping(value = "/check_email", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkEmail(String email) {
		if (StringUtils.isEmpty(email)) {
			return false;
		}
		if (memberService.emailExists(email)) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 检查电话号是否存在
	 */
	@RequestMapping(value = "/check_mobile", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkPhone(String mobile) {
		if (StringUtils.isEmpty(mobile)) {
			return false;
		}
		if (memberService.mobileExists(mobile)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 注册提交
	 */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody
	Message submit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if (memberService.mobileExists(request.getParameter("mobile"))) {
			return Message.error("shop.register.emailExist");
		} 

		Member member = new Member();
		member.setMobile(request.getParameter("mobile"));
		member.setPassword(DigestUtils.md5Hex(request.getParameter("password")));
		member.setIsEnabled(true);
		member.setIsLocked(false);
		member.setLoginFailureCount(0);
		memberService.save(member);
		return Message.success("shop.register.success");
	}

	/**
	 * 维护用户信息
	 */
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public @ResponseBody
	Message updateMember(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		if (memberService.usernameDisabled(request.getParameter("username")) || memberService.usernameExists(request.getParameter("username"))) {
			return Message.error("shop.register.disabledExist");
		}
		if (memberService.emailExists(request.getParameter("email"))) {
			return Message.error("shop.register.emailExist");
		}
		
		Member member = memberService.find(Long.parseLong(request.getParameter("userId")));
		if(request.getParameter("username")!=null&&!"".equals(request.getParameter("username"))){
			member.setUsername(request.getParameter("username").toLowerCase());
		}
		member.setEmail(request.getParameter("email"));
		Area area = StringUtils.isNotEmpty(request.getParameter("area")) ? areaService.find(Long.valueOf(request.getParameter("area"))) : null;
		if (area != null) {
			member.setArea(area);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");  
	    Date date=null;
			try {
				date = sdf.parse(request.getParameter("birth"));
			} catch (java.text.ParseException e) {
				e.printStackTrace();
			}
		member.setBirth(date);
		Gender gender = StringUtils.isNotEmpty(request.getParameter("gender")) ? Gender.valueOf(request.getParameter("gender")) : null;
		if (gender != null) {
			member.setGender(gender);
		}
		member.setModifyDate(new Date());
		member.setName(request.getParameter("name"));
		member.setZipCode(request.getParameter("zipCode"));
		memberService.update(member);
		return Message.success("shop.register.success");
	}
}