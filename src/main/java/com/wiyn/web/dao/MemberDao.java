package com.wiyn.web.dao;

import com.wiyn.web.entity.Member;

public interface MemberDao {

	//ȸ�� �߰�
	int add(String email,String pwd);
	//��ϵ� ȸ���� ���� �߰�
	int addRole(String email,String auth);
	
	int isExistEmail(String email);
	
	int isLogin(String email,String pwd);
	
	Member get(String email);
}
