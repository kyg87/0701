package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.entity.NoticeBoard;
import com.wiyn.web.entity.RequestBoard;

public class MyBatisNoticeBoardDao implements NoticeBoardDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int add(NoticeBoard noticeBoard) {
		NoticeBoardDao noticeBoardDao;
		noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
		return noticeBoardDao.add(noticeBoard);
	}

	@Override
	public List<NoticeBoard> getList() {
		NoticeBoardDao noticeBoardDao;
		noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
	    return noticeBoardDao.getList();
	}

	@Override
	public NoticeBoard get(String id) {
		NoticeBoardDao noticeBoardDao;
		noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
	    return noticeBoardDao.get(id);
	}

	@Override
	public NoticeBoard modify(String id) {
		NoticeBoardDao noticeBoardDao;
		noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
		return noticeBoardDao.get(id);
	}

	@Override
	public int update(NoticeBoard noticeBoard) {
		NoticeBoardDao noticeBoardDao;
		noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
		return noticeBoardDao.update(noticeBoard);
	}

	@Override
	public int delete(String id) {
		NoticeBoardDao noticeBoardDao;
		noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
		return noticeBoardDao.delete(id);
	}

	@Override
	public int updateViewCnt(String id) {
		NoticeBoardDao noticeBoardDao;
		noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
		return noticeBoardDao.updateViewCnt(id);
	}

	@Override
	public int count() {
		NoticeBoardDao noticeBoardDao;
		noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
		return noticeBoardDao.count();
	}



}
