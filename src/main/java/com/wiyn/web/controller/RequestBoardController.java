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

import com.google.gson.Gson;
import com.wiyn.web.dao.BigCategoryDao;
import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.RequestCommentDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.RequestBoard;
import com.wiyn.web.entity.RequestComment;
import com.wiyn.web.entity.SmallCategory;

@Controller
@RequestMapping("/requestboard/*")
public class RequestBoardController {
	@Autowired

	private RequestBoardDao requestBoardDao;

	@Autowired
	private RequestCommentDao requestCommentDao;

	@Autowired
	private SqlSession sqlSession;

	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SmallCategoryDao smallCategoryDao;
	
	@RequestMapping(value="getListBC", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String GetListWithBC(Model model,
			@RequestParam(value="bigCa")String bigCategoryId){

		System.out.println(bigCategoryId);
		List<SmallCategory> bcaList = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategoryId);
		model.addAttribute("bcaList", bcaList);

		
		Gson gson = new Gson();
		String json1 = gson.toJson(bcaList);
		
		return json1;
	}
	
	@RequestMapping("requestboard")
	public String request(@RequestParam(value="p", defaultValue="1")Integer page,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            Model model) {

		
		List<RequestBoard> list = sqlSession.getMapper(RequestBoardDao.class).getList(page);
		int size = sqlSession.getMapper(RequestBoardDao.class).getSize();
		
		model.addAttribute("list", list);
		model.addAttribute("size", size);
		
		System.out.println("www"+size);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			bigCategory.setSmallCategory(sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId()));
		}

		model.addAttribute("bcbList", bcbList);
		
		return "requestboard.requestboard";
	}

	@RequestMapping("request-reg")
	public String site() {

		return "requestboard.request-reg";
	}

	@RequestMapping(value = "reg", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")

	public String sited(

			RequestBoard requestBoard, @RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, @RequestParam(value = "memberId") String memberId) {

		
		requestBoard.setTitle(title);
		requestBoard.setContent(content);
		requestBoard.setMemberId(memberId);

		requestBoardDao.add(requestBoard);
		
		
		return "redirect:request-detail?c=" + requestBoard.getId();

	}




	@RequestMapping("request-edit")
	public String RequestEditGet(@RequestParam("c") String id,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
			Model model) {

		System.out.println("fdfdf");
		RequestBoard requestboard = new RequestBoard();

		requestboard = sqlSession.getMapper(RequestBoardDao.class).get(id);
		

		model.addAttribute("n", requestboard);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			bigCategory.setSmallCategory(sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId()));
		}

		model.addAttribute("bcbList", bcbList);

		return "requestboard.request-edit";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	
	public String requestUpdate(
			
			RequestBoard requestBoard ,
			String id,
			String title,
			String content) {
		
		
		System.out.println(title);
		System.out.println(content);
		
		requestBoard.setId(id);
		requestBoard.setTitle(title);
		requestBoard.setContent(content);
		
		
		requestBoardDao.update(requestBoard);
		
		
		
		return "redirect:request-detail?c=" + requestBoard.getId();
	}
	
	@RequestMapping(value = "request-del", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String requestDel(RequestBoard requestBoard,

			@RequestParam(value = "id") String id) {

		System.out.println(id);
		requestBoardDao.delete(id);

		return "redirect:requestboard";

	}
	
	@RequestMapping("request-detail")
	public String RequestDetail(@RequestParam("c") String id, @RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
			Model model) {


		RequestBoard requestboard = new RequestBoard();

		requestboard = sqlSession.getMapper(RequestBoardDao.class).get(id);
		requestboard.setRequestComment(sqlSession.getMapper(RequestCommentDao.class).getList(id, page));
	
		int size = sqlSession.getMapper(RequestCommentDao.class).getSize(id);
		
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("n", requestboard);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			bigCategory.setSmallCategory(sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId()));
		}

		model.addAttribute("bcbList", bcbList);

		return "requestboard.request-detail";
	}

	
	
	
	
	@RequestMapping(value = "requestBoard-detail", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String requestDetails(RequestComment requestComment, @RequestParam(value = "content") String content,
			@RequestParam(value = "requestBoardId") String requestBoardId,
			@RequestParam(value = "memberId") String memberId) {

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
