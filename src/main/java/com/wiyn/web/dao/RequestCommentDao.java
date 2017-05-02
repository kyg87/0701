package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.RequestComment;


public interface RequestCommentDao {
	
	public List<RequestComment> getList();
	int add(RequestComment requestcomment);
	

}
