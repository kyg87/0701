package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.BigCategory;

public interface BigCategoryDao {

	List<BigCategory> getList();

	int add(BigCategory bigCategory);
	int del(String bigCategoryId);
	boolean check(BigCategory bigCategory, String name);

}
