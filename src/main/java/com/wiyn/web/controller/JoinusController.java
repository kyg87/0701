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

		int result = memberDao.add(email, pwd);
		
		System.out.println(result);
		
		if(result > 0) memberDao.addRole(email, "ROLE_USER");
		
		
		return "redirect:../main/index";
	}
	
	
	@RequestMapping("mypage")
	public String mypage(Principal principal){
		
		String memberId = principal.getName();
		
		System.out.println("joinusController.java:" + memberId);
		
		return "redirect:../main/index";	
	}
	
	@RequestMapping("singin")
	public String singin(){
		
		return "joinus.singin";		
	}
	
	@RequestMapping("login")
	public String login(){
		System.out.println("login");
		return "joinus.login";		
	}
	
	@RequestMapping("isSingIn")
	@ResponseBody
	public String isSingIn(
			@RequestParam(value="email1")String email){
		
		int result = memberDao.isExistEmail(email);
		
		
		return Integer.toString(result);
	}

	@RequestMapping("callback")
	public String callback(){
		System.out.println("callback");
		return "joinus.callback";
	}
	
	@RequestMapping(value="naver", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")

	public String naver(
			@RequestParam(value="email")String email
			
			) {


		System.out.println(email);
		
		
		return "joinus.login";
	}
	
	
}
