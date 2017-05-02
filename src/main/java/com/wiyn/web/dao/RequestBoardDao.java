package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.RequestBoard;

public interface RequestBoardDao {
	
	List<RequestBoard> getList();
	int add(RequestBoard requestBoard);
	

	
}

	
