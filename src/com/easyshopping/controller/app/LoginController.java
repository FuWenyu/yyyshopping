
package com.easyshopping.controller.app;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easyshopping.AppMessage;
import com.easyshopping.Setting;
import com.easyshopping.Setting.AccountLockType;
import com.easyshopping.entity.Member;
import com.easyshopping.service.CaptchaService;
import com.easyshopping.service.CartService;
import com.easyshopping.service.MemberService;
import com.easyshopping.service.RSAService;
import com.easyshopping.util.SettingUtils;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Controller - 会员登录
 * 
 * 
 * @version 1.0
 */
@Controller("appLoginController")
@RequestMapping("/app/login")
public class LoginController extends BaseController {

	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;
	@Resource(name = "rsaServiceImpl")
	private RSAService rsaService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "cartServiceImpl")
	private CartService cartService;

	/**
	 * 登录提交
	 */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody
	AppMessage submit( HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			
		Map<String,Object> map = new HashMap<>();
		String type="0";
		String content="succese";
		if (StringUtils.isEmpty(request.getParameter("username")) || StringUtils.isEmpty(request.getParameter("password"))) {
			return new AppMessage().error("用户名密码不为空", map);
		}
		Member member;
		Setting setting = SettingUtils.get();
		member = memberService.login(request.getParameter("username"));
		if (member == null) {
			return new AppMessage().error("用户名不正确", map);
		}
		
		if (member.getIsLocked()) {
			if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.member)) {
				int loginFailureLockTime = setting.getAccountLockTime();
				if (loginFailureLockTime == 0) {
					return new AppMessage().error("账户被锁定", map);
				}
				Date lockedDate = member.getLockedDate();
				Date unlockDate = DateUtils.addMinutes(lockedDate, loginFailureLockTime);
				if (new Date().after(unlockDate)) {
					member.setLoginFailureCount(0);
					member.setIsLocked(false);
					member.setLockedDate(null);
					memberService.update(member);
				} else {
					return new AppMessage().error("账户被锁定", map);
				}
			} else {
				member.setLoginFailureCount(0);
				member.setIsLocked(false);
				member.setLockedDate(null);
				memberService.update(member);
			}
		}

		if (!DigestUtils.md5Hex(request.getParameter("password")).equals(member.getPassword())) {
			int loginFailureCount = member.getLoginFailureCount() + 1;
			if (loginFailureCount >= setting.getAccountLockCount()) {
				member.setIsLocked(true);
				member.setLockedDate(new Date());
			}
			member.setLoginFailureCount(loginFailureCount);
			memberService.update(member);
			return new AppMessage().error("密码错误，错误次数"+loginFailureCount, map);
		}
		member.setLoginIp(request.getRemoteAddr());
		member.setLoginDate(new Date());
		member.setLoginFailureCount(0);
		memberService.update(member);

		map.put("type", type);
		map.put("content", content);
		map.put("userid", member.getId());
		map.put("username", member.getUsername());
		map.put("name", member.getName());
		map.put("gender", member.getGender());
		map.put("email", member.getEmail());
		map.put("mobile", member.getMobile());
		map.put("address", member.getAddress());
		map.put("memberRank", member.getMemberRank());
		map.put("point", member.getPoint());
		return new AppMessage().success("登录成功", map);
	}

}