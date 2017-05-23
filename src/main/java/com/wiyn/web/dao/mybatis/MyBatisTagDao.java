package com.wiyn.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.TagDao;
import com.wiyn.web.entity.Tag;

public class MyBatisTagDao implements TagDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int add(Tag tag) {
		TagDao tagDao;
		tagDao = sqlSession.getMapper(TagDao.class);
		return tagDao.add(tag);
	}
	
	

}
