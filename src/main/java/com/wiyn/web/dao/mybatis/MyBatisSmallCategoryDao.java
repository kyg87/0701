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
	public boolean check(SmallCategory smallCategory, String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<SmallCategory> getListWithBC(String bigCategoryId) {
		
		SmallCategoryDao smallCategoryDao;
		smallCategoryDao = sqlSession.getMapper(SmallCategoryDao.class);
		
	    return smallCategoryDao.getList();
	}



}
