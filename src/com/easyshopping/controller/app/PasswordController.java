/*
 * 

 * 
 */
package com.easyshopping.controller.app;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyshopping.AppMessage;
import com.easyshopping.Setting;
import com.easyshopping.entity.Member;
import com.easyshopping.service.CaptchaService;
import com.easyshopping.service.MailService;
import com.easyshopping.service.MemberService;
import com.easyshopping.util.SettingUtils;

/**
 * Controller - 密码
 * 
 * 
 * @version 1.0
 */
@Controller("appPasswordController")
@RequestMapping("/app/password")
public class PasswordController extends BaseController {

	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "mailServiceImpl")
	private MailService mailService;


	/**
	 * 修改密码
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody
	AppMessage find(HttpServletRequest request) {
		if (StringUtils.isEmpty(request.getParameter("userId"))) {
			return AppMessage.error("用户ID不能为空");
		}
		if (StringUtils.isEmpty(request.getParameter("passwordOld"))) {
			return AppMessage.error("原密码不能为空");
		}
		if (StringUtils.isEmpty(request.getParameter("passwordNew"))) {
			return AppMessage.error("新密码不能为空");
		}
		Member member = memberService.find(Long.parseLong(request.getParameter("userId")));
		if (member == null) {
			return AppMessage.error("用户不存在");
		}
		if (!DigestUtils.md5Hex(request.getParameter("passwordOld")).equals(member.getPassword())) {
			return AppMessage.error("密码不正确");
		}else{
			member.setPassword(DigestUtils.md5Hex(request.getParameter("passwordNew")));
			memberService.update(member);
		}
		return AppMessage.success("密码修改成功");
	}

	
	/**
	 * 重置密码提交
	 */
	@RequestMapping(value = "reset", method = RequestMethod.POST)
	public @ResponseBody
	AppMessage reset(HttpServletRequest request) {
		Setting setting = SettingUtils.get();
		if (StringUtils.isEmpty(request.getParameter("username"))) {
			return AppMessage.error("用户名不能为空");
		}
		Member member = memberService.login(request.getParameter("username"));
		if (member == null) {
			return AppMessage.error("用户不存在");
		}
		if (StringUtils.isEmpty(request.getParameter("passwordNew"))) {
			return AppMessage.error("新密码不能为空");
		}
		if (StringUtils.isEmpty(request.getParameter("vCode"))) {
			return AppMessage.error("验证码不能为空");
		}
		if(StringUtils.isEmpty(member.getvCode())){
			return AppMessage.error("未获取验证码");
		}
		if(!member.getvCode().equals(request.getParameter("vCode"))){
			return AppMessage.error("验证码错误");
		}
		if(new Date().after(DateUtils.addMinutes(member.getvCodeCreate(), setting.getVcodeExpiryTime()))){
			return AppMessage.error("验证码失效");
		}
		member.setPassword(DigestUtils.md5Hex(request.getParameter("passwordNew")));
		memberService.update(member);
		return AppMessage.success("密码重置成功");
	}
	
	/**
	 * 短信验证码
	 */
	@RequestMapping(value = "verificationCode", method = RequestMethod.POST)
	public @ResponseBody
	AppMessage verificationCode(HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();
		if (StringUtils.isEmpty(request.getParameter("username"))) {
			return AppMessage.error("用户名不能为空");
		}
		Member member = memberService.login(request.getParameter("username"));
		if (member == null) {
			return AppMessage.error("用户不存在");
		}
		int vCode = (int)((Math.random()*9+1)*100000);
		Date date = new Date();
		//接短信平台发送短信
		member.setvCode(String.valueOf(vCode));
		member.setvCodeCreate(date);
		memberService.update(member);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		map.put("vCode", vCode);
		map.put("vCodeCreate", df.format(date));
		return AppMessage.success("成功",map);
	}

}