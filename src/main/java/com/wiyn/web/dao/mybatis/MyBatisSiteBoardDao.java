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
	public int add(SiteBoard siteBoard) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.add(siteBoard);
	}

	@Override
	public int delete(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.delete(id);
	}

	@Override
	public int update(SiteBoard siteBoard) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.update(siteBoard);
	}

	@Override
	public String lastId() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.lastId();
	}

	@Override
	public int getSize() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getSize();
	}

	@Override
	public SiteBoard getBoard(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getBoard(id);
	}


}
