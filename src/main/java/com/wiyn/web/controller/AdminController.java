package com.wiyn.web.controller;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonNull;
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
		
		System.out.println("big add");
		
		bigCategory.setName(name);
		bigCategoryDao.add(bigCategory);
		
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
		
		System.out.println(smallCategoryId);
		System.out.println(bigCategoryId);
		
		
		if(!bigCategoryId.equals("") && !smallCategoryId.equals("")){
			smallCategoryDao.del(bigCategoryId, smallCategoryId);
			System.out.println("smalldel");
		}

		else if(!bigCategoryId.equals("") && smallCategoryId.equals("")){
			bigCategoryDao.del(bigCategoryId);
			System.out.println("bigdel");
		}
		
		return "redirect:admin";
	}
	
	@RequestMapping(value="admin-category-modify", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String ModifyCategory(
			@RequestParam(value="bigCategoryId")String bigCategoryId,
			@RequestParam(value="smallCategoryId")String smallCategoryId,
			@RequestParam(value="modifyName")String modifyName){
		
		System.out.println(bigCategoryId);
		System.out.println(smallCategoryId);
		System.out.println(modifyName);
		
		if(!bigCategoryId.equals("") && !smallCategoryId.equals("")){
			smallCategoryDao.modify(bigCategoryId, smallCategoryId, modifyName);
			System.out.println("small mod");
		}

		else if(!bigCategoryId.equals("") && smallCategoryId.equals("")){
			bigCategoryDao.modify(bigCategoryId, modifyName);
			System.out.println("big mod");
		}
		
		return "redirect:admin";
	}
	
	
	@RequestMapping(value="BCAddCheck", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String BCAddCheck(
			@RequestParam(value="name")String name){
		
		System.out.println(name);
		
		int result = bigCategoryDao.addCheck(name);
		
		System.out.println(result);
						
		return Integer.toString(result);
	}
	
	@RequestMapping(value="SCAddCheck", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String SCAddCheck(
			@RequestParam(value="data")String data) throws UnsupportedEncodingException{
		
		String test = URLDecoder.decode(data, "UTF-8");
		
		int firstStart = test.indexOf("d=");
		int firstEnd = test.indexOf('&');
		int secondStart = test.indexOf("e=");
		int secondEnd = test.length();
		
		String id = test.substring(firstStart+2, firstEnd);
		String name = test.substring(secondStart+2, secondEnd);
		
		System.out.println("문장 : " + test);
		System.out.println("1 시작 : " + firstStart);
		System.out.println("1 끝 : " + firstEnd);
		System.out.println("2 시작 : " + secondStart);
		System.out.println("2 끝 : " + secondEnd);
		
		System.out.println("id : " + id);
		System.out.println("name : " + name);
		
		System.out.println(test.length());
		
		
		int result = smallCategoryDao.addCheck(id, name);
		
		System.out.println(result);
						
		return Integer.toString(result);
	}
	
}






