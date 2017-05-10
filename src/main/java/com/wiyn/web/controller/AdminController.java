package com.wiyn.web.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.BigCategoryDao;
import com.wiyn.web.entity.BigCategory;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	@RequestMapping(value="admin-bcadd", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String BigCatedogy(
			BigCategory bigCategory,
			@RequestParam(value="name")String name){
		
		
		bigCategory.setName(name);
		
		
	
		bigCategoryDao.add(bigCategory);
		
		System.out.println("  " + name);
		
		return "admin.admin";		
	}
	
	@RequestMapping("admin")
	public String admin() {

		return "admin.admin";
	}
	
}
