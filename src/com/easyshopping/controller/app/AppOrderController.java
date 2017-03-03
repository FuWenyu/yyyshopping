/*
 * 

 * 
 */
package com.easyshopping.controller.app;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyshopping.AppMessage;
import com.easyshopping.entity.Inventory;
import com.easyshopping.entity.Member;
import com.easyshopping.entity.Order;
import com.easyshopping.entity.Order.OrderStatus;
import com.easyshopping.entity.Order.PaymentStatus;
import com.easyshopping.entity.Order.TakeStatus;
import com.easyshopping.entity.PaymentMethod;
import com.easyshopping.service.InventoryService;
import com.easyshopping.service.MemberService;
import com.easyshopping.service.OrderService;
import com.easyshopping.service.PaymentMethodService;

/**
 * Controller - 订单-APP
 * 
 * 
 * @version 1.0
 */
@Controller("appOrderController")
@RequestMapping("/app/order")
public class AppOrderController extends BaseController {

	@Resource(name = "inventoryServiceImpl")
	private InventoryService inventoryService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "paymentMethodServiceImpl")
	private PaymentMethodService paymentMethodService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	/**
	 * 下单
	 */
	@RequestMapping(value = "/create")
	@ResponseBody
	public AppMessage create(HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();

		String vendor_id = request.getParameter("vendor_id");
		String product_id = request.getParameter("product_id");
		String count = request.getParameter("count");
		BigDecimal amount = new BigDecimal(request.getParameter("amount"));
		List<Inventory> list = inventoryService.queryCount(Long.parseLong(vendor_id), Long.parseLong(product_id));
		if(list==null||list.size()==0){
			return AppMessage.warn("该售货机无此产品", map);
		}
		PaymentMethod paymentMethod = paymentMethodService.find(Long.parseLong(request.getParameter("paymentMethodId")));
		if (paymentMethod == null) {
			return AppMessage.warn("支付方式不存在", map);
		}
		if(Integer.parseInt(count)>list.get(0).getNumber()){
			return AppMessage.warn("库存不足", map);
		}
		Order order = orderService.createApp(list.get(0),paymentMethod,request.getParameter("memo"), null, request.getParameter("userId"),Integer.parseInt(count),amount);
		map.put("sn", order.getSn());
		map.put("takeCode", order.getTakeCode());
		return AppMessage.success("下单成功", map);
	}

	/**
	 * 退单
	 */
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public @ResponseBody
	AppMessage cancel(HttpServletRequest request) {
		Order order = orderService.findBySn(request.getParameter("sn"));
		Member member = memberService.find(Long.parseLong(request.getParameter("userId")));
		if (order != null && member.equals(order.getMember()) && !order.isExpired() && order.getOrderStatus() == OrderStatus.confirmed && order.getPaymentStatus() == PaymentStatus.paid&&order.getTakeStatus()==TakeStatus.untaked) {
			if (order.isLocked(null)) {
				return AppMessage.warn("订单已锁定");
			}
			orderService.cancelApp(order,null);
			return AppMessage.success("退单成功");
		}
		return AppMessage.error("退单失败");
	}
}
