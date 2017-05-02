package com.wiyn.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.SiteCommentDao;
import com.wiyn.web.entity.SiteComment;



@Controller
@RequestMapping("/siteboard/*")
public class SiteBoardController {
	
	@Autowired
	private SiteCommentDao siteCommentDao;
	
	@RequestMapping("site-reg")
	public String site(){
		
		return "siteboard.site-reg";		
	}
	
	
	@RequestMapping("site-detail")
	public String siteDetail(){
		
		return "siteboard.site-detail";
	}
	
	
	
	@RequestMapping(value="siteBoard-detail", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String siteDetails(
			SiteComment siteComment,
			@RequestParam(value="content")String content,
			@RequestParam(value="siteBoardId")String siteBoardId,
			@RequestParam(value="memberId")String memberId){
		
		System.out.println(content);
		System.out.println(siteBoardId);
		System.out.println(memberId);
		
		siteComment.setContent(content);
		siteComment.setSiteBoardId(siteBoardId);
		siteComment.setMemberId(memberId);
		
		siteCommentDao.add(siteComment);
		
		
		return "redirect:site-detail";
	}
		
}
