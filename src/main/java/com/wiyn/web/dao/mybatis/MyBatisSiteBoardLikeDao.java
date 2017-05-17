package com.wiyn.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteBoardLikeDao;
import com.wiyn.web.entity.SiteBoardLike;

public class MyBatisSiteBoardLikeDao implements SiteBoardLikeDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int add(SiteBoardLike siteBoardLike) {
		SiteBoardLikeDao siteBoardLikeDao;
		siteBoardLikeDao =  sqlSession.getMapper(SiteBoardLikeDao.class);
		return siteBoardLikeDao.add(siteBoardLike);
	}

	@Override
	public int getLike(String siteBoardId) {
		SiteBoardLikeDao siteBoardLikeDao;
		siteBoardLikeDao =  sqlSession.getMapper(SiteBoardLikeDao.class);
		return siteBoardLikeDao.getLike(siteBoardId);
	}

	@Override
	public int isExitLike(String siteBoardId, String memberId) {
		SiteBoardLikeDao siteBoardLikeDao;
		siteBoardLikeDao =  sqlSession.getMapper(SiteBoardLikeDao.class);
		return siteBoardLikeDao.isExitLike(siteBoardId, memberId);
	}

	@Override
	public int delete(String siteBoardId, String memberId) {
		SiteBoardLikeDao siteBoardLikeDao;
		siteBoardLikeDao =  sqlSession.getMapper(SiteBoardLikeDao.class);
		return siteBoardLikeDao.delete(siteBoardId, memberId);
	}

	


}
