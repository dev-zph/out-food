/**
 * 
 */
package com.food.out.serviceImpl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.food.out.common.Status;
import com.food.out.dao.CartItemDao;
import com.food.out.model.CartItem;
import com.food.out.model.querybeen.InsertCart;
import com.food.out.service.CartItemService;

/**
 * @author 陈佳
 * @createTime 2017年1月23日 上午10:51:58
 * 
 */
@Service("cartItemServiceImpl")
public class CartItemServiceImpl implements CartItemService {

	@Resource
	private CartItemDao cartItemDao;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.food.out.service.CartItemService#selectById(java.lang.Integer)
	 */
	@Override
	public CartItem selectById(Integer key) {
		// TODO Auto-generated method stub
		return cartItemDao.selectById(key);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.food.out.service.CartItemService#insertCartItem(com.food.out.model.
	 * CartItem)
	 */
	@Override
	public void insertCartItem(InsertCart param, HttpServletRequest request) {
		Integer userId = param.getUserId();
		Integer itemId = param.getItemId();
		Integer addCount = param.getAddCount();
		Integer shopId = param.getShopId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("itemId", itemId);
		List<CartItem> list = cartItemDao.getCartItems(map);
		if (list.size() != 0 && list != null) {//如果购物车已经有相同的商品，则不增加记录只更新数量
			CartItem oldCart = list.get(0);
			Integer oldCount = oldCart.getBuyCount();
			Integer newCount = oldCount + addCount;
			oldCart.setBuyCount(newCount);
			cartItemDao.updateCartItem(oldCart);
		} else {//不然则添加数量
			CartItem cartItem = new CartItem();   
			cartItem.setBuyCount(addCount);
			cartItem.setAddTime(new Date());
			cartItem.setDeleted(Status.DELETED_NO);
			cartItem.setItemId(itemId);
			cartItem.setUserId(userId);
			cartItem.setShopId(shopId);
			cartItemDao.insertCartItem(cartItem);
			//并更新购物车大件数
			Integer itemCount = (Integer) request.getSession().getAttribute(Status.USER_CART_ITEM_COUNT);
			request.getSession().setAttribute("itemCount", itemCount + 1);// 购物车显示的数量去掉删除的
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.food.out.service.CartItemService#updateCartItem(com.food.out.model.
	 * CartItem)
	 */
	@Override
	public void updateCartItem(CartItem cartItem) {
		// TODO Auto-generated method stub
		cartItemDao.updateCartItem(cartItem);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.food.out.service.CartItemService#getCartItems(java.util.Map)
	 */
	@Override
	public List<CartItem> getCartItems(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return cartItemDao.getCartItems(param);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.food.out.service.CartItemService#getCartItemCount(java.util.Map)
	 */
	@Override
	public Integer getCartItemCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return cartItemDao.getCartItemCount(param);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.food.out.service.CartItemService#selectByUerId(java.lang.Integer)
	 */
	@Override
	public List<CartItem> selectByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return cartItemDao.selectByUserId(userId);
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#getCartDetail(java.util.Map)
	 */
	@Override
	public List<CartItem> getCartDetail(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return cartItemDao.getCartDetail(param);
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#getCartTotalMoney(java.util.Map)
	 */
	@Override
	public BigDecimal getCartTotalMoney(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return cartItemDao.getCartTotalMoney(param);
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#deleteCart(java.lang.Integer)
	 */
	@Override
	public void deleteCart(Integer cartId) {
		CartItem cart = new CartItem();
		cart.setId(cartId);
		cart.setDeleted(Status.DELETED_YES);
		cartItemDao.updateCartItem(cart);
	}
}
