package com.food.out.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.food.out.dao.AddressDao;
import com.food.out.model.Address;
import com.food.out.service.AddressService;
@Service("addressService")
public class AddressServiceImpl implements AddressService{
	@Resource
	private AddressDao addressDao;
	@Override
	public boolean deleteByPrimaryKey(Integer id) {
        try {
        	addressDao.deleteByPrimaryKey(id);
            return Boolean.TRUE;
        } catch (Exception e) {
            e.printStackTrace();
            return Boolean.FALSE;
        	}
		}	
	@Override
	public int insert(Address record) {
	   int id = addressDao.insert(record);
	   return id;
	}	

	@Override
	public int insertSelective(Address record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Address selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Address record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Address record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
