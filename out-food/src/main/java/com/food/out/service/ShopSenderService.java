package com.food.out.service;

import com.food.out.model.ShopSender;

public interface ShopSenderService {
	int deleteByPrimaryKey(Integer id);

    int insert(ShopSender record);

    int insertSelective(ShopSender record);

    ShopSender selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShopSender record);

    int updateByPrimaryKey(ShopSender record);
}
