package com.wiyn.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.UserPageDao;
import com.wiyn.web.entity.AddBoard;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private UserPageDao userPageDao;
	
	@RequestMapping("mypage")
	public String UserMain(Authentication auth,Model model) {

		
		System.out.println(auth.getName());
		List<AddBoard> list = sqlSession.getMapper(UserPageDao.class).getList(auth.getName());
		List<AddBoard> list2 = sqlSession.getMapper(UserPageDao.class).getCommentList(auth.getName());
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);

	
		return "user.mypage";
	}
	
	
	
}
