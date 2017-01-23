/**
 * 
 */
package com.food.out.controller;

import java.math.BigDecimal;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.food.out.common.Constants;
import com.food.out.common.ResponseJsonResult;
import com.food.out.common.Status;
import com.food.out.exception.ApplicationException;
import com.food.out.model.CartItem;
import com.food.out.model.User;
import com.food.out.service.CartItemService;
import com.food.out.utils.JsonUtils;
import com.food.out.utils.MoneyUtil;
import com.xianguo.platform.common.Constatus;


/**
 * @author 陈佳
 * @createTime 2017年1月23日 上午9:31:07
 * 
 */
public class CartController extends BaseController{
	private final static Logger logger = Logger.getLogger(CartController.class);
	
	@Resource
	private CartItemService cartItemService;
	/**
	 * 添加到购物车
	 */
	@RequestMapping("cart/addToCart/{itemId}")
	public void addToCart(@PathVariable("itemId") String itemId, @RequestParam("addCount") String addCount,
			HttpServletRequest request, HttpServletResponse response) {
		ResponseJsonResult result = new ResponseJsonResult();
		try {
			if(StringUtils.isEmpty(itemId)||StringUtils.isEmpty(addCount)){
				throw new ApplicationException("验证信息不全，未接收到数据!");
			}
			User user = this.getSessionUser(request);
			Integer userId = user.getId();
			CartItem item = new CartItem();
			item.setUserId(userId);
			item.setItemId(Integer.valueOf(itemId));
			item.setBuyCount(Integer.valueOf(addCount));
			item.setAddTime(new Date());
			item.setDeleted(Status.DELETED_NO);
			cartItemService.insertCartItem(item);
			//修改session购物车数量
			BigDecimal itemCount = (BigDecimal) request.getSession().getAttribute(Status.USER_CART_ITEM_COUNT);
			request.getSession().setAttribute("itemCount", MoneyUtil.add(itemCount, new BigDecimal(1)));// 购物车显示的数量去掉删除的
			
			result.setCode(Status.SUCCESS);
			result.setMessage("添加成功!");
		} catch (Exception e) {
			result.setCode(Status.SUCCESS);
			result.setMessage("添加失败!");
			e.printStackTrace();
		}
		JsonUtils.renderJSON(response, result);
	}
}
