package com.wiyn.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.FreeComment;



@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardDao freeBoardDao;
	@Autowired
	private FreeCommentDao freeCommentDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("freeboard")	
	public String request(Model model){
		
		List<FreeBoard> list = sqlSession.getMapper(FreeBoardDao.class).getList();
		model.addAttribute("list", list);
	
		return "freeboard.freeboard";
	}
	
	@RequestMapping("free-reg")
	public String free(){
		
		return "freeboard.free-reg";		
	}
	
	@RequestMapping(value="reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String free(
			FreeBoard freeboard,
			@RequestParam(value="title")String title, 	
			@RequestParam(value="content" )String content,
			@RequestParam(value="contentSrc")String contentSrc,
			@RequestParam(value="memberId")String memberId
			){
		
			freeboard.setTitle(title);
			freeboard.setContent(content);
			freeboard.setContentSrc(contentSrc);
			freeboard.setMemberId(memberId);
		
			freeBoardDao.add(freeboard);
			
			return "redirect:free-detail";
		
		}
	
	@RequestMapping("free-detail")
	public String freeDetail(){
		
		return "freeboard.free-detail";
	}
	

	
	@RequestMapping(value="freeBoard-detail", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String freeDetails(
			FreeComment freeComment,
			@RequestParam(value="content")String content,
			@RequestParam(value="freeBoardId")String freeBoardId,
			@RequestParam(value="memberId")String memberId,
			
			
			@RequestParam("c")String id, Model model){
		
			model.addAttribute("n", 
				sqlSession.getMapper(FreeBoardDao.class).get(id));
		
	
		
		freeComment.setContent(content);
		freeComment.setFreeBoardId(freeBoardId);
		freeComment.setMemberId(memberId);
		
		freeCommentDao.add(freeComment);
		
		
		return "redirect:free-detail";
	}
	@RequestMapping("free-del")
	public String freeDel(){
		
		return "redirect:freeboard";		
	}
	
	@RequestMapping(value="free-del", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
		public String freeDel(
			FreeBoard freeboard,
			
				@RequestParam(value="id") String id){
		
		
			freeBoardDao.delete(id);
		
		return "redirect:freeboard";
	
	}
	
	
	
}
