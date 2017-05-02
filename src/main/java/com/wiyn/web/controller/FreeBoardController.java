package com.wiyn.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.entity.FreeComment;



@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	
	@Autowired
	private FreeCommentDao freeCommentDao;
	
	@RequestMapping("free-reg")
	public String site(){
		
		return "freeboard.free-reg";		
	}
	
	
	@RequestMapping("free-detail")
	public String siteDetail(){
		
		return "freeboard.free-detail";
	}
	
	@RequestMapping(value="freeBoard-detail", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String freeDetails(
			FreeComment freeComment,
			@RequestParam(value="content")String content,
			@RequestParam(value="freeBoardId")String freeBoardId,
			@RequestParam(value="memberId")String memberId){
		
		System.out.println(content);
		System.out.println(freeBoardId);
		System.out.println(memberId);
		
		freeComment.setContent(content);
		freeComment.setFreeBoardId(freeBoardId);
		freeComment.setMemberId(memberId);
		
		freeCommentDao.add(freeComment);
		
		
		return "redirect:free-detail";
	}
}
