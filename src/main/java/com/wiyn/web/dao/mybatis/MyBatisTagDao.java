package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.TagDao;
import com.wiyn.web.entity.SiteBoard;
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

	@Override
	public int delete(String id) {
		TagDao tagDao;
		tagDao = sqlSession.getMapper(TagDao.class);
		return tagDao.delete(id);
	}

}
