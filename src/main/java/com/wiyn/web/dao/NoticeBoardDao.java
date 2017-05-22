package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.NoticeBoard;

public interface NoticeBoardDao {

	List<NoticeBoard> getList();
	
	NoticeBoard get(String id);

	int add(NoticeBoard noticeBoard);

}
