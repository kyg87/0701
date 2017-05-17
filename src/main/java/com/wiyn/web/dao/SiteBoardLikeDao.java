package com.wiyn.web.dao;

import com.wiyn.web.entity.SiteBoardLike;

public interface SiteBoardLikeDao {

	public int add(SiteBoardLike siteBoardLike);
	int getLike(String siteBoardId);
	int isExitLike(String siteBoardId, String memberId);
	int delete(String siteBoardId, String memberId);
}
