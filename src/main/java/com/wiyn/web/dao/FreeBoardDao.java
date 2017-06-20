package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


import com.wiyn.web.entity.FreeBoard;


public interface FreeBoardDao {

	String lastId();
	
	@Select("SELECT * FROM FreeBoard WHERE id=#{id}")
	FreeBoard get(String id);
	
	List<FreeBoard> getList(@Param("page") int page);
	List<FreeBoard> getList(@Param("id")String id, @Param("page") int page);
	public List<FreeBoard> getList();
	
	public int add(FreeBoard freeBoard);
	public int delete(String id);
	public int update(FreeBoard freeBoard);
	
	public int updateHit(String id);
	public String getSize(String commentCount);
	public int updateCommentCount(String id);
	int count();
	// ÆäÀÌÂ¡ ÇÔ¼ö
	public int getPage();
}

	
	
