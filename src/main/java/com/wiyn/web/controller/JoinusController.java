package com.wiyn.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wiyn.web.dao.MemberDao;

@Controller
public class JoinusController {
	

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value="singIn", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String singIn(
			@RequestParam(value="email1")String email, 
			@RequestParam(value="pass")String pwd
			) {

		System.out.println(email);
		System.out.println(pwd);
		
		memberDao.add(email, pwd);
		
		return "index";
	}
	
}
