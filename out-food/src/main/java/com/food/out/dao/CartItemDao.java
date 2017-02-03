/**
 * 
 */
package com.food.out.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.food.out.model.CartItem;

/**
 * 购物车dao层
 * 
 * @author 陈佳
 * @createTime 2017年1月23日 上午10:39:47
 * 
 */
@Repository("cartItemDao")
public interface CartItemDao {
	/**
	 * 根据id查询cartItem对象
	 * 
	 * @param key
	 * @return
	 */
	CartItem selectById(Integer key);

	/**
	 * 根绝用户Id查询 该用户的所有购物车里面的商品
	 * 
	 * @param userId
	 * @return
	 */
	List<CartItem> selectByUserId(Integer userId);

	/**
	 * 插入
	 * 
	 * @param cartItem
	 */
	void insertCartItem(CartItem cartItem);

	/**
	 * 更新
	 * 
	 * @param cartItem
	 */
	void updateCartItem(CartItem cartItem);

	/**
	 * 查询符合条件的所有的对象集合
	 * 
	 * @param param
	 * @return
	 */
	List<CartItem> getCartItems(Map<String, Object> param);

	/**
	 * 查询符合条件的总记录条数
	 * 
	 * @param param
	 * @return
	 */
	Integer getCartItemCount(Map<String, Object> param);

	/**
	 * 查询下单页面，购物车详情页面的数据
	 * 
	 * @param param
	 * @return
	 */
	List<CartItem> getCartDetail(Map<String, Object> param);

	/**
	 * 查询购物车总计金额
	 * 
	 * @param param
	 * @return
	 */
	BigDecimal getCartTotalMoney(Map<String, Object> param);

	/**
	 * 根据userId 清空其购物车
	 * 
	 * @param userId
	 */
	void emptyCartItem(Integer userId);
}
