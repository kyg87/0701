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
	public List<SiteComment> getList() {
	      SiteCommentDao siteCommentDao;
	      siteCommentDao = sqlSession.getMapper(SiteCommentDao.class);
		return siteCommentDao.getList();
	}

	@Override
	public int add(SiteComment sitecomment) {
	      SiteCommentDao siteCommentDao;
	      siteCommentDao = sqlSession.getMapper(SiteCommentDao.class);
		return siteCommentDao.add(sitecomment);
	}

}
