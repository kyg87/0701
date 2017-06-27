package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.FreeFile;

public interface FreeBoardFileDao {
	List<FreeFile> getList();
	List<FreeFile> getList(String freeId);
	
	int add(FreeFile file);
	int update(FreeFile file);
	FreeFile get(String freeBoardId);
	
}
