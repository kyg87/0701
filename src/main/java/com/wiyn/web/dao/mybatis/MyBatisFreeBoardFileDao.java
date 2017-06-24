package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.FreeBoardFileDao;

import com.wiyn.web.entity.FreeFile;

public class MyBatisFreeBoardFileDao implements FreeBoardFileDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FreeFile> getList(String freeBoardId) {

		FreeBoardFileDao freeBoardFileDao;
		freeBoardFileDao = sqlSession.getMapper(FreeBoardFileDao.class);

		return freeBoardFileDao.getList(freeBoardId);
	}

	@Override
	public int add(FreeFile file) {
		FreeBoardFileDao freeBoardFileDao;
		freeBoardFileDao = sqlSession.getMapper(FreeBoardFileDao.class);

		return freeBoardFileDao.add(file);
	}

	@Override
	public int update(FreeFile file) {
		FreeBoardFileDao freeBoardFileDao;
		freeBoardFileDao = sqlSession.getMapper(FreeBoardFileDao.class);

		return freeBoardFileDao.update(file);
	}

	@Override
	public FreeFile get(String freeBoardId) {
		FreeBoardFileDao freeBoardFileDao;
		freeBoardFileDao = sqlSession.getMapper(FreeBoardFileDao.class);

		return freeBoardFileDao.get(freeBoardId);
	}

}