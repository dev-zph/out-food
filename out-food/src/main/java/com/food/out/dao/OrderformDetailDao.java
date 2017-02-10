package com.food.out.dao;

import org.springframework.stereotype.Repository;

import com.food.out.model.OrderformDetail;
@Repository("orderformDetailDao")
public interface OrderformDetailDao {
	
    int deleteByPrimaryKey(Integer id);

    int insert(OrderformDetail record);

    int insertSelective(OrderformDetail record);

    OrderformDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderformDetail record);

    int updateByPrimaryKey(OrderformDetail record);
}