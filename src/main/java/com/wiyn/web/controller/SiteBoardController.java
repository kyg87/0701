package com.wiyn.web.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteCommentDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.SiteComment;



@Controller
@RequestMapping("/siteboard/*")
public class SiteBoardController {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private SiteBoardDao siteBoardDao;
	@Autowired
	private SiteCommentDao siteCommentDao;
	
	@RequestMapping("site-reg")
	public String site(){
		
		return "siteboard.site-reg";		
	}
	
	@RequestMapping(value="reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String site(
			SiteBoard siteBoard,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="url")String url,
			@RequestParam(value="memberId")String memberId
			){
					
		System.out.println(title);
		System.out.println(url);
		System.out.println(content);
		
		siteBoard.setContent(content);
		siteBoard.setTitle(title);
		siteBoard.setUrl(url);
		siteBoard.setMemberId(memberId);
		//siteBoard.setBigCategoryId(bigCategoryId);
		
		siteBoardDao.add(siteBoard);
		
		return "redirect:site-detail?c=" + siteBoard.getId();
	}

	@RequestMapping(value="site-detail",produces="text/plain;charset=UTF-8")
	public String siteDetail(@RequestParam("c")String id, Model model)
	{
		SiteBoard siteBoard = new SiteBoard();
		
		siteBoard = sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
		
		model.addAttribute("n", siteBoard);
		
		return "siteboard.site-detail";
	}
	
	@RequestMapping("siteboard")
	public String siteBoard(){
		
		return "siteboard.siteboard";
	}
	
	 @RequestMapping("site-edit")
     public String RequestEdit(@RequestParam("c")String id, Model model){
        
           
		 SiteBoard siteBoard = new SiteBoard();
        
		siteBoard = sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
        
        model.addAttribute("n", siteBoard);
        
        return "siteboard.site-edit";
     }
		
}
