package com.food.out.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.food.out.dao.OrderDao;
import com.food.out.dao.ShopDao;
import com.food.out.model.Item;
import com.food.out.model.Shop;
import com.food.out.model.User;
import com.food.out.service.ShopService;

@Service("shopService")
public class ShopServiceImpl implements ShopService {

	@Resource
	private ShopDao shopDao;
	@Resource
	private OrderDao orderDao;

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
		return shopDao.selectByPrimaryKey(id);
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
	public List<Shop> selectListByUserId(String userId, Integer status, String deleted) {
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.food.out.service.ShopService#isSameShop(java.lang.Integer,
	 * java.lang.Integer)
	 */
	@Override
	public Boolean isSameShop(Integer userId, Integer shopId) {
		Boolean result = true;
		Shop shop1 = shopDao.selectShopByUserId(userId);
		if (shop1 == null) {
			result = false;
		} else {
			result = (shopId == shop1.getId());// 相等是true
		}
		return result;
	}

	@Override
	public List<Shop> selectOrderMastShops(Integer count) {
		List<Integer> shopIds = orderDao.selectOrderMastShops(count);
		List<Shop> shopList = new ArrayList<Shop>();
		if (shopIds.size() != 0 && shopIds != null) {
			shopList = shopDao.selectShopsByShopIds(shopIds);
		}
		return shopList;
	}

	@Override
	public List<Shop> selectNewShops(Integer count) {
		return shopDao.selectNewShops(count);
	}

	@Override
	public List<Shop> selectOrderGoodestShops(Integer count) {
		List<Integer> shopIds = orderDao.selectOrderGoodestShops(count);
		List<Shop> shopList = new ArrayList<Shop>();
		if (shopIds.size() != 0 && shopIds != null) {
			shopList = shopDao.selectShopsByShopIds(shopIds);
		}
		return shopList;
	}
	
	@Override
	public List<Shop> selectSponsorShop() {
		return shopDao.selectSponsorShop();
	}

	@Override
	public List<Shop> selectAllShops() {
		return shopDao.selectAllShops();
	}

}
