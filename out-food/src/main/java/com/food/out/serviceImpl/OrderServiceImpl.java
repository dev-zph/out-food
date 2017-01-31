package com.food.out.serviceImpl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.food.out.common.OrderStatus;
import com.food.out.common.Status;
import com.food.out.dao.CartItemDao;
import com.food.out.dao.OrderDao;
import com.food.out.dao.ShopDao;
import com.food.out.exception.ApplicationException;
import com.food.out.model.CartItem;
import com.food.out.model.Order;
import com.food.out.model.Shop;
import com.food.out.service.CartItemService;
import com.food.out.service.OrderService;
import com.food.out.utils.MoneyUtil;
import com.food.out.utils.OrderUtil;

@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDao orderDao;
	@Resource
	private CartItemDao cartItemDao;
	@Resource
	private CartItemService cartItemService;
	@Resource
	private ShopDao shopDao;

	@Override
	public Integer getSellerOrderListCount(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getSellerOrderList(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.food.out.service.OrderService#insertOrderFromCart(java.util.List)
	 */
	@Override
	public void insertOrderOrderFromCart(List<CartItem> list) throws Exception{
		Order order = new Order();
		for (CartItem cartItem : list) {
			Integer itemId = cartItem.getItemId();
			Integer buyCount = cartItem.getBuyCount();
			Integer shopId = cartItem.getShopId();
			Integer userId = cartItem.getUserId();
			// 生成新的订单号
			String orderNum = OrderUtil.generateOrderNum(String.valueOf(userId));
			order.setOrderNum(orderNum);
			order.setIsDel(Status.DELETED_NO);
			order.setItemCount(buyCount);
			order.setItemId(itemId);
			order.setShopId(shopId);
			order.setStatus(OrderStatus.MAIJIA_QUREN.getCode());
			order.setUserId(cartItem.getUserId());
			orderDao.insert(order);
		}
	}

	@Override
	public void submitOrder(String address, Integer userId, Integer shopId) throws Exception {
		// 订单金额
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userId", userId);
		param.put("deleted", Status.DELETED_NO);
		param.put("shopId", Integer.valueOf(shopId));
		BigDecimal totalMoney = cartItemService.getCartTotalMoney(param);
		Shop shop = shopDao.selectByPrimaryKey(shopId);
		BigDecimal packageMon = shop.getPackageMon();
		BigDecimal sendMon = shop.getSendMon();
		totalMoney = MoneyUtil.add(MoneyUtil.add(totalMoney, packageMon), sendMon);
		// 店铺起送价格
		BigDecimal leastMon = shop.getLeastMon();
		// 判断金额
		if (leastMon.compareTo(totalMoney) == -1) {
			throw new ApplicationException("您的订单金额小于起送价，请继续添加商品!");
		}
		List<CartItem> list = cartItemService.getCartDetail(param);
		insertOrderOrderFromCart(list);
	}

}
