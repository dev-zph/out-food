package com.food.out.dao;

import org.springframework.stereotype.Repository;

import com.food.out.model.ShopSender;
@Repository("shopSenderDao")
public interface ShopSenderDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ShopSender record);

    int insertSelective(ShopSender record);

    ShopSender selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShopSender record);

    int updateByPrimaryKey(ShopSender record);
}