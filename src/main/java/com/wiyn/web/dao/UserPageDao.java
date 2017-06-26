package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.AddBoard;
import com.wiyn.web.entity.UserSiteBoard;


public interface UserPageDao {
	
	List<AddBoard> getList(String memberId);
	
	List<AddBoard> getFreeList(String memberId);
	List<UserSiteBoard> getSiteList(String memberId);
	List<AddBoard> getRequestList(String memberId);
	
	
	
	List<AddBoard> getCommentList(String memberId);
	List<AddBoard> getLikeList(String memberId);
	
	int getReplyCount(String memberId);
	int getLikeCount(String memberId);
	int getListCount(String memberId);


	

}
