package com.food.out.dao;

import org.springframework.stereotype.Repository;

import com.food.out.model.OrderSender;
@Repository("orderSenderDao")
public interface OrderSenderDao {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderSender record);

    int insertSelective(OrderSender record);

    OrderSender selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderSender record);

    int updateByPrimaryKey(OrderSender record);
}