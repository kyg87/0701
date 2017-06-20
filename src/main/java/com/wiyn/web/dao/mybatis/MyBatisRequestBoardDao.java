package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


import com.wiyn.web.dao.MemberDao;
import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.entity.Member;
import com.wiyn.web.entity.RequestBoard;

public class MyBatisRequestBoardDao implements RequestBoardDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	

	
	
	
	
	@Override
	public int getSize() {
		RequestBoardDao requestBoardDao;
		requestBoardDao = sqlSession.getMapper(RequestBoardDao.class);
	    return requestBoardDao.getSize();
	}


	@Override
	public int add(RequestBoard requestBoard) {
		
		RequestBoardDao requestBoardDao;
		requestBoardDao = sqlSession.getMapper(RequestBoardDao.class);
	    return requestBoardDao.add(requestBoard);
	}
	
	@Override
	public int update(RequestBoard requestBoard) {
		
		RequestBoardDao requestBoardDao;
		requestBoardDao = sqlSession.getMapper(RequestBoardDao.class);
	    return requestBoardDao.update(requestBoard);
	}
	
	@Override
	public int delete(String id) {
		
		RequestBoardDao requestBoardDao;
		requestBoardDao = sqlSession.getMapper(RequestBoardDao.class);
	    return requestBoardDao.delete(id);
	}


	@Override
	public List<RequestBoard> getList() {
		RequestBoardDao requestBoardDao;
		requestBoardDao = sqlSession.getMapper(RequestBoardDao.class);
	    return requestBoardDao.getList();
	}

	@Override
	public int count() {
		RequestBoardDao requestBoardDao;
		requestBoardDao = sqlSession.getMapper(RequestBoardDao.class);
		return requestBoardDao.count();
	}
	
	@Override
	public int updateViewCnt(String id) {
		RequestBoardDao requestBoardDao;
		requestBoardDao = sqlSession.getMapper(RequestBoardDao.class);
		return requestBoardDao.updateViewCnt(id);
		}
	
	@Override
	public RequestBoard get(String id) {
		// TODO Auto-generated method stub
		return null;
	}
/*
	@Override
	public List<RequestBoard> getList(int page, String query) {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	public RequestBoard getBoard(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RequestBoard getPrev(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RequestBoard getNext(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String lastId() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<RequestBoard> getList(int page) {
		// TODO Auto-generated method stub
		return null;
	}







}
