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

}
