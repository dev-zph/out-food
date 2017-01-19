package com.food.out.service;

import com.food.out.model.Sender;

public interface SenderService {
	int deleteByPrimaryKey(Integer id);

    int insert(Sender record);

    int insertSelective(Sender record);

    Sender selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Sender record);

    int updateByPrimaryKey(Sender record);
}
