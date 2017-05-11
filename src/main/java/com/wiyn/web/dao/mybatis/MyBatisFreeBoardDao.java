package com.wiyn.web.dao.mybatis;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.entity.FreeBoard;



public class MyBatisFreeBoardDao implements FreeBoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FreeBoard> getList() {
		FreeBoardDao FreeBoardDao;
		FreeBoardDao = sqlSession.getMapper(FreeBoardDao.class);
	    return FreeBoardDao.getList();
	}


	@Override
	public int add(FreeBoard freeBoard) {
		FreeBoardDao FreeBoardDao;
		FreeBoardDao = sqlSession.getMapper(FreeBoardDao.class);
		
		return FreeBoardDao.add(freeBoard);
	}

	@Override
	public int delete(String id) {
		FreeBoardDao FreeBoardDao;
		FreeBoardDao = sqlSession.getMapper(FreeBoardDao.class);
		
		return FreeBoardDao.delete(id);
	}

	@Override
	public String lastId() {
	    
	      FreeBoardDao FreeBoardDao;
	      FreeBoardDao = sqlSession.getMapper(FreeBoardDao.class);
	      
	      return FreeBoardDao.lastId();
	}


	@Override
	public FreeBoard get(String id) {
		FreeBoardDao FreeBoardDao;
		FreeBoardDao = sqlSession.getMapper(FreeBoardDao.class);
	    return FreeBoardDao.get(id);
	}


	@Override
	public int update(FreeBoard freeboard) {
		FreeBoardDao FreeBoardDao;
		FreeBoardDao = sqlSession.getMapper(FreeBoardDao.class);
	    return FreeBoardDao.update(freeboard);
	}


	


	
	
}
