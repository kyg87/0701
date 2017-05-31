package com.wiyn.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.Tag;

public interface TagDao {
	
	int add(Tag tag);
	int delete(String id);

}
