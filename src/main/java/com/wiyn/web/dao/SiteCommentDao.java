package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.SiteComment;


public interface SiteCommentDao {
	
	List<SiteComment> getList(@Param("boardId")String boardId,@Param("page") int page);
	
	int add(SiteComment siteComment);
	int delete(String boardId);
	int getSize(String boardId);
	

}
