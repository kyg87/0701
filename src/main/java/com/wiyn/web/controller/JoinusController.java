package com.wiyn.web.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wiyn.web.dao.MemberDao;

@Controller
@RequestMapping("/joinus/*")
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
	
	
	@RequestMapping("mypage")
	
	public String mypage(Principal principal){
		
		String memberId = principal.getName();
		
		System.out.println(memberId);
		
		return "redirect:../login";
		
	/*	String role = "ROLE_TEACHER";//memberRoleDao.getDefaultRoleById(memberId);
		
		if(role.equals("ROLE_ADMIN"))
			return "redirect:../admin/index";
		else if(role.equals("ROLE_TEACHER"))
			return "redirect:../teacher/index";
		else
			return "redirect:../student/index";	*/	
	}
	
	
	
	
}
