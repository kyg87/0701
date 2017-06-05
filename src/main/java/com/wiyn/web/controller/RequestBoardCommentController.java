package com.wiyn.web.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.RequestCommentDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.RequestComment;
import com.wiyn.web.entity.SmallCategory;

@Controller
@RequestMapping("/requestboard/*")
public class RequestBoardCommentController {

	@Autowired
	private RequestBoardDao requestBoardDao;  
	@Autowired
	private RequestCommentDao requestCommentDao;

	@Autowired
	private SqlSession sqlSession;

	

	@RequestMapping(value = "requestBoard-comment-add", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String freeDetailComment(RequestComment requestComment, 
			
			@RequestParam(value = "content") String content,
			@RequestParam(value = "requestBoardId") String requestBoardId, 
			@RequestParam(value = "memberId") String memberId
			
	) {

		requestComment.setContent(content);
		requestComment.setRequestBoardId(requestBoardId);
		requestComment.setMemberId(memberId);

		int result = requestCommentDao.add(requestComment);
		

		return String.valueOf(result);

	}
	
	@RequestMapping("requestCommentDelete")
	@ResponseBody
	public String requestCommentDelete(
			@RequestParam(value="id")String id
			){
		
		int result = requestBoardDao.delete(id);

		
		return  String.valueOf(result);

	}


	
	@RequestMapping(value="commentPage", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String commentPage(Model model,
			@RequestParam(value="page")String page,
			@RequestParam(value="id")String id){
		

		List<RequestComment> requestComments = sqlSession.getMapper(RequestCommentDao.class).getList(id, Integer.parseInt(page));
	
		
		Gson gson = new Gson();
		String json = gson.toJson(requestComments);
		
		return json;
	}

	
}
