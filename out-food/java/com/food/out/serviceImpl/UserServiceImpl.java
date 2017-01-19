package com.food.out.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.food.out.dao.AddressDao;
import com.food.out.dao.UserDao;
import com.food.out.model.User;
import com.food.out.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Boolean insert(User record) {
		try{
		   int id = userDao.insert(record);
		   return Boolean.TRUE;   
		}
		catch(Exception e) {
            e.printStackTrace();
            return Boolean.FALSE;
		}
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> selectByUserName(String userName) {
		// TODO Auto-generated method stub
		List<User> list = userDao.selectByUserName(userName);
		return list;
	}

}
