/**
 * 
 */
package com.food.out.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.food.out.dao.CartItemDao;
import com.food.out.model.CartItem;
import com.food.out.service.CartItemService;

/**
 * @author 陈佳
 * @createTime 2017年1月23日 上午10:51:58
 * 
 */
@Service("cartItemServiceImpl")
public class CartItemServiceImpl implements CartItemService{

	@Resource
	private CartItemDao cartItemDao ;
	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#selectById(java.lang.Integer)
	 */
	@Override
	public CartItem selectById(Integer key) {
		// TODO Auto-generated method stub
		return cartItemDao.selectById(key);
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#insertCartItem(com.food.out.model.CartItem)
	 */
	@Override
	public void insertCartItem(CartItem cartItem) {
		// TODO Auto-generated method stub
		cartItemDao.insertCartItem(cartItem);
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#updateCartItem(com.food.out.model.CartItem)
	 */
	@Override
	public void updateCartItem(CartItem cartItem) {
		// TODO Auto-generated method stub
		cartItemDao.updateCartItem(cartItem);
		
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#getCartItems(java.util.Map)
	 */
	@Override
	public List<CartItem> getCartItems(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return cartItemDao.getCartItems(param);
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#getCartItemCount(java.util.Map)
	 */
	@Override
	public Integer getCartItemCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return cartItemDao.getCartItemCount(param);
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.CartItemService#selectByUerId(java.lang.Integer)
	 */
	@Override
	public List<CartItem> selectByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return cartItemDao.selectByUserId(userId);
	}

}
