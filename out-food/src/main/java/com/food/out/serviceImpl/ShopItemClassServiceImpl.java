package com.food.out.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.food.out.dao.ShopItemClassDao;
import com.food.out.model.ShopItemClass;
import com.food.out.service.ShopItemClassService;
@Service("shopItemClassService")
public class ShopItemClassServiceImpl implements ShopItemClassService{

	@Resource private ShopItemClassDao  shopItemClassDao;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(ShopItemClass record) {
		// TODO Auto-generated method stub
		return shopItemClassDao.insert(record);
	}

	@Override
	public int insertSelective(ShopItemClass record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ShopItemClass selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(ShopItemClass record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(ShopItemClass record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ShopItemClass> selectClassListByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		List <ShopItemClass> list = shopItemClassDao.selectClassListByShopId(shopId);
		return list;
	}

}
