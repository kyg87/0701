package com.wiyn.web.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.dao.UserPageDao;
import com.wiyn.web.entity.AddBoard;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.SmallCategory;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private UserPageDao userPageDao;
	
	@Autowired
	private SiteBoardDao siteBoardDao;
	@Autowired
	private FreeBoardDao freeBoardDao;
	@Autowired
	private RequestBoardDao requestBoardDao;
	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SmallCategoryDao smallCategoryDao;
	
	@RequestMapping("mypage")
	public String UserMain(Authentication auth,Model model, AddBoard addboard, String title,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId){

		
		System.out.println(auth.getName());
		List<AddBoard> list = sqlSession.getMapper(UserPageDao.class).getList(auth.getName());
		List<AddBoard> list2 = sqlSession.getMapper(UserPageDao.class).getCommentList(auth.getName());
		List<AddBoard> list3 = sqlSession.getMapper(UserPageDao.class).getLikeList(auth.getName());
		
		
		
	/*	for (AddBoard addBoard2 : list3) {
			System.out.println(addBoard2.getTitle());
		}*/
		model.addAttribute("list",list);
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
		
			SiteBoard siteBoard,AddBoard addBoard,
			@RequestParam(value="boardName")ArrayList<String> boardname,
			@RequestParam(value="array")ArrayList<String> send_array, //[id=18, boardname=asdkfj]
			@RequestParam(value="id") String id
			){
		
		
		//System.out.println("삭제");
		System.out.println(boardname.get(4));
		//System.out.println(boardname);
	
		
		HashMap hm = new HashMap();
		List al = new ArrayList();
		for(int i=0;i<send_array.size();i++){
		hm.put(send_array.get(i), boardname.get(i));
		
		}
		al.add(hm);
		System.out.println("결과"+ al);
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*send_array = send_array.split(",");
		for(int i=0;i<aa.length;i++){
		
		
		if(aa[i].equals("free")){		
			freeBoardDao.delete(id);
			
		}
		else if(aa[i].equals("site")){
			siteBoardDao.delete(id);
			
		}
		else{
			requestBoardDao.delete(id);
		}
		}*/
		return "redirect:mypage";
	}

	
	
}
