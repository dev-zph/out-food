package com.food.out.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.food.out.model.Order;
import com.food.out.model.querybeen.OrderDetailBean;
@Repository("orderDao")
public interface OrderDao {

    int insert(Order record);

    Order selectByKey(Integer id);

    int updateOrder(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> getOrders(Map<String, Object> params);
    
    Integer getOrdersCount(Map<String, Object> params);
    /**
	 * 查看订单详情
	 * @param params
	 * @return
	 */
	List<OrderDetailBean> getOrderDetailList(@Param(value = "id")Integer id);
	/**
	 * 找出销量最好的前n家的  shop_id list
	 * @param count
	 * @return
	 */
	List<Integer> selectOrderMastShops(@Param(value = "count") Integer count);
	/**找出评价最高的几家店 的 shop_id 的list
	 * @param count
	 * @return
	 */
	List<Integer> selectOrderGoodestShops(@Param(value = "count") Integer count);
} 