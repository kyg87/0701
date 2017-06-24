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
import com.wiyn.web.dao.MemberDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteCommentDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.SiteComment;
import com.wiyn.web.entity.SmallCategory;

@Controller
@RequestMapping("/siteboard/*")
public class SiteBoardCommentController {

	@Autowired
	private SiteBoardDao siteBoardDao;
	@Autowired
	private SiteCommentDao siteCommentDao;

	@Autowired
	private SqlSession sqlSession;

	

	@RequestMapping(value = "siteBoard-comment-add", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String freeDetailComment(SiteComment siteComment, 
			
			@RequestParam(value = "content") String content,
			@RequestParam(value = "siteBoardId") String siteBoardId, 
			@RequestParam(value = "memberId") String memberId
			
	) {

		siteComment.setContent(content);
		siteComment.setSiteBoardId(siteBoardId);
		siteComment.setMemberId(memberId);

		int result = siteCommentDao.add(siteComment);

		siteBoardDao.updateCommentCount(siteBoardId);
		return String.valueOf(result);

	}
	
	@RequestMapping("siteCommentDelete")
	@ResponseBody
	public String freeCommentDelete(
			@RequestParam(value="id")String id
			){
		
		System.out.println(id);
		int result = siteCommentDao.delete(id);
		
		System.out.println(result);
		
		

		return String.valueOf(result);
		
		
	}


	
	@RequestMapping(value="commentPage", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String commentPage(Model model,
			@RequestParam(value="page")String page,
			@RequestParam(value="id")String id){
		

		List<SiteComment> siteComments = sqlSession.getMapper(SiteCommentDao.class).getList(id, Integer.parseInt(page));
		
		for (SiteComment siteComment : siteComments) {
			siteComment.setProfile(sqlSession.getMapper(MemberDao.class).get(siteComment.getMemberId()).getProfile());
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(siteComments);
		
		return json;
	}

	
}
