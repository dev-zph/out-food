package com.food.out.serviceImpl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.food.out.common.OrderStatus;
import com.food.out.common.Status;
import com.food.out.dao.CartItemDao;
import com.food.out.dao.ItemDao;
import com.food.out.dao.OrderDao;
import com.food.out.dao.OrderDetailDao;
import com.food.out.dao.ShopDao;
import com.food.out.exception.ApplicationException;
import com.food.out.model.CartItem;
import com.food.out.model.Item;
import com.food.out.model.Order;
import com.food.out.model.Shop;
import com.food.out.model.querybeen.OrderDetailBean;
import com.food.out.model.querybeen.Query1;
import com.food.out.model.OrderDetail;
import com.food.out.service.CartItemService;
import com.food.out.service.OrderService;
import com.food.out.service.ShopService;
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
	@Resource
	private ShopService shopService;
	@Resource
	private ItemDao itemDao;
	@Resource
	private OrderDetailDao detailDao;

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
	public void insertOrderOrderFromCart(List<CartItem> list, BigDecimal totalMoney) throws Exception{
		Order order = new Order();
		String orderNum = OrderUtil.generateOrderNum(String.valueOf(list.get(0).getUserId()));
		for (CartItem cartItem : list) {
			Integer itemId = cartItem.getItemId();
			Integer buyCount = cartItem.getBuyCount();
			
			Item item = itemDao.selectByPrimaryKey(itemId);
			BigDecimal itemPrice = item.getItemPrice();
			//订单明细
			OrderDetail detail = new OrderDetail();
			detail.setItemCount(buyCount);
			detail.setItemId(itemId);
			detail.setItemPrice(itemPrice);
			detail.setOrderNum(orderNum);
			detailDao.insert(detail);
		}
		order.setOrderNum(orderNum);
		order.setShopId(list.get(0).getShopId());
		order.setStatus(OrderStatus.MAIJIA_QUREN.getCode());
		order.setUserId(list.get(0).getUserId());
		order.setOrderPrice(totalMoney);
		orderDao.insert(order);
		//清空购物车
		cartItemDao.emptyCartItem(list.get(0).getUserId());
	}

	@Override
	public void submitOrder(String address, Integer userId, Integer shopId) throws Exception {
		//判断 买家 是否就是卖家
//		if(shopService.isSameShop(userId, shopId)){
//			throw new ApplicationException("您不可以在自己店家下订单哦！");
//		}
		// 订单金额
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userId", userId);
		param.put("deleted", Status.DELETED_NO);
		param.put("shopId", Integer.valueOf(shopId));
		BigDecimal totalMoney = cartItemService.getCartTotalMoney(param);
		if(totalMoney==null){
			throw new ApplicationException("您的购物车为空!");
		}
		Shop shop = shopDao.selectByPrimaryKey(shopId);
		BigDecimal packageMon = shop.getPackageMon();
		BigDecimal sendMon = shop.getSendMon();
		totalMoney = MoneyUtil.add(MoneyUtil.add(totalMoney, packageMon), sendMon);
		// 店铺起送价格
		BigDecimal leastMon = shop.getLeastMon();
		// 判断金额
		if (totalMoney.compareTo(leastMon) == -1) {
			throw new ApplicationException("您的订单金额小于起送价，请继续添加商品!");
		}
		List<CartItem> list = cartItemService.getCartDetail(param);
		if(list==null||list.size()==0){
			throw new ApplicationException("您的购物车为空!");
		}
		insertOrderOrderFromCart(list,totalMoney);
		
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.OrderService#getOrderListByUserId(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	public List<Order> getOrderListByUserId(Query1 query) throws Exception{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("userId", query.getUserId());
		param.put("status", Status.SHOP_APPLY_STATUS_YES);
		param.put("isDel", Status.DELETED_NO);
		List<Shop> shopList = shopDao.selectListByUserId(param);
		if(shopList==null||shopList.size()==0){
			throw new ApplicationException("未查询到您相关的店铺信息!");
		}
		Shop shop = shopList.get(0);
		Integer shopId = shop.getId();
		param = new HashMap<String,Object>();
		param.put("shopId", shopId);
		if(!StringUtils.isEmpty(query.getStatus())){
		param.put("status", Integer.valueOf(query.getStatus()));}
		param.put("isDel", Status.DELETED_NO);
		param.put("startDate", query.getStartDate());
		param.put("endDate", query.getEndDate());
		param.put("orderNum", query.getOrderNum());
		List<Order> list = orderDao.getOrders(param);
		return list;
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.OrderService#updateOrder(com.food.out.model.Order)
	 */
	@Override
	public void updateOrder(Order order) {
		orderDao.updateOrder(order);
	}

	@Override
	public List<OrderDetailBean> getOrderDetail(Integer id) {
		return orderDao.getOrderDetailList(id);
	}

}
