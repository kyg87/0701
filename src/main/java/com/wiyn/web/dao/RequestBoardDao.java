package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.wiyn.web.entity.RequestBoard;

public interface RequestBoardDao {
	
	List<RequestBoard> getList();
	
	int add(RequestBoard requestBoard);
	int update(RequestBoard requestBoard);
	int delete(String memberId);

	@Select("SELECT * FROM RequestBoard WHERE id=#{id}")	
	RequestBoard get(String id);
	

	
}

	
