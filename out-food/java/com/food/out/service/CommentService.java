package com.food.out.service;

import com.food.out.model.Comment;

public interface CommentService {
	    int deleteByPrimaryKey(Integer id);

	    int insert(Comment record);

	    int insertSelective(Comment record);

	    Comment selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Comment record);

	    int updateByPrimaryKeyWithBLOBs(Comment record);

	    int updateByPrimaryKey(Comment record);
}
