package com.wiyn.web.dao;

import java.util.List;
import com.wiyn.web.entity.SiteBoard;

public interface SiteBoardDao {

	public List<SiteBoard> getList(int page, String query);
	public String getBoard(String id);
	
	public int add(SiteBoard siteBoard);
	public int delete(String id);
	public int update(SiteBoard siteBoard);
	
	public String lastId();
	public int getSize();
}
