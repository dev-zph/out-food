/**
 * 
 */
package com.food.out.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.food.out.common.OrderStatus;
import com.food.out.common.ResponseJsonResult;
import com.food.out.common.Status;
import com.food.out.exception.ApplicationException;
import com.food.out.model.Order;
import com.food.out.model.User;
import com.food.out.model.querybeen.OrderBeanForSender;
import com.food.out.model.querybeen.Query1;
import com.food.out.service.OrderSenderService;
import com.food.out.service.OrderService;
import com.food.out.utils.JsonUtils;

/**
 * @author 陈佳
 * @createTime 2017年3月3日 下午4:11:51
 * 
 */
@Controller
@RequestMapping("SenderOrder/")
public class SenderOrderController extends BaseController {
	private final static Logger log = Logger.getLogger(SenderOrderController.class);
	@Resource
	private OrderService orderService;
	@Resource
	private OrderSenderService orderSendService;

	/**
	 * 获取待接单的订单列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getOrderList")
	public ModelAndView getShopOrderList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("order/shop-order-list-sender");
		try {
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("status", OrderStatus.MAJIA_QUREN.getCode());
			List<OrderBeanForSender> list = orderSendService.getOrderListForSender(param);
			view.addObject("orderList", list);
			view.addObject("status", OrderStatus.MAJIA_QUREN.getCode());
		} catch (Exception e) {
			e.printStackTrace();
			log.error("查询订单失败!", e);
		}
		return view;
	}

	/**
	 * 骑士确认接单
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("receiveOrder")
	public void receiveOrder(HttpServletRequest request, HttpServletResponse response) {
		ResponseJsonResult result = new ResponseJsonResult();
		try {
			User user = getSessionUser(request);
			String id = request.getParameter("id");
			if (id == null || id == "") {
				throw new ApplicationException("请选择你要接单的订单号");
			}
			orderSendService.receiveOrder(Integer.valueOf(id), user);
			result.setCode(Status.SUCCESS);
			result.setMessage("接单成功，请尽快去商铺接单!");
		} catch (ApplicationException e) {
			result.setCode(Status.FAIL);
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			result.setCode(Status.FAIL);
			result.setMessage("接受订单失败!");
			log.error("查询订单失败!", e);
		}
		JsonUtils.render(response, JSONObject.toJSONString(result), Status.JSON_TYPE);
	}

	@RequestMapping("getSelfOrders")
	public ModelAndView getSelfOrders(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("order/person-order-send");
		try {
			User user = this.getSessionUser(request);
			if (null == user) {
				throw new ApplicationException("用户未登入");
			}
			String orderNum = request.getParameter("orderNum");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userId", user.getId());
			if (!StringUtils.isEmpty(orderNum)) {
				param.put("orderNum", orderNum);
			}
			param.put("status", OrderStatus.QISHI_JIEDANG.getCode());
			List<OrderBeanForSender> list = orderSendService.getOrderListForSender(param);
			view.addObject("orderList", list);
			view.addObject("orderNum", orderNum);
			view.addObject("status", OrderStatus.QISHI_JIEDANG.getCode());
		} catch (Exception e) {
			e.printStackTrace();
			log.error("查询订单失败!", e);
		}
		return view;
	}

	@RequestMapping("getOverOrders")
	public ModelAndView getOverOrders(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("order/shop-order-list-over");
		try {
			User user = this.getSessionUser(request);
			if (null == user) {
				throw new ApplicationException("用户未登入");
			}
			String orderNum = request.getParameter("orderNum");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userId", user.getId());
			if (!StringUtils.isEmpty(orderNum)) {
				param.put("orderNum", orderNum);
			}
			param.put("status", OrderStatus.ORDER_ARRIVE.getCode());
			List<OrderBeanForSender> list = orderSendService.getOrderListForSender(param);
			view.addObject("orderList", list);
			view.addObject("orderNum", orderNum);
			view.addObject("status", OrderStatus.ORDER_ARRIVE.getCode());
		} catch (ApplicationException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("查询订单失败!", e);
		}
		return view;
	}
	
	@RequestMapping("sureArrive")
	public void sureArrive(HttpServletRequest request, HttpServletResponse response) {
		ResponseJsonResult result = new ResponseJsonResult();
		try{
			User user = this.getSessionUser(request);
			if (null == user) {
				throw new ApplicationException("用户未登入");
			}
			String id = request.getParameter("id");
			if(org.apache.commons.lang.StringUtils.isEmpty(id)){
				throw new ApplicationException("请选择一个订单!");
			}
			orderSendService.sureArrive(Integer.valueOf(id),user.getId());
			result.setMessage("操作成功");
			result.setCode(Status.SUCCESS);
		} catch(ApplicationException e) {
			result.setMessage(e.getMessage());
			result.setCode(Status.FAIL);
		} catch(Exception e) {
			result.setMessage("操作失败");
			result.setCode(Status.FAIL);
		}
		JsonUtils.render(response, JSONObject.toJSONString(result), Status.JSON_TYPE);
	}
}
