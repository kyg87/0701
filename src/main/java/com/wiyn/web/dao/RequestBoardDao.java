package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.wiyn.web.entity.RequestBoard;

public interface RequestBoardDao {
	

	List<RequestBoard> getList(@Param("page") int page);
	
	RequestBoard getBoard(String id);
	RequestBoard getPrev(String id);
	RequestBoard getNext(String id);
	
	int add(RequestBoard requestBoard);
	int update(RequestBoard requestBoard);
	int delete(String id);
	int count();
	int updateViewCnt(String id);
	
	public String lastId();
	public int getSize();

	@Select("SELECT * FROM RequestBoard WHERE id=#{id}")	
	RequestBoard get(String id);

	/*List<RequestBoard> getList(int page, String query);*/

	List<RequestBoard> getList();
	
	

	
}

	
