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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.food.out.common.ResponseJsonResult;
import com.food.out.common.Status;
import com.food.out.exception.ApplicationException;
import com.food.out.model.Order;
import com.food.out.model.User;
import com.food.out.model.querybeen.Query1;
import com.food.out.service.OrderService;
import com.food.out.utils.JsonUtils;

/**
 * @author 陈佳
 * @createTime 2017年1月23日 上午9:31:07
 * 
 */
@Controller
@RequestMapping("order/")
public class OrderController extends BaseController {
	private final static Logger logger = Logger.getLogger(OrderController.class);

	@Resource
	private OrderService orderService;

	/**
	 * 买家下单
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "submitOrder", method = RequestMethod.POST)
	public void submitOrder(HttpServletRequest request, HttpServletResponse response) {
		ResponseJsonResult result = new ResponseJsonResult();
		try {
			User user = getSessionUser(request);
			String address = request.getParameter("address");
			String shopId = request.getParameter("shopId");
			if (StringUtils.isEmpty(address)) {
				throw new ApplicationException("请输入您的需要配送的地址！");
			}
			if (StringUtils.isEmpty(shopId)) {
				throw new ApplicationException("系统出错，请联系管理员！");
			}
			Integer userId = user.getId();
			orderService.submitOrder(address, userId, Integer.valueOf(shopId));
			result.setCode(Status.SUCCESS);
			result.setMessage("订单提交成功，请勿重复提交!");
		} catch (ApplicationException e) {
			result.setCode(Status.FAIL);
			result.setMessage(e.getMessage());
			logger.error("提交订单失败", e);
		} catch (Exception e) {
			result.setCode(Status.FAIL);
			result.setMessage("提交失败！");
			logger.error("提交订单失败", e);
		}
		JsonUtils.renderJSON(response, result);
	}

	/**
	 * 查询 店铺的订单
	 * 
	 * @param request
	 * @param response
	 * @param status
	 *            订单的状态
	 */
	@RequestMapping("getShopOrderList")
	public ModelAndView getShopOrderList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("order/shop-order-list");
		try {
			User user = getSessionUser(request);
			String status = request.getParameter("status");
			String orderNum = request.getParameter("orderNum");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			Query1 query = new Query1(user.getId(), status, startDate, endDate,orderNum);
			List<Order> orderList = orderService.getOrderListByUserId(query);
			view.addObject("orderList", orderList);
			view.addObject("status", status);
			view.addObject("startDate", startDate);
			view.addObject("endDate", endDate);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询订单失败!", e);
		}
		return view;
	}
}
