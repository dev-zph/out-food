/**
 * 
 */
package com.food.out.service;

import java.util.List;
import java.util.Map;

import com.food.out.model.CartItem;

/**
 *购物车服务层
 * @author 陈佳
 * @createTime 2017年1月23日 上午10:48:17
 * 
 */
public interface CartItemService {
	/**
	 * 根据id查询cartItem对象
	 * @param key
	 * @return
	 */
	CartItem selectById(Integer key);
	/**
	 * 根绝用户Id查询 该用户的所有购物车里面的商品
	 * @param userId
	 * @return
	 */
	List<CartItem> selectByUserId(Integer userId);
	/**
	 * 插入
	 * @param cartItem
	 */
	void insertCartItem(CartItem cartItem);
	/**
	 * 更新
	 * @param cartItem
	 */
	void updateCartItem(CartItem cartItem);
	/**
	 * 查询符合条件的所有的对象集合
	 * @param param
	 * @return
	 */
	List<CartItem> getCartItems(Map<String, Object> param);
	/**
	 * 查询符合条件的总记录条数
	 * @param param
	 * @return
	 */
	Integer getCartItemCount(Map<String, Object> param);
}
