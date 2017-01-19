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

import com.food.out.common.Status;
import com.food.out.exception.ApplicationException;
import com.food.out.model.Shop;
import com.food.out.page.Page;
import com.food.out.service.OrderService;

@Controller
@RequestMapping("shopOrder/")
public class ShopOrderController {
	private final static Logger log = Logger.getLogger(ShopOrderController.class);
	@Resource
	private OrderService orderService;
	
	@RequestMapping("getShopOrderList")
	public ModelAndView getShopOrderList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("order/shop-order-list");
		try{
		Shop shop = (Shop) request.getSession().getAttribute(Status.SYSTEM_SHOP_KEYWORD);
		if(shop==null){
			throw new ApplicationException(Status.SHOP_NOT_FOUND);
		}
		Integer shopId = shop.getId();		
			String status = request.getParameter("status");
			if ("0".equals(status)) {
				view.addObject("status", "0");
				status = null;
			} else {
				view.addObject("status", status);
			}
			String pageNoParam = request.getParameter("pageNo");
			String orderNum = request.getParameter("orderNum");
			Integer pageNo = (pageNoParam == null ? 1 : Integer.valueOf(pageNoParam));
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("orderNum", orderNum);
			params.put("shopId", shopId);
			params.put("status", status);
			params.put("deleted", Status.DELETED_NO);
			
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			if(!StringUtils.isEmpty(startDate)){
			params.put("startDate", startDate);}
			if(!StringUtils.isEmpty(endDate)){
			params.put("endDate", endDate);}
			
			Integer count = orderService.getSellerOrderListCount(params);
			Page<Map<String, Object>> pageInfo = new Page<Map<String, Object>>(count, pageNo,
					request.getContextPath() + "/order/getShopOrderList.html", params);
			params.put("startNo", (pageInfo.pageNo - 1) * pageInfo.pageSize);
			params.put("pageSize", pageInfo.pageSize);
			params.put("pageNo", pageNo);
			List<Map<String, Object>> orderList = orderService.getSellerOrderList(params);
			view.addObject("pageInfo", pageInfo);
			view.addObject("shopId", shopId);// 商铺编号
			view.addObject("orderList", orderList);// 订单列表
			
			view.addObject("code",Status.SUCCESS);
			view.addObject("message","查询成功！");
		}catch(ApplicationException e){
			view.addObject("code",Status.FAIL);
			view.addObject("message","查询成失败！");
			log.error("shopOrder/getShopOrderList.html---ApplicationException ",e);
		}catch(Exception e){
			view.addObject("code",Status.FAIL);
			view.addObject("message","查询成失败！");
			log.error("shopOrder/getShopOrderList.html---Exception ",e);
		}
		return view;
	}
}
