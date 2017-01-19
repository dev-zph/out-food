package com.xianguo.platform.service;

import java.util.List;
import java.util.Map;

import com.xianguo.platform.model.AbcPayInfo;
import com.xianguo.platform.model.Order;
import com.xianguo.platform.model.extend.OrderDetailBean;
import com.xianguo.platform.model.extend.OrderExportBean;

public interface IOrderService {
	void saveOrder(List<Order> orderList);

	void saveBailOrder(Order order);

	String getLastOrderNum(Integer userId);

	void updateOrder(Order order);
	
	void updateOrderById(Order order);
	
	Order getOrder(Map<String, Object> params);

	Integer getOrderListCount(Map<String, Object> params);

	List<Map<String, Object>> getOrderList(Map<String, Object> pramas);

	List<Map<String, Object>> getOrderDetailList(Map<String, Object> params);

	Map<String, Object> getOrderStatusCount(Integer orgId);

	void proccessReturn(OrderDetailBean orderDetail);

	Integer getOrderListCountByAdmin(Map<String, Object> params);

	List<Map<String, Object>> getOrderListByAdmin(Map<String, Object> pramas);

	List<Map<String, Object>> getShopOrderInfoForBill();

	List<Map<String, Object>> getShopOrderListForBill(Map<String, Object> params);
	
	Integer getOrderListCountForMyCenter(Map<String, Object> params);

	List<Order> getOrderListForMyCenter(Map<String, Object> pramas);
	

	/**
	 * 短信通知商户有新订单
	 * 
	 * @param order
	 */
	void sendOrderMessage(Order order);

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

	/**
	 * 获取不重复的订单列表
	 * @param paramsQ
	 * @return
	 */
	List<Order> getDistinctOrderList(Map<String, Object> params);

	/**
	 * 账期订单统计
	 * @param params
	 * @return
	 */
	Integer getOrderAccountPeriodListCount(Map<String, Object> params);
	/**
	 * 账期订单统计
	 * @param params
	 * @return
	 */
	Integer getOrderAccountPeriodListCountForMyCenter(Map<String, Object> params);

	/**
	 * 账期订单查询
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> getOrderAccountPeriodList(Map<String, Object> params);
	/**
	 * 账期订单查询
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> getOrderAccountPeriodListForMyCenter(Map<String, Object> params);

	/**
	 * 订单余款支付通知
	 * @param order
	 */
	void sendOrderPayRestMessage(Order order);

	List<OrderExportBean> getDistinctOrderExportList(Map<String, Object> orderParam);
	
	
	/**
	 * 更新订单状态和支付订单状态
	 * @param abcPayInfo
	 * @param order
	 */
	public void updateOrderAndAbcPayInfo(AbcPayInfo abcPayInfo,Order order);
	public Integer getCommentState(Map<String,Object> map);
	
	/**
	 * 根据传入的orderNums判断所属的orgIds是否是同一个,如果不是则抛异常，否则返回orgid
	 * @throws Exception 
	 */
	
	public Integer checkOrgSameByOrderNum(String[] orderNums) throws Exception;
}
