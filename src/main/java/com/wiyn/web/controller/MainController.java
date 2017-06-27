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
import com.wiyn.web.dao.MemberDao;
import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteBoardLikeDao;
import com.wiyn.web.dao.SiteCommentDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.NoticeBoard;
import com.wiyn.web.entity.RequestBoard;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.SmallCategory;
import com.wiyn.web.entity.Tag;




@Controller
@RequestMapping("/main/*")
public class MainController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SiteBoardDao siteBoardDao;
	
	@Autowired
	private NoticeBoardDao noticBoardDao;
	
	@Autowired
	private RequestBoardDao requestBoardDao;
	
	@Autowired
	private SiteBoardLikeDao siteBoardLikeDao;
	
	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SmallCategoryDao smallCategoryDao;
	
    @RequestMapping("index")
    public String index(String id,
            @RequestParam(value="p", defaultValue="1")Integer page, 
            @RequestParam(value="q", defaultValue="")String query,
            @RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            Model model) {
        List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page,query,bigCategoryId, smallCategoryId);
        List<SiteBoard> sitelistlike = sqlSession.getMapper(SiteBoardDao.class).getListLike(page, query,bigCategoryId, smallCategoryId);
        List<SiteBoard> sitelistcomment = sqlSession.getMapper(SiteBoardDao.class).getListComment(page, query,bigCategoryId, smallCategoryId);
        
        int size= sqlSession.getMapper(SiteBoardDao.class).getSize();
        String last= sqlSession.getMapper(SiteBoardDao.class).lastId();
        SiteBoard board=sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
        SiteBoard prev=sqlSession.getMapper(SiteBoardDao.class).getPrev(id);
        SiteBoard next=sqlSession.getMapper(SiteBoardDao.class).getNext(id);
        
        String a = sqlSession.getMapper(SmallCategoryDao.class).getFirstHot();
        System.out.println("asd");
        List<SiteBoard> hot =sqlSession.getMapper(SiteBoardDao.class).getHotSmall(a);
        
        for (SiteBoard siteBoard : hot) {
			siteBoard.setUserProfile(sqlSession.getMapper(MemberDao.class).get(siteBoard.getMemberId()).getProfile());
			siteBoard.setLikeCount(sqlSession.getMapper(SiteBoardLikeDao.class).getLike(siteBoard.getId()));
		}
        model.addAttribute("hot", hot);
        
        String b = sqlSession.getMapper(SmallCategoryDao.class).getSecondHot();
        List<SiteBoard> hot2 =sqlSession.getMapper(SiteBoardDao.class).getHotSmall(b);
        
        for (SiteBoard siteBoard : hot2) {
        	siteBoard.setUserProfile(sqlSession.getMapper(MemberDao.class).get(siteBoard.getMemberId()).getProfile());
        	siteBoard.setLikeCount(sqlSession.getMapper(SiteBoardLikeDao.class).getLike(siteBoard.getId()));
		}
        model.addAttribute("hot2", hot2);
        
       
        /*-------공지사항 불러오기----------*/
        List<NoticeBoard> noticelist = sqlSession.getMapper(NoticeBoardDao.class).getList();
        model.addAttribute("noticelist", noticelist);
        
        /*-------사이트게시판 불러오기-------*/
        model.addAttribute("sitelist", sitelist);
        model.addAttribute("sitelistlike", sitelistlike);
        model.addAttribute("sitelistcomment", sitelistcomment);
        
        model.addAttribute("size", size);
        model.addAttribute("last", last);
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("board", board);
        /*-------------랜덤페이지 가져오기----------------*/
    
        SiteBoard random=sqlSession.getMapper(SiteBoardDao.class).getRandom();
		int likeCount = siteBoardLikeDao.getLike(id);	
		
		
		String bName = siteBoardDao.getBName(random.getId());
		String sName = siteBoardDao.getSName(random.getId());
		List<Tag> tName = siteBoardDao.getTName(random.getId());
		
		System.out.println(bName);
		
		
        model.addAttribute("random", random);
		model.addAttribute("l", likeCount);
		model.addAttribute("b", bName);
		model.addAttribute("s", sName);
		model.addAttribute("t", tName);
//		--------------------페이지-------------------
		int cnt= sqlSession.getMapper(SiteBoardDao.class).count();
		int listPerFive = (page-1)/5;
		int checkLast = (listPerFive*5) + 5;
		
		if(cnt % 10 == 0)
			cnt = cnt/10;
		else
			cnt = (cnt/10)+1;
		
		if(checkLast > cnt)
			checkLast = cnt;
		
		model.addAttribute("listPerFive", listPerFive);
		model.addAttribute("checkLast", checkLast);
		model.addAttribute("cnt", cnt);
		
//		-------------------------어사이드-----------------------
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		
        return "main.index";        
        
    }
    
    @RequestMapping("index2")
    public String index2(String id,
            @RequestParam(value="p", defaultValue="1")Integer page, 
            @RequestParam(value="q", defaultValue="")String query,
            @RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            Model model) {
    	 List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page,query,bigCategoryId, smallCategoryId);
         List<SiteBoard> sitelistlike = sqlSession.getMapper(SiteBoardDao.class).getListLike(page, query,bigCategoryId, smallCategoryId);
         List<SiteBoard> sitelistcomment = sqlSession.getMapper(SiteBoardDao.class).getListComment(page, query,bigCategoryId, smallCategoryId);
         

         
         int size= sqlSession.getMapper(SiteBoardDao.class).getSize();
         String last= sqlSession.getMapper(SiteBoardDao.class).lastId();
         SiteBoard board=sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
         SiteBoard prev=sqlSession.getMapper(SiteBoardDao.class).getPrev(id);
         SiteBoard next=sqlSession.getMapper(SiteBoardDao.class).getNext(id);
         
         
         
        
         /*-------공지사항 불러오기----------*/
         List<NoticeBoard> noticelist = sqlSession.getMapper(NoticeBoardDao.class).getList();
         model.addAttribute("noticelist", noticelist);
         
         /*-------사이트게시판 불러오기-------*/
         model.addAttribute("sitelist", sitelist);
         model.addAttribute("sitelistlike", sitelistlike);
         model.addAttribute("sitelistcomment", sitelistcomment);
         
         model.addAttribute("size", size);
         model.addAttribute("last", last);
         model.addAttribute("prev", prev);
         model.addAttribute("next", next);
         model.addAttribute("board", board);
         /*-------------랜덤페이지 가져오기----------------*/
     
         SiteBoard random=sqlSession.getMapper(SiteBoardDao.class).getRandom();
 		int likeCount = siteBoardLikeDao.getLike(id);	
 		
 		
 		String bName = siteBoardDao.getBName(random.getId());
 		String sName = siteBoardDao.getSName(random.getId());
 		List<Tag> tName = siteBoardDao.getTName(random.getId());
 		
 		System.out.println(bName);
 		
 		
         model.addAttribute("random", random);
 		model.addAttribute("l", likeCount);
 		model.addAttribute("b", bName);
 		model.addAttribute("s", sName);
 		model.addAttribute("t", tName);
// 		--------------------페이지-------------------
 		int cnt= sqlSession.getMapper(SiteBoardDao.class).count();
 		int listPerFive = (page-1)/5;
 		int checkLast = (listPerFive*5) + 5;
 		
 		if(cnt % 10 == 0)
 			cnt = cnt/10;
 		else
 			cnt = (cnt/10)+1;
 		
 		if(checkLast > cnt)
 			checkLast = cnt;
 		
 		model.addAttribute("listPerFive", listPerFive);
 		model.addAttribute("checkLast", checkLast);
 		model.addAttribute("cnt", cnt);
 		
// 		-------------------------어사이드-----------------------
 		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
 		
 		for (BigCategory bigCategory : bcbList) {
 			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
 			bigCategory.setSmallCategory(small);
 		}
 		model.addAttribute("bcbList", bcbList);
		
        return "main.index2";
    }
    
    
    @RequestMapping("index3")
    public String index3(String id,
            @RequestParam(value="p", defaultValue="1")Integer page, 
            @RequestParam(value="q", defaultValue="")String query,
            @RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            Model model) {
    	 List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page,query,bigCategoryId, smallCategoryId);
         List<SiteBoard> sitelistlike = sqlSession.getMapper(SiteBoardDao.class).getListLike(page, query,bigCategoryId, smallCategoryId);
         List<SiteBoard> sitelistcomment = sqlSession.getMapper(SiteBoardDao.class).getListComment(page, query,bigCategoryId, smallCategoryId);
         

         
         int size= sqlSession.getMapper(SiteBoardDao.class).getSize();
         String last= sqlSession.getMapper(SiteBoardDao.class).lastId();
         SiteBoard board=sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
         SiteBoard prev=sqlSession.getMapper(SiteBoardDao.class).getPrev(id);
         SiteBoard next=sqlSession.getMapper(SiteBoardDao.class).getNext(id);
         
         
         
        
         /*-------공지사항 불러오기----------*/
         List<NoticeBoard> noticelist = sqlSession.getMapper(NoticeBoardDao.class).getList();
         model.addAttribute("noticelist", noticelist);
         
         /*-------사이트게시판 불러오기-------*/
         model.addAttribute("sitelist", sitelist);
         model.addAttribute("sitelistlike", sitelistlike);
         model.addAttribute("sitelistcomment", sitelistcomment);
         
         model.addAttribute("size", size);
         model.addAttribute("last", last);
         model.addAttribute("prev", prev);
         model.addAttribute("next", next);
         model.addAttribute("board", board);
         /*-------------랜덤페이지 가져오기----------------*/
     
         SiteBoard random=sqlSession.getMapper(SiteBoardDao.class).getRandom();
 		int likeCount = siteBoardLikeDao.getLike(id);	
 		
 		
 		String bName = siteBoardDao.getBName(random.getId());
 		String sName = siteBoardDao.getSName(random.getId());
 		List<Tag> tName = siteBoardDao.getTName(random.getId());
 		
 		System.out.println(bName);
 		
 		
         model.addAttribute("random", random);
 		model.addAttribute("l", likeCount);
 		model.addAttribute("b", bName);
 		model.addAttribute("s", sName);
 		model.addAttribute("t", tName);
// 		--------------------페이지-------------------
 		int cnt= sqlSession.getMapper(SiteBoardDao.class).count();
 		int listPerFive = (page-1)/5;
 		int checkLast = (listPerFive*5) + 5;
 		
 		if(cnt % 10 == 0)
 			cnt = cnt/10;
 		else
 			cnt = (cnt/10)+1;
 		
 		if(checkLast > cnt)
 			checkLast = cnt;
 		
 		model.addAttribute("listPerFive", listPerFive);
 		model.addAttribute("checkLast", checkLast);
 		model.addAttribute("cnt", cnt);
 		
// 		-------------------------어사이드-----------------------
 		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
 		
 		for (BigCategory bigCategory : bcbList) {
 			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
 			bigCategory.setSmallCategory(small);
 		}
 		model.addAttribute("bcbList", bcbList);
		
        return "main.index3";
    }
    
    @RequestMapping(value = "reg-index", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
   	public String regindex(RequestBoard requestBoard,
   			@RequestParam(value = "title") String title,
   			@RequestParam(value = "content") String content,
   			@RequestParam(value = "memberId") String memberId) {
   		
   		

   		System.out.print("이거타니");
   		requestBoard.setTitle(title);
   		requestBoard.setContent(content);
   		requestBoard.setMemberId(memberId);

   		requestBoardDao.add(requestBoard);
   		
   		
   		/*return "redirect:request-detail?c=" + requestBoard.getId();*/
   		return "redirect:index#location123";

   	}
    
}
