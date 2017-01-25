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
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.food.out.common.Constants;
import com.food.out.common.ResponseJsonResult;
import com.food.out.common.Status;
import com.food.out.exception.ApplicationException;
import com.food.out.model.CartItem;
import com.food.out.model.User;
import com.food.out.model.parambeen.InsertCart;
import com.food.out.service.CartItemService;
import com.food.out.utils.JsonUtils;
import com.food.out.utils.MoneyUtil;
import com.xianguo.platform.common.Constatus;

/**
 * @author 陈佳
 * @createTime 2017年1月23日 上午9:31:07
 * 
 */
@Controller
@RequestMapping("cart/")
public class CartController extends BaseController {
	private final static Logger logger = Logger.getLogger(CartController.class);

	@Resource
	private CartItemService cartItemService;

	/**
	 * 添加到购物车
	 */
	@RequestMapping("addToCart")
	public void addToCart(String itemId, String addCount, HttpServletRequest request, HttpServletResponse response) {
		ResponseJsonResult result = new ResponseJsonResult();
		try {
			if (StringUtils.isEmpty(itemId) || StringUtils.isEmpty(addCount)) {
				throw new ApplicationException("验证信息不全，未接收到数据!");
			}
			User user = this.getSessionUser(request);
			Integer userId = user.getId();
			InsertCart param = new InsertCart();
			param.setAddCount(Integer.valueOf(addCount));
			param.setItemId(Integer.valueOf(itemId));
			param.setUserId(userId);
			cartItemService.insertCartItem(param, request);
			result.setCode(Status.SUCCESS);
			result.setMessage("添加成功!");
		} catch (Exception e) {
			result.setCode(Status.FAIL);
			result.setMessage("添加失败!");
			logger.error("添加购物车失败!", e);
		}
		JsonUtils.renderJSON(response, result);
	}

	/**
	 * 跳转至我的购物车，结算页面
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("toCartCent")
	public ModelAndView addToCart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("/order/order-submit");
		try {
			User user = this.getSessionUser(request);
			Integer userId = user.getId();
		} catch (Exception e) {
		}
		return view;
	}
}
