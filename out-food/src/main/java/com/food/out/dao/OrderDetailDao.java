package com.food.out.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.food.out.model.OrderDetail;
@Repository("orderDetailDao")
public interface OrderDetailDao {
	
    int deleteByPrimaryKey(Integer id);

    int insert(OrderDetail record);

    int insertSelective(OrderDetail record);

    OrderDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderDetail record);

    int updateByPrimaryKey(OrderDetail record);
    
    List<OrderDetail> findDetailsByOrderId(Integer id);
}