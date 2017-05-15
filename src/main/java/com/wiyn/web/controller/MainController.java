package com.wiyn.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.entity.NoticeBoard;
import com.wiyn.web.entity.SiteBoard;




@Controller
@RequestMapping("/main/*")
public class MainController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SiteBoardDao siteBoardDao;
	
	@Autowired
	private NoticeBoardDao noticBoardDao;

	@RequestMapping("index")
	public String index(
			@RequestParam(value="p", defaultValue="1")Integer page, 
			@RequestParam(value="q", defaultValue="")String query, Model model) {

		List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page,query);
		List<NoticeBoard> noticelist = sqlSession.getMapper(NoticeBoardDao.class).getList();
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("sitelist", sitelist);
		
		
		return "main.index";
	}
	
	
	

}
