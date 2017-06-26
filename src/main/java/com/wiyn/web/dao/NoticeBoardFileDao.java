package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.NoticeFile;

public interface NoticeBoardFileDao {
	List<NoticeFile> getList();
	
	int add(NoticeFile file);
	int update(NoticeFile file);
	NoticeFile get(String noticeBoardId);
	
}
