package com.food.out.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.food.out.model.ShopItemClass;
@Repository("shopItemClassDao")
public interface ShopItemClassDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ShopItemClass record);

    int insertSelective(ShopItemClass record);

    ShopItemClass selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShopItemClass record);

    int updateByPrimaryKey(ShopItemClass record);
    
    List<ShopItemClass>  selectClassListByShopId(Integer shopId);
}