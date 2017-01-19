package com.food.out.dao;

import org.springframework.stereotype.Repository;

import com.food.out.model.Address;
@Repository("addressDao")
public interface AddressDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}