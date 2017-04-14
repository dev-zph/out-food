package com.food.out.service;

import java.util.List;
import java.util.Map;

import com.food.out.model.OrderSender;
import com.food.out.model.User;
import com.food.out.model.querybeen.OrderBeanForSender;

public interface OrderSenderService {
    int insert(OrderSender record);

    OrderSender selectByKey(Integer id);
    /**
     * 接单
     * @param orderId
     * @param user 登入用户
     */
    void receiveOrder(Integer orderId,User user);
    /**
     * 
     * @param param
     * @return
     */
    List<OrderBeanForSender> getOrderListForSender(Map<String,Object> param);
    
    /**
     * 骑士确认已经送达
     * 
     * @param orderId
     * @param userId
     */
    void sureArrive(Integer orderId , Integer userId);
}
