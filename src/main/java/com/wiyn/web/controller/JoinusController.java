package com.wiyn.web.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wiyn.web.dao.BigCategoryDao;
import com.wiyn.web.dao.MemberDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.SmallCategory;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SmallCategoryDao smallCategoryDao;
	
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
	public String singin(
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            Model model){
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		return "joinus.singin";		
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String login(
			@RequestParam(value="j_username")String j_username,
			@RequestParam(value="j_password")String j_password){
		
		
		System.out.println(j_username);
		System.out.println(j_password);
		int result = memberDao.isLogin(j_username, j_password);
		return Integer.toString(result);
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
