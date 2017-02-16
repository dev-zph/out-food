package com.food.out.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.food.out.model.Shop;
@Repository("shopDao")
public interface ShopDao {
    int deleteByPrimaryKey(Integer id);


    int insertSelective(Shop record);

    Shop selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
    /**
     * 根据userId查询shop对象集合
     * @param id
     * @return
     */
    List<Shop>  selectListByUserId(Map<String, Object> params);
    /**
     * 根据userId查询自己的shop对象
     * @param userId
     * @return
     */
    Shop selectShopByUserId(Integer userId);
    /**
     * 根据传入的shopIds
     * @param shopIds
     * @return
     */
    List<Shop> selectShopsByShopIds(@Param(value = "shopIds")List<Integer> shopIds);
    
    /**
     * 获取最新开出的shop
     * @param count
     * @return
     */
    List<Shop> selectNewShops(@Param(value = "count") Integer count);
}