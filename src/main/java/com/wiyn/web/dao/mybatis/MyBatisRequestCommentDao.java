package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.RequestCommentDao;
import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.RequestComment;

public class MyBatisRequestCommentDao implements RequestCommentDao {


	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RequestComment> getList(String boardId, int page) {
		RequestCommentDao requestCommentDao;
		requestCommentDao = sqlSession.getMapper(RequestCommentDao.class);
		return requestCommentDao.getList(boardId, page);
	}

	@Override
	public int add(RequestComment requestComment) {
		RequestCommentDao requestCommentDao;
		requestCommentDao = sqlSession.getMapper(RequestCommentDao.class);
		return requestCommentDao.add(requestComment);
	}

	@Override
	public int delete(String boardId) {
		RequestCommentDao requestCommentDao;
		requestCommentDao = sqlSession.getMapper(RequestCommentDao.class);
		return requestCommentDao.delete(boardId);
	}

	@Override
	public int getSize(String boardId) {
		RequestCommentDao requestCommentDao;
		requestCommentDao = sqlSession.getMapper(RequestCommentDao.class);
		return requestCommentDao.getSize(boardId);
	}



}
