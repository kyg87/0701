package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.SmallCategory;

public interface SmallCategoryDao {

	List<SmallCategory> getList();

	int add(String name, String bigCategoryId);
	boolean check(SmallCategory smallCategory, String name);

}
