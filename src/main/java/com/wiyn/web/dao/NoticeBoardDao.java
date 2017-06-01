package com.wiyn.web.dao;

import java.util.List;

import com.wiyn.web.entity.NoticeBoard;

public interface NoticeBoardDao {

	List<NoticeBoard> getList();
	
	NoticeBoard get(String id);
	NoticeBoard modify(String id);

	int add(NoticeBoard noticeBoard);
	int update(NoticeBoard noticeBoard);
	int delete(String id);
	int updateViewCnt(String id);
	int count();
	
}
