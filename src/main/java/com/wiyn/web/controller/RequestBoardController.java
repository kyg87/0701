	package com.wiyn.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.RequestCommentDao;
import com.wiyn.web.entity.RequestBoard;
import com.wiyn.web.entity.RequestComment;




@Controller
@RequestMapping("/requestboard/*")
public class RequestBoardController {
	@Autowired
	
	private RequestBoardDao requestBoardDao;
	
	
	@Autowired
	private RequestCommentDao requestCommentDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("request")	
	public String request(Model model){
		
		List<RequestBoard> list = sqlSession.getMapper(RequestBoardDao.class).getList();
		model.addAttribute("list", list);
	
		return "requestboard.requestboard";
	}
	
	@RequestMapping("request-reg")
	public String site(){
		
		return "requestboard.request-reg";		
	}
	
	
	
	@RequestMapping(value="reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")

	public String sited(
			RequestBoard requestBoard,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="memberId")String memberId
			){
		
	/*	System.out.println(title);
		System.out.println(content);
		System.out.println(memberId);*/
		
		requestBoard.setTitle(title);
		requestBoard.setContent(content);
		requestBoard.setMemberId(memberId);
		
		requestBoardDao.add(requestBoard);
		return "redirect:request-detail?c="+requestBoard.getId();
		

		
	}
	
	
	@RequestMapping("request-edit")
	   public String RequestEdit(@RequestParam("c")String id, Model model){
	      
	         
	      RequestBoard requestboard = new RequestBoard();
	      
	      requestboard = sqlSession.getMapper(RequestBoardDao.class).get(id);   
	      requestboard.setRequestComment(sqlSession.getMapper(RequestCommentDao.class).getList());
	      
	      model.addAttribute("n", requestboard);
	      
	      return "requestboard.request-edit";
	   }
	
	
	@RequestMapping("request-detail")
	   public String RequestDetail(@RequestParam("c")String id, Model model){
	      
	         
	      RequestBoard requestboard = new RequestBoard();
	      
	      requestboard = sqlSession.getMapper(RequestBoardDao.class).get(id);   
	      requestboard.setRequestComment(sqlSession.getMapper(RequestCommentDao.class).getList());
	      
	      model.addAttribute("n", requestboard);
	      
	      return "requestboard.request-detail";
	   }
	
	
	@RequestMapping(value="requestBoard-detail", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String requestDetails(
			RequestComment requestComment,
			@RequestParam(value="content")String content,
			@RequestParam(value="requestBoardId")String requestBoardId,
			@RequestParam(value="memberId")String memberId){
		
		System.out.println(content);
		System.out.println(requestBoardId);
		System.out.println(memberId);
		
		requestComment.setContent(content);
		requestComment.setRequestBoardId(requestBoardId);
		requestComment.setMemberId(memberId);
		
		requestCommentDao.add(requestComment);
		
		
		return "redirect:request-detail";
	}
}


	