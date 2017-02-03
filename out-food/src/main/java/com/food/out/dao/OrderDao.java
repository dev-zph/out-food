package com.food.out.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.food.out.model.Order;
@Repository("orderDao")
public interface OrderDao {

    int insert(Order record);

    Order selectByKey(Integer id);

    int updateOrder(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> getOrders(Map<String, Object> params);
    
    Integer getOrdersCount(Map<String, Object> params);
}