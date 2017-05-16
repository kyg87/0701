package com.wiyn.web.controller;
import com.google.gson.Gson;
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
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.SmallCategory;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SmallCategoryDao smallCategoryDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	@RequestMapping(value="admin-bcadd", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String BigCatedogy(
			BigCategory bigCategory,
			@RequestParam(value="name")String name){
		
		
		bigCategory.setName(name);
		
		
	
		bigCategoryDao.add(bigCategory);
		
		System.out.println("  " + name);
		
		return "redirect:admin";
	}
	
	@RequestMapping(value="admin-scadd", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String SmallCategory(
			SmallCategory smallCategory,
			@RequestParam(value="name")String name,
			@RequestParam(value="bigCategoryId")String bigCategoryId){
		
		smallCategory.setName(name);
		smallCategory.setBigCategoryId(bigCategoryId);
		
		smallCategoryDao.add(name, bigCategoryId);
		
		return "redirect:admin";
		
	}
	
	@RequestMapping("admin")
	public String admin(Model model) {
		
		List<BigCategory> bcList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		
		for (BigCategory bigCategory : bcList) {
			bigCategory.setSmallCategory(sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId()));
		}
		
		model.addAttribute("bcList", bcList);
		
		return "admin.admin";
	}
	
	@RequestMapping(value="getListWithBC", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String GetListWithBC(Model model,
			@RequestParam(value="bigCategoryId")String bigCategoryId){
		
		List<SmallCategory> scList = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategoryId);
		model.addAttribute("scList", scList);
		
		Gson gson = new Gson();
		String json = gson.toJson(scList);
		
		return json;
	}
	
	@RequestMapping(value="admin-category-del", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String DeleteCategory(
			@RequestParam(value="bigCategoryId")String bigCategoryId,
			@RequestParam(value="smallCategoryId")String smallCategoryId){
		
		
		System.out.println("del");
		System.out.println(smallCategoryId);
		System.out.println(bigCategoryId);
		
		if(smallCategoryId.equals("")){
			bigCategoryDao.del(bigCategoryId);
			System.out.println("bigdel");
		}
		
		else if(!bigCategoryId.equals("") && !smallCategoryId.equals("")){
			smallCategoryDao.del(bigCategoryId, smallCategoryId);
			System.out.println("smalldel");
		}

		
		return "redirect:admin";
	}
	
}






