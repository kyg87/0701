package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.SmallCategory;

public interface SmallCategoryDao {

	List<SmallCategory> getList();
	List<SmallCategory> getListWithBC(String bigCategoryId);
	List<SmallCategory> getListOfBC(String bigCategoryId);
	List<SmallCategory> loadHot();
	
	SmallCategory getsmall(String bigCategoryId, String smallCategoryId);
	
	int add(String name, String bigCategoryId);
	int del(String bigCategoryId, String smallCategoryId);
	int modify(String bigCategoryId, String smallCategoryId, String name);
	int addCheck(String bigCategoryId, String name);
	int resetHot(String hotLine);
	int updateHot(String hotLine, String hotName);
	
	SmallCategory get(String smallCategoryId);
	
	String getFirstHot();
	String getSecondHot();
	
}
