package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.RequestComment;


public interface RequestCommentDao {
	
	List<RequestComment> getList(@Param("boardId")String boardId,@Param("page") int page);
	
	int add(RequestComment requestComment);
	int delete(String boardId);
	int getSize(String boardId);
	

}
