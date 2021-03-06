package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.Tag;

public interface SiteBoardDao {

	public List<SiteBoard> getList(@Param("page") int page,@Param("query") String query, @Param("bigCa") String bigCategoryId, @Param("smallCa") String smallCategoryId);
	public List<SiteBoard> getListLike(@Param("page") int page,@Param("query") String query, @Param("bigCa") String bigCategoryId, @Param("smallCa") String smallCategoryId);
	public List<SiteBoard> getListComment(@Param("page") int page,@Param("query") String query, @Param("bigCa") String bigCategoryId, @Param("smallCa") String smallCategoryId);
	SiteBoard getBoard(String id);
    SiteBoard getPrev(String id);
    SiteBoard getNext(String id);
    SiteBoard getRandom();
    
    
    SiteBoard getNewsc();
    SiteBoard getNewsL();
    SiteBoard getNewsH();
    

	public int add(SiteBoard siteBoard);
	public int delete(String id);
	public int update(SiteBoard siteBoard);
	
	public String lastId();
	public int getSize();
	public int updateHit(String id);
	
	
	String getBName(String id);
	String getSName(String id);
	List<Tag> getTName(String id);
	
	List<SiteBoard> getTagLoad(String query);
	
	public int updateCommentCount(String Id);
	int count();
	int countlike();
	int countquery(String query);
	
	
	List<SiteBoard> getHotSmall(String id);
	
	List<SiteBoard> likeBig(@Param("bigCa") String bigCategoryId);
}
