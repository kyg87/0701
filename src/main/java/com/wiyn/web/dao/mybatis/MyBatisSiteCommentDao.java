package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.SiteCommentDao;
import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.SiteComment;

public class MyBatisSiteCommentDao implements SiteCommentDao {


	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SiteComment> getList(String boardId,int page) {
		SiteCommentDao siteCommentDao;
		siteCommentDao = sqlSession.getMapper(SiteCommentDao.class);
		return siteCommentDao.getList(boardId, page);
	}

	@Override
	public int add(SiteComment freecomment) {
		SiteCommentDao siteCommentDao;
		siteCommentDao = sqlSession.getMapper(SiteCommentDao.class);
		return siteCommentDao.add(freecomment);
	}

	@Override
	public int getSize(String boardId) {
		SiteCommentDao siteCommentDao;
		siteCommentDao = sqlSession.getMapper(SiteCommentDao.class);
		return siteCommentDao.getSize(boardId);
	}

	@Override
	public int delete(String boardId) {
		SiteCommentDao siteCommentDao;
		siteCommentDao = sqlSession.getMapper(SiteCommentDao.class);
		return siteCommentDao.delete(boardId);
	}
}
