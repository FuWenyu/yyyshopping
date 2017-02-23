/*
 * 

 * 
 */
package com.easyshopping.controller.app;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easyshopping.Message;
import com.easyshopping.Principal;
import com.easyshopping.entity.Cart;
import com.easyshopping.entity.Member;
import com.easyshopping.service.AreaService;
import com.easyshopping.service.CaptchaService;
import com.easyshopping.service.CartService;
import com.easyshopping.service.MemberAttributeService;
import com.easyshopping.service.MemberRankService;
import com.easyshopping.service.MemberService;
import com.easyshopping.service.RSAService;
import com.easyshopping.util.WebUtils;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		memberService.save(member);

		Cart cart = cartService.getCurrent();
		if (cart != null && cart.getMember() == null) {
			cartService.merge(member, cart);
			WebUtils.removeCookie(request, response, Cart.ID_COOKIE_NAME);
			WebUtils.removeCookie(request, response, Cart.KEY_COOKIE_NAME);
		}

		Map<String, Object> attributes = new HashMap<String, Object>();
		Enumeration<?> keys = session.getAttributeNames();
		while (keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			attributes.put(key, session.getAttribute(key));
		}
		session.invalidate();
		session = request.getSession();
		for (Entry<String, Object> entry : attributes.entrySet()) {
			session.setAttribute(entry.getKey(), entry.getValue());
		}

		session.setAttribute(Member.PRINCIPAL_ATTRIBUTE_NAME, new Principal(member.getId(), member.getMobile()));
		WebUtils.addCookie(request, response, Member.USERNAME_COOKIE_NAME, member.getMobile());

		return Message.success("shop.register.success");
	}

}