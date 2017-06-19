package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.BigCategory;

public interface BigCategoryDao {

	List<BigCategory> getList();
	
	BigCategory getbig(String id);

	int add(BigCategory bigCategory);
	int del(String bigCategoryId);
	int modify(String bigCategoryId, String name);
	int addCheck(String name);

}
