package com.food.out.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.food.out.dao.ShopDao;
import com.food.out.model.Shop;
import com.food.out.model.User;
import com.food.out.service.ShopService;
@Service("shopService")
public class ShopServiceImpl implements ShopService{

	@Resource
	private ShopDao shopDao;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Shop record) {
		// TODO Auto-generated method stub
		
		return shopDao.insertSelective(record);
	}

	@Override
	public int insertSelective(Shop record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Shop selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Shop record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Shop record) {
		// TODO Auto-generated method stub
		return shopDao.updateByPrimaryKey(record);
	}

	@Override
	public List<Shop> selectListByUserId(String userId, Integer status,String deleted) {
		List<Shop> shops = null;
		if (!StringUtils.isEmpty(userId)) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("userId", userId);
			params.put("status", status);
			params.put("isDel", deleted);
			shops = shopDao.selectListByUserId(params);
		}
		return shops;
	}

}
