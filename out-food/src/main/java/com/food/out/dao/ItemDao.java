package com.food.out.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.food.out.model.Item;
@Repository("itemDao")
public interface ItemDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Item record);

    int insertSelective(Item record);

    Item selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKeyWithBLOBs(Item record);

    int updateItem(Item record);
    
    /**
     * 查询列表数量
     *
     * @param params
     * @return
     */
    Integer getItemsCount(Map<String, Object> params);
    
    /**
     * 查询列表
     *
     * @param params
     * @return
     */
    public List<Item> getItems(Map<String, Object> params);
    /**
     * 根据shopId 查询出所有的Item list
     * @param shopId
     * @return
     */
    public List<Item> getItemsByShopId(@Param(value = "shopId") Integer shopId);
}