package com.wiyn.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.MemberDao;
import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.entity.Member;

public class MyBatisMemberDao implements MemberDao {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int add(String email, String pwd) {
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		
		return memberDao.add(email, pwd);
	}

	@Override
	public int addRole(String email, String auth) {
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		
		return memberDao.addRole(email, auth);
	}

	@Override
	public int isExistEmail(String email) {
		// TODO Auto-generated method stub
		
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		
		return memberDao.isExistEmail(email);
	}

	@Override
	public int isLogin(String email, String pwd) {
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		
		return memberDao.isLogin(email, pwd);
	}

	@Override
	public Member get(String email) {
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		
		return memberDao.get(email);
	}

	@Override
	public int update(String email, String profile) {
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		
		return memberDao.update(email, profile);
	}

}
