package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.UserPageDao;
import com.wiyn.web.entity.AddBoard;

public class MyBatisUserPageDao implements UserPageDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AddBoard> getList(String memberId) {
		UserPageDao userPageDao;
		userPageDao = sqlSession.getMapper(UserPageDao.class);
	    return userPageDao.getList(memberId);
	}

	@Override
	public List<AddBoard> getCommentList(String memberId) {
		
		UserPageDao userPageDao;
		userPageDao = sqlSession.getMapper(UserPageDao.class);
	    return userPageDao.getCommentList(memberId);
	}

	@Override
	public List<AddBoard> getLikeList(String memberId) {
		UserPageDao userPageDao;
		userPageDao = sqlSession.getMapper(UserPageDao.class);
	    return userPageDao.getLikeList(memberId);
	}
	

}
