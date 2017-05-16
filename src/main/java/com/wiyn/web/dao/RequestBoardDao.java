package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.RequestBoard;

public interface RequestBoardDao {
	
	List<RequestBoard> getList();
	
	
	
	public int add(RequestBoard requestBoard);
	public int update(RequestBoard requestBoard);
	public int delete(String id);

	@Select("SELECT * FROM RequestBoard WHERE id=#{id}")	
	RequestBoard get(String id);
	
	
	
	
	
	
}

	
