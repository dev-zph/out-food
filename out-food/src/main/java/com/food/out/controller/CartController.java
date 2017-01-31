/**
 * 
 */
package com.food.out.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.food.out.dao.CartItemDao;
import com.food.out.exception.ApplicationException;
import com.food.out.model.CartItem;
import com.food.out.model.User;
import com.food.out.model.querybeen.InsertCart;
import com.food.out.service.CartItemService;
import com.food.out.utils.JsonUtils;
import com.food.out.utils.MoneyUtil;
import com.xianguo.platform.common.Constatus;
import com.xianguo.platform.model.Address;

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
	 * 添加至购物车，一家商店，对应一个购物车,每个客户每进一家店对应一个购物车
	 * 
	 * @param itemId
	 * @param addCount
	 * @param shopId
	 * @param request
	 * @param response
	 */
	@RequestMapping("addToCart")
	public void addToCart(String itemId, String addCount, String shopId, HttpServletRequest request,
			HttpServletResponse response) {
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
			param.setShopId(Integer.valueOf(shopId));
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
	 * 跳转至我的对应的商店的购物车，结算页面
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("toPersonShopCart")
	public ModelAndView addToCart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("/order/order-submit");
		try {
			User user = this.getSessionUser(request);
			String shopId = request.getParameter("shopId");
			if (StringUtils.isEmpty(shopId)) {
				throw new ApplicationException("请至少选择一家商店的购物车!");
			}
			Integer userId = user.getId();
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userId", userId);
			param.put("deleted", Status.DELETED_NO);
			param.put("shopId", Integer.valueOf(shopId));
			List<CartItem> list = cartItemService.getCartDetail(param);
			BigDecimal totalMoney = cartItemService.getCartTotalMoney(param);
			BigDecimal one = new BigDecimal("1.00");
			totalMoney = MoneyUtil.multipy(totalMoney, one);
			BigDecimal packageMon = list.get(0).getPackageMon();
			BigDecimal sendMon = list.get(0).getSendMon();
			totalMoney =MoneyUtil.add(MoneyUtil.add(totalMoney, packageMon),sendMon);
			List<Address> addressList = new ArrayList<Address>();
			Address address = new Address();
			address.setProvince("浙江");
			address.setCity("杭州");
			address.setArea("西湖区");
			address.setAddressInfo("你好的街道");
			address.setUserName("zph");
			address.setPhone("15858331351");
			address.setIsDefault("0");
			addressList.add(address);
			view.addObject("addressList", addressList);
			view.addObject("itemList", list);
			view.addObject("totalMoney", totalMoney);
		} catch (ApplicationException e) {

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return view;
	}

	/**
	 * 逻辑删除 cart
	 * 
	 * @param request
	 * @param response
	 * @param cartId
	 * @return
	 */
	@RequestMapping("deleteCart")
	public void deleteCart(HttpServletRequest request, HttpServletResponse response, String cartId) {
		ResponseJsonResult result = new ResponseJsonResult();
		try {
			if (StringUtils.isEmpty(cartId)) {
				throw new ApplicationException("请选择一条记录进行删除,服务器未接收到您的操作数据!");
			}
			cartItemService.deleteCart(Integer.valueOf(cartId));
			result.setCode(Status.SUCCESS);
			result.setMessage("删除成功!");
		} catch (ApplicationException e) {
			result.setCode(Status.FAIL);
			result.setMessage(e.getMessage());
			logger.error(e);
		} catch (Exception e) {
			result.setCode(Status.FAIL);
			result.setMessage(e.getMessage());
			logger.error(e);
		}
	}
}
