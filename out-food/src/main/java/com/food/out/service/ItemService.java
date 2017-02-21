package com.food.out.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.food.out.model.Item;
import com.food.out.page.Page;

public interface ItemService {
	int deleteByPrimaryKey(Integer id);

    int insert(Item record) throws Exception;

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
    public Page<Item> getItemsByPage(Page<Item> page);
    
    List<Item>  getItems(Map<String, Object> params);
    /**
     * 根据shopId 查询出所有的Item list
     * @param shopId
     * @return
     */
    public List<Item> getItemsByShopId(Integer shopId);
}
