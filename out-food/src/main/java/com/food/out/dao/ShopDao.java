package com.food.out.dao;

import java.util.List;
import java.util.Map;

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
}