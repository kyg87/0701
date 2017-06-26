package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.AddBoard;


public interface UserPageDao {
	
	List<AddBoard> getList(String memberId);
	
	List<AddBoard> getFreeList(String memberId);
	List<AddBoard> getSiteList(String memberId);
	List<AddBoard> getRequestList(String memberId);
	
	
	
	List<AddBoard> getCommentList(String memberId);
	List<AddBoard> getLikeList(String memberId);
	
	int getReplyCount(String memberId);
	int getLikeCount(String memberId);
	int getListCount(String memberId);


	

}
