/**
 * 
 */
package com.food.out.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.food.out.dao.OrderDetailDao;
import com.food.out.model.OrderDetail;
import com.food.out.service.OrderDetailService;

/**
 * @author 陈佳
 * @createTime 2017年2月15日 下午2:14:10
 * 
 */
@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService{
@Resource
private OrderDetailDao orderDetailDao;
	/* (non-Javadoc)
	 * @see com.food.out.service.OrderformDetailService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.OrderformDetailService#insert(com.food.out.model.OrderformDetail)
	 */
	@Override
	public int insert(OrderDetail record) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.OrderformDetailService#insertSelective(com.food.out.model.OrderformDetail)
	 */
	@Override
	public int insertSelective(OrderDetail record) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.OrderformDetailService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public OrderDetail selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.OrderformDetailService#updateByPrimaryKeySelective(com.food.out.model.OrderformDetail)
	 */
	@Override
	public int updateByPrimaryKeySelective(OrderDetail record) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.OrderformDetailService#updateByPrimaryKey(com.food.out.model.OrderformDetail)
	 */
	@Override
	public int updateByPrimaryKey(OrderDetail record) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.food.out.service.OrderDetailService#findDetailsByOrderId(java.lang.Integer)
	 */
	@Override
	public List<OrderDetail> findDetailsByOrderId(Integer id) {
		// TODO Auto-generated method stub
		return orderDetailDao.findDetailsByOrderId(id);
	}

}
