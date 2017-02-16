package com.food.out.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
    /**
     * 判断是否是 买家再自己的店家购物
     * @param userId
     * @param shopId
     * @return true :是同一家店,false:不是同一家店，可以购物
     */
    Boolean isSameShop(Integer userId , Integer shopId);
    /**
     * 获取销量最好的三家店
     * @return
     */
    List<Shop> selectOrderMastShops(Integer count);
    /**
     * 获取最新开出的shop
     * @param count
     * @return
     */
    List<Shop> selectNewShops(Integer count);

}
