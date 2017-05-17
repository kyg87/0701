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
	public String request(Model model) {

		List<FreeBoard> list = sqlSession.getMapper(FreeBoardDao.class).getList();
		model.addAttribute("list", list);

		return "freeboard.freeboard";
	}

	@RequestMapping("free-reg")
	public String free() {

		return "freeboard.free-reg";
	}

	@RequestMapping(value = "reg", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String free(FreeBoard freeboard, 
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, 
			@RequestParam(value = "contentSrc") String contentSrc,
			@RequestParam(value = "memberId") String memberId) {

		freeboard.setTitle(title);
		freeboard.setContent(content);
		freeboard.setContentSrc(contentSrc);
		freeboard.setMemberId(memberId);

		freeBoardDao.add(freeboard);

		return "redirect:free-detail?c=" + freeboard.getId();

	}

	@RequestMapping("free-detail")
	public String freeDetail(
			@RequestParam(value="p", defaultValue="1")Integer page, 
			@RequestParam("c") String id, 
			Model model) {

		FreeBoard freeboard = new FreeBoard();

		freeboard = sqlSession.getMapper(FreeBoardDao.class).get(id);
		freeboard.setFreeComment(sqlSession.getMapper(FreeCommentDao.class).getList(id,page));
		System.out.println(id);
		System.out.println(page);
		System.out.println(sqlSession.getMapper(FreeCommentDao.class).getSize(id));
		System.out.println(sqlSession.getMapper(FreeCommentDao.class).getList(id,page).size());
		
		int size = sqlSession.getMapper(FreeCommentDao.class).getSize(id);
		
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("n", freeboard);

		return "freeboard.free-detail";
	}

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

	@RequestMapping(value = "free-del", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String freeDel(FreeBoard freeboard,

			@RequestParam(value = "id") String id) {

		// System.out.println(id);
		freeBoardDao.delete(id);

		return "redirect:freeboard";

	}

	@RequestMapping("free-edit")
	public String freeEditGet(@RequestParam("c") String id, Model model) {


		model.addAttribute("n", freeBoardDao.get(id));

		return "freeboard.free-edit";
	}

	@RequestMapping(value = "free-details", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String freeEditPost(Model model, FreeBoard freeboard,
			String title, 
			 String content,
			String contentSrc) {

		/*freeboard = sqlSession.getMapper(FreeBoardDao.class).get(id);*/

		model.addAttribute("n", freeboard);

		System.out.println(title);
		System.out.println(content);
		
		freeboard.setTitle(title);
		freeboard.setContent(content);
		freeboard.setContentSrc(contentSrc);

		freeBoardDao.update(freeboard);

		return "redirect:free-detail?c="+freeboard.getId();
	}
}
