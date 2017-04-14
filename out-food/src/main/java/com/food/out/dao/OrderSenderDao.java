package com.food.out.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.food.out.model.OrderSender;
import com.food.out.model.querybeen.OrderBeanForSender;
@Repository("orderSenderDao")
public interface OrderSenderDao {

    int insert(OrderSender record);

    OrderSender selectByKey(Integer id);
    /**
     * 根据orderId查询 接单记录
     * @param orderId
     * @return
     */
    OrderSender getSenderOrderByOrderId(@Param(value = "orderId") Integer orderId);
    
    /**
     * 
     * @param param
     * @return
     */
    List<OrderBeanForSender> getOrderListForSender(Map<String, Object> param);
}