package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.SmallCategory;

public interface SmallCategoryDao {

	List<SmallCategory> getList();
	List<SmallCategory> getListWithBC(String bigCategoryId);

	int add(String name, String bigCategoryId);
	int del(String bigCategoryId, String smallCategoryId);
	boolean check(SmallCategory smallCategory, String name);

}
