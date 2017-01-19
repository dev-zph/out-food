package com.food.out.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.food.out.model.User;
@Repository("userDao")
public interface UserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User>  selectByUserName(String userName);
}