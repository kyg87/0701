package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.FreeBoard;

public interface FreeBoardDao {

	public List<FreeBoard> getList(int page, String query);
	public String getBoard(String id);
	
	public int add(FreeBoard freeBoard);
	
}
