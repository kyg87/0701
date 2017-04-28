package com.wiyn.web.dao.mybatis;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.entity.SiteBoard;

public class MyBatisSiteBoardDao implements SiteBoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SiteBoard> getList(int page, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getBoard(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getBoard(id);
	}

}
