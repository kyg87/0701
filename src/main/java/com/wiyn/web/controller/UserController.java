package com.wiyn.web.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.soap.SOAPBinding.Use;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.BigCategoryDao;
import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.MemberDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteBoardLikeDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.dao.UserPageDao;
import com.wiyn.web.entity.AddBoard;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.Member;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.SmallCategory;
import com.wiyn.web.entity.UserSiteBoard;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FreeBoardDao freeBoardDao;
	
	@Autowired
	private RequestBoardDao requestBoardDao;
	
	@Autowired
	private SiteBoardDao siteBoardDao;
	
	
	@RequestMapping("mypage")
	public String UserMain(Authentication auth,Model model, AddBoard addboard, String title,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            @RequestParam(value="memberId",defaultValue="")String memberId
           
			){

		
	
		/*List<AddBoard> list = sqlSession.getMapper(UserPageDao.class).getList(auth.getName());*/
		
		List<AddBoard> free = sqlSession.getMapper(UserPageDao.class).getFreeList(memberId);
		List<UserSiteBoard> site = sqlSession.getMapper(UserPageDao.class).getSiteList(memberId);
		
		for (UserSiteBoard userSiteBoard : site) {
			
			userSiteBoard.setSiteBoard(sqlSession.getMapper(SiteBoardDao.class).getBoard(userSiteBoard.getId()));
			
			userSiteBoard.getSiteBoard().setUserProfile(sqlSession.getMapper(MemberDao.class).get(userSiteBoard.getSiteBoard().getMemberId()).getProfile());
			userSiteBoard.getSiteBoard().setLikeCount(sqlSession.getMapper(SiteBoardLikeDao.class).getLike(userSiteBoard.getSiteBoard().getId()));
		
		}
		

		List<AddBoard> request = sqlSession.getMapper(UserPageDao.class).getRequestList(memberId);
	
		List<AddBoard> list2 = sqlSession.getMapper(UserPageDao.class).getCommentList(memberId);
		List<AddBoard> list3 = sqlSession.getMapper(UserPageDao.class).getLikeList(memberId);
		
		int sum = sqlSession.getMapper(UserPageDao.class).getReplyCount(memberId);
		int like = sqlSession.getMapper(UserPageDao.class).getLikeCount(memberId);
		int list = sqlSession.getMapper(UserPageDao.class).getListCount(memberId);
	
		Member member = sqlSession.getMapper(MemberDao.class).get(memberId);

	/*	if(data.equals("1")){
			List<AddBoard> result = sqlSession.getMapper(UserPageDao.class).getFreeList(auth.getName());
			model.addAttribute("list", result);
		}
		
		else if(data.equals("2")){
			List<AddBoard> result = sqlSession.getMapper(UserPageDao.class).getSiteList(auth.getName());
			model.addAttribute("list", result);
		}
		
		else if(data.equals("3")){
			List<AddBoard> result = sqlSession.getMapper(UserPageDao.class).getRequestList(auth.getName());
			model.addAttribute("list", result);
		}*/
		model.addAttribute("member", member);	
		model.addAttribute("list",list);
		model.addAttribute("sum",sum);
		model.addAttribute("like",like);
		
		
		model.addAttribute("free",free);
		model.addAttribute("site",site);
		model.addAttribute("request",request);
		
		
		/*model.addAttribute("list",list);*/
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);

	
		return "user.mypage";
	}
	/*@RequestMapping(value="/check_del", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public void testCheck(@RequestParam(value="valueArrTest[]") List<String> valueArr){
		System.out.println(valueArr);
	}
	*/
	
	
	
	@RequestMapping(value = "del", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")	
	public String delList(Authentication auth,Model model,
		
			AddBoard addBoard, 
			@RequestParam(value="boardName") String boardname,
			@RequestParam(value="array")ArrayList<String> send_array, //[id=18, boardname=asdkfj]
			@RequestParam(value="id") String id
			){
		
		System.out.println(boardname);
	
		for(int i=0;i<send_array.size();i++){
			System.out.println(send_array.get(i));
			id = send_array.get(i);
			
			
				/*freeBoardDao.delete();
				
				requestBoardDao.delete();
				
				siteBoardDao.delete();*/
			
		}
		
		
		
	/*	if(aa[i].equals("free")){		
			freeBoardDao.delete(id);
			
		}
		else if(aa[i].equals("site")){
			siteBoardDao.delete(id);
			
		}
		else{
			requestBoardDao.delete(id);
		}
		}*/
	/*	HashMap hm = new HashMap();
		List al = new ArrayList();
		//System.out.println(boardname);
		for(int i=0;i<send_array.size();i++){
			
			hm.put(send_array.get(i), boardname.get(i));
			
		}
		al.add(hm);
		
		System.out.println(al);*/
		
		return "redirect:mypage";
	}

	
	
}
