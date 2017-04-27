package com.wiyn.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.MemberDao;
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

}
