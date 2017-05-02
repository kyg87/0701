package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.SiteComment;


public interface SiteCommentDao {
	
	public List<SiteComment> getList();
	int add(SiteComment sitecomment);
	

}
