package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.SmallCategory;

public class MyBatisSmallCategoryDao implements SmallCategoryDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int add(String name, String bigCategoryId) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.add(name, bigCategoryId);
	}

	@Override
	public List<SmallCategory> getList() {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
	    return smallCategoryDao.getList();
	}

	@Override
	public int addCheck(String bigCategoryId, String name) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.addCheck(bigCategoryId, name);
	}

	@Override
	public List<SmallCategory> getListWithBC(String bigCategoryId) {
		
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		
	    return smallCategoryDao.getList();
	}

	@Override
	public int del(String bigCategoryId, String smallCategoryId) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.del(bigCategoryId, smallCategoryId);
	}

	@Override
	public int modify(String bigCategoryId, String smallCategoryId, String name) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.modify(bigCategoryId, smallCategoryId, name);
	}

	@Override
	public List<SmallCategory> getListOfBC(String bigCategoryId) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.getListOfBC(bigCategoryId);
	}

	@Override
	public SmallCategory getsmall(String bigCategoryId, String smallCategoryId) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.getsmall(bigCategoryId, smallCategoryId);
	}

	@Override
	public List<SmallCategory> loadHot() {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.loadHot();
	}

	@Override
	public int resetHot(String hotLine) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.resetHot(hotLine);
	}

	@Override
	public int updateHot(String hotLine, String hotName) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.updateHot(hotLine, hotName);
	}

	@Override
	public String getFirstHot() {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.getFirstHot();
	}

	@Override
	public String getSecondHot() {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.getSecondHot();
	}

	@Override
	public SmallCategory get(String smallCategoryId) {
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		return smallCategoryDao.get(smallCategoryId);
	}



}
