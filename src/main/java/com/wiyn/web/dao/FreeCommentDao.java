package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.FreeComment;


public interface FreeCommentDao {
	
	public List<FreeComment> getList();
	int add(FreeComment freecomment);
	

}
