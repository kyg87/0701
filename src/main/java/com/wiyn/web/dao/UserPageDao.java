package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.AddBoard;

public interface UserPageDao {
	
	List<AddBoard> getList(String memberId);
	List<AddBoard> getCommentList(String memberId);

}
