package com.food.out.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.food.out.model.CartItem;
import com.food.out.model.Order;

public interface OrderService {
	/**
	 * 卖家中心 订单列表统计
	 * 
	 * @param params
	 * @return
	 */
	Integer getSellerOrderListCount(Map<String, Object> params);

	/**
	 * 卖家中心，订单列表
	 * 
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> getSellerOrderList(Map<String, Object> params);

	/**
	 * 根据传入的
	 * 
	 * @param CartItem
	 *            list 封装成 Order list
	 * @throws Exception 
	 */
	void insertOrderOrderFromCart(List<CartItem> list) throws Exception;

	/**
	 * 提交订单
	 * 
	 * @param address
	 * @param userId
	 * @param shopId
	 * @throws Exception 
	 */
	void submitOrder(String address, Integer userId, Integer shopId) throws Exception;
}
