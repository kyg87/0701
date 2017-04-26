package com.wiyn.web.dao;

import com.wiyn.web.entity.Member;

public interface MemberDao {

	Member get(String id);
	int add(Member member);
}
