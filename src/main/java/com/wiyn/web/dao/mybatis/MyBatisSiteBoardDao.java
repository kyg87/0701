package com.wiyn.web.dao.mybatis;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.Tag;

public class MyBatisSiteBoardDao implements SiteBoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SiteBoard> getList(int page, String query, String bigCategoryId, String smallCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getList(page, query, bigCategoryId, smallCategoryId);
	}
	@Override
	public List<SiteBoard> getListLike(int page, String query, String bigCategoryId, String smallCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListLike(page, query, bigCategoryId, smallCategoryId);
	}
	
	@Override
	public List<SiteBoard> getListComment(int page, String query, String bigCategoryId, String smallCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListComment(page, query, bigCategoryId, smallCategoryId);
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
    @Override
    public SiteBoard getPrev(String id) {
        SiteBoardDao siteBoardDao;
        siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
        return siteBoardDao.getPrev(id);
    }

    @Override
    public SiteBoard getNext(String id) {
        SiteBoardDao siteBoardDao;
        siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
        return siteBoardDao.getNext(id);
    }

	@Override
	public String getBName(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getBName(id);
	}

	@Override
	public String getSName(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getSName(id);
	}
/*	@Override
	public List<SiteBoard> getListSpeed(int page, String query, String bigCategoryId, String smallCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListSpeed(page, query, bigCategoryId, smallCategoryId);
	}*/
	@Override
	public SiteBoard getRandom() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getRandom();
	}
	@Override
	public List<Tag> getTName(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getTName(id);
	}
	@Override
	public int updateHit(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.updateHit(id);
	}
	@Override
	public List<SiteBoard> getTagLoad(String query) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getTagLoad(query);
	}

}
