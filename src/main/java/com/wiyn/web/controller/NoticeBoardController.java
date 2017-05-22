package com.wiyn.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.entity.NoticeBoard;



@Controller
@RequestMapping("/noticeboard/*")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardDao noticeBoardDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("noticeboard")
	public String site(Model model){
		
		List<NoticeBoard> list = sqlSession.getMapper(NoticeBoardDao.class).getList();
		model.addAttribute("list", list);
		
		return "noticeboard.noticeboard";		
	}
	
	@RequestMapping("notice-reg")
	public String noticeReg(Model model){
		
		
		
		return null;
	}
	
	@RequestMapping("notice-detail")
	public String noticeDetail(Model model,
			@RequestParam(value="c")String id){
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard = sqlSession.getMapper(NoticeBoardDao.class).get(id);
		
		model.addAttribute("list", noticeBoard);
		
		
		
		return "noticeboard.notice-detail";
	}
	
	@RequestMapping(value="noticeBoard-reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String sited(
			NoticeBoard noticeBoard,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="memberId")String memberId
			){
						
		noticeBoard.setTitle(title);
		noticeBoard.setContent(content);
		noticeBoard.setMemberId(memberId);
		
		noticeBoardDao.add(noticeBoard);
		
		return "noticeboard.notice-detail";
		
	}
	
	/*@RequestMapping("notice-detail")
	public String siteDetail(){
		
		return "noticeboard.notice-detail";
	}*/
}
