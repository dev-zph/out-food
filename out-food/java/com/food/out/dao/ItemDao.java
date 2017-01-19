package com.food.out.dao;

import java.util.List;
import java.util.Map;

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
}