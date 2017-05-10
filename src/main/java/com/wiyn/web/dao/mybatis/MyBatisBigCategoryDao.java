package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.BigCategoryDao;
import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.NoticeBoard;

public class MyBatisBigCategoryDao implements BigCategoryDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int add(BigCategory bigCategory) {
		BigCategoryDao bigCategoryDao;
		bigCategoryDao = sqlSession.getMapper(BigCategoryDao.class);
		return bigCategoryDao.add(bigCategory);
	}

	@Override
	public List<BigCategory> getList() {
		BigCategoryDao bigCategoryDao;
		bigCategoryDao = sqlSession.getMapper(BigCategoryDao.class);
	    return bigCategoryDao.getList();
	}

	@Override
	public boolean check(BigCategory bigCategory, String name) {
		// TODO Auto-generated method stub
		return false;
	}



}
