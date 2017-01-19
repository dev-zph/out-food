package com.food.out.service;

import java.util.List;
import java.util.Map;

import com.food.out.model.Order;


public interface OrderService {
	/**
	 * 卖家中心 订单列表统计
	 * @param params
	 * @return
	 */
	Integer getSellerOrderListCount(Map<String, Object> params);

	/**
	 * 卖家中心，订单列表
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> getSellerOrderList(Map<String, Object> params);
}
