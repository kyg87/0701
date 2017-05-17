package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wiyn.web.entity.SiteBoard;

public interface SiteBoardDao {

	public List<SiteBoard> getList(@Param("page") int page,@Param("query") String query);
	SiteBoard getBoard(String id);
    SiteBoard getPrev(String id);
    SiteBoard getNext(String id);
    

	public int add(SiteBoard siteBoard);
	public int delete(String id);
	public int update(SiteBoard siteBoard);
	
	public String lastId();
	public int getSize();
}
