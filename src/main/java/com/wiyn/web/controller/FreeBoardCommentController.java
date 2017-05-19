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
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.SmallCategory;

@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardCommentController {

	@Autowired
	private FreeBoardDao freeBoardDao;
	@Autowired
	private FreeCommentDao freeCommentDao;

	@Autowired
	private SqlSession sqlSession;

	

	@RequestMapping(value = "freeBoard-comment-add", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String freeDetailComment(FreeComment freeComment, 
			
			@RequestParam(value = "content") String content,
			@RequestParam(value = "freeBoardId") String freeBoardId, 
			@RequestParam(value = "memberId") String memberId
			
	) {

		freeComment.setContent(content);
		freeComment.setFreeBoardId(freeBoardId);
		freeComment.setMemberId(memberId);

		
		System.out.println(content);
		System.out.println(freeBoardId);
		
		freeCommentDao.add(freeComment);


		return "redirect:free-detail?c="+freeComment.getFreeBoardId();

	}


	
	@RequestMapping(value="commentPage", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String commentPage(Model model,
			@RequestParam(value="page")String page,
			@RequestParam(value="id")String id){
		

		List<FreeComment> freeComments = sqlSession.getMapper(FreeCommentDao.class).getList(id, Integer.parseInt(page));
	
		
		Gson gson = new Gson();
		String json = gson.toJson(freeComments);
		
		return json;
	}

	
}
