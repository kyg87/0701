package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.entity.FreeComment;

public class MyBatisFreeCommentDao implements FreeCommentDao {


	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FreeComment> getList(String boardId,int page) {
		FreeCommentDao freeCommentDao;
		freeCommentDao = sqlSession.getMapper(FreeCommentDao.class);
		return freeCommentDao.getList(boardId, page);
	}

	@Override
	public int add(FreeComment freecomment) {
		FreeCommentDao freeCommentDao;
		freeCommentDao = sqlSession.getMapper(FreeCommentDao.class);
		return freeCommentDao.add(freecomment);
	}

	@Override
	public int getSize(String boardId) {
		FreeCommentDao freeCommentDao;
		freeCommentDao = sqlSession.getMapper(FreeCommentDao.class);
		return freeCommentDao.getSize(boardId);
	}

	@Override
	public int delete(String boardId) {
		FreeCommentDao freeCommentDao;
		freeCommentDao = sqlSession.getMapper(FreeCommentDao.class);
		return freeCommentDao.delete(boardId);
	}

	@Override
	public FreeComment get(String boardId) {
		FreeCommentDao freeCommentDao;
		freeCommentDao = sqlSession.getMapper(FreeCommentDao.class);
		return freeCommentDao.get(boardId);
	}


}
