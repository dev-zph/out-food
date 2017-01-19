package com.food.out.service;

import java.util.List;
import java.util.Map;

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
}
