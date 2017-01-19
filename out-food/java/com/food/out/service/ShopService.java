package com.food.out.service;

import java.util.List;

import com.food.out.model.Shop;

public interface ShopService {

    int deleteByPrimaryKey(Integer id);

    int insert(Shop record);

    int insertSelective(Shop record);

    Shop selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
    /**
     * 根据userId查询出店铺信息
     */
    List<Shop> selectListByUserId(String userId, Integer status
	       , String deleted);

}
