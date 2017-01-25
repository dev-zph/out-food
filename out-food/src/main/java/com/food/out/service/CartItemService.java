/**
 * 
 */
package com.food.out.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.food.out.model.CartItem;
import com.food.out.model.parambeen.InsertCart;

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
 *  添加购物车，如果购物车已经有则改变数量，不然新增记录
 * @param param
 * @param request
 */
	void insertCartItem(InsertCart param,HttpServletRequest request);
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
