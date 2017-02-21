package com.food.out.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.food.out.dao.ItemDao;
import com.food.out.model.Item;
import com.food.out.page.Page;
import com.food.out.service.ItemService;

@Service("itemService")
public class ItemServiceImpl implements ItemService{
	@Resource
	private ItemDao itemDao;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Item record) throws Exception{
		Map<String, Object> param = new HashMap<String,Object>();
		param.put("itemName", record.getItemName());
		List<Item>  itemList = itemDao.getItems(param);
		if(itemList.size()>0){
			new Exception("已存在该名称的商品!");
			return 0;
		}else{
		return itemDao.insert(record);}
	}

	@Override
	public int insertSelective(Item record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Item selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return itemDao.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Item record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeyWithBLOBs(Item record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateItem(Item record) {
		// TODO Auto-generated method stub
		return itemDao.updateItem(record);
	}

	@Override
	public Integer getItemsCount(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return itemDao.getItemsCount(params);
	}

	@Override
	public Page<Item> getItemsByPage(Page<Item> page) {
		List<Item> itemList = new ArrayList<Item>();
        try {
            Integer startNum = (page.pageNo - 1) * page.pageSize;
            page.conditions.put("startNum", startNum);
            page.conditions.put("pageSize", page.pageSize);
            itemList = itemDao.getItems(page.conditions);
            page.setRecords(itemList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return page;
	}

	@Override
	public List<Item> getItems(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return itemDao.getItems(params);
	}

	@Override
	public List<Item> getItemsByShopId(Integer shopId) {
		return itemDao.getItemsByShopId(shopId);
	}

}
