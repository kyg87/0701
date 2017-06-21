package com.wiyn.web.dao;

import com.wiyn.web.entity.Member;

public interface MemberDao {

	//회원 추가
	int add(String email,String pwd);
	//등록된 회원에 권한 추가
	int addRole(String email,String auth);
	
	int isExistEmail(String email);
	
	int isLogin(String email,String pwd);
	
	Member get(String email);
}
