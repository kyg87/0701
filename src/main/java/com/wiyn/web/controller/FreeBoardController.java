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
import com.wiyn.web.dao.BigCategoryDao;
import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.RequestBoard;
import com.wiyn.web.entity.SmallCategory;

@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {

	@Autowired
	private FreeBoardDao freeBoardDao;

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FreeCommentDao freeCommentDao;
	
	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SmallCategoryDao smallCategoryDao;
	


	@RequestMapping("freeboard")
	public String request(@RequestParam(value="p", defaultValue="1")Integer page,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
			Model model,String commentCount) {		
		
	/*	List<FreeBoard> list = sqlSession.getMapper(FreeBoardDao.class).getList();
		for (FreeBoard freeBoard : list) {
			freeBoard.setFreeComment(sqlSession.getMapper(FreeCommentDao.class).getList(freeBoard.getId(), 2));
			
		}*/
		

		List<FreeBoard> pageList = sqlSession.getMapper(FreeBoardDao.class).getList(page);
		int paging = sqlSession.getMapper(FreeBoardDao.class).getPage();
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("paging", paging);
	/*	model.addAttribute("list", list);*/
		model.addAttribute("freeboard", "freeboard");
		
		System.out.println("www"+paging);
		
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		
		return "freeboard.freeboard";
	}

	@RequestMapping("free-reg")
	public String free(
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            Model model) {
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		return "freeboard.free-reg";
	}

	@RequestMapping(value = "reg", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String free(FreeBoard freeboard, 
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, 
			@RequestParam(value = "contentSrc") String contentSrc,
			@RequestParam(value = "memberId") String memberId
			) {

		String boardName="free";
		freeboard.setTitle(title);
		freeboard.setContent(content);
		freeboard.setContentSrc(contentSrc);
		freeboard.setMemberId(memberId);
		freeboard.setBoardName(boardName);
		
		
		
		freeBoardDao.add(freeboard);

		return "redirect:free-detail?c=" + freeboard.getId();

	}

	@RequestMapping("free-detail")
	public String freeDetail(@RequestParam("c") String id, 
			@RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
			Model model) {

		FreeBoard freeboard = new FreeBoard();

		freeboard = sqlSession.getMapper(FreeBoardDao.class).get(id);
		freeboard.setFreeComment(sqlSession.getMapper(FreeCommentDao.class).getList(id, page));
		
		/*System.out.println(id);*/

		int size = sqlSession.getMapper(FreeCommentDao.class).getSize(id);

		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("n", freeboard);

		freeboard.getTitle();

		freeBoardDao.updateHit(id);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			bigCategory.setSmallCategory(sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId()));
		}

		model.addAttribute("bcbList", bcbList);

		return "freeboard.free-detail";
	}

	@RequestMapping(value = "free-del", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String freeDel(FreeBoard freeboard,

			@RequestParam(value = "id") String id) {

		// System.out.println(id);
		freeBoardDao.delete(id);

		return "redirect:freeboard";

	}

	@RequestMapping("free-edit")
	public String freeEditGet(@RequestParam("c") String id,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
			Model model) {


		model.addAttribute("n", freeBoardDao.get(id));
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);

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
	
	@RequestMapping(value="ListPage", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String ListPage(Model model,
			@RequestParam(value="page")String page,
			@RequestParam(value="id")String id){
		

		List<FreeBoard> freeboard = sqlSession.getMapper(FreeBoardDao.class).getList(id, Integer.parseInt(page));
	
		
		Gson gson = new Gson();
		String json = gson.toJson(freeboard);
		
		return json;
	}

	
}
