package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wiyn.web.entity.FreeComment;


public interface FreeCommentDao {
	
	List<FreeComment> getList(@Param("boardId")String boardId,@Param("page") int page);
	
	int add(FreeComment freecomment);
	
	int getSize(String boardId);


}
