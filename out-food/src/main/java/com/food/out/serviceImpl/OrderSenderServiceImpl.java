package com.food.out.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.food.out.common.OrderStatus;
import com.food.out.common.Status;
import com.food.out.dao.OrderDao;
import com.food.out.dao.OrderSenderDao;
import com.food.out.exception.ApplicationException;
import com.food.out.model.Order;
import com.food.out.model.OrderSender;
import com.food.out.model.User;
import com.food.out.model.querybeen.OrderBeanForSender;
import com.food.out.service.OrderSenderService;

@Service("orderSenderService")
public class OrderSenderServiceImpl implements OrderSenderService{

	@Resource
	private OrderSenderDao orderSenderDao;
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public int insert(OrderSender record) {
		return orderSenderDao.insert(record);
	}

	@Override
	public OrderSender selectByKey(Integer id) {
		return orderSenderDao.selectByKey(id);
	}

	@Override
	public void receiveOrder(Integer orderId,User user) {
		if(null == user){
			throw new ApplicationException("为获取到登入用户的信息!");
		}
		if (null == orderId) {
			throw new ApplicationException("请至少选择一个订单!");
		}
		OrderSender orderSender = new OrderSender();
		orderSender.setOrderId(orderId);
		orderSender = orderSenderDao.getSenderOrderByOrderId(orderId);
		if(null != orderSender){
			throw new ApplicationException("改单已经被骑士接单!");
		}
		orderSender = new OrderSender();
		orderSender.setOrderId(orderId);
		orderSender.setIsDel(Integer.valueOf(Status.DELETED_NO));
		orderSender.setOrderId(orderId);
		orderSender.setUserId(user.getId());
		orderSenderDao.insert(orderSender);
		
		Order order = new Order();
		order.setId(orderId);
		order.setStatus(OrderStatus.QISHI_JIEDANG.getCode());
		orderDao.updateOrder(order);
	}

	@Override
	public List<OrderBeanForSender> getOrderListForSender(Map<String, Object> param) {
		List<OrderBeanForSender> list = orderSenderDao.getOrderListForSender(param);
		return list;
	}

	@Override
	public void sureArrive(Integer orderId, Integer userId) {
		//TODO 判断这个订单是否属于这个骑士
		if(null == orderId || null == userId){
			throw new ApplicationException("错误的传入参数");
		}
		Order order = new Order();
		order.setId(orderId);
		order.setStatus(OrderStatus.ORDER_ARRIVE.getCode());
		orderDao.updateOrder(order);
	}
}
