package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wiyn.web.entity.FreeBoard;

public interface FreeBoardDao {

	String lastId();
	
	@Select("SELECT * FROM FreeBoard WHERE id=#{id}")
	FreeBoard get(String id);
	
	public List<FreeBoard> getList();
	
	public int add(FreeBoard freeBoard);
	public int delete(String id);

	public int update(FreeBoard freeBoard);
	
	public int updateHit(String id);
	
}

	
	
