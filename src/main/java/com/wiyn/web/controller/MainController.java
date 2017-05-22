package com.wiyn.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteBoardLikeDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.NoticeBoard;
import com.wiyn.web.entity.RequestBoard;
import com.wiyn.web.entity.SiteBoard;




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
	private SiteBoardLikeDao siteBoardLikeDao;

    @RequestMapping("index")
    public String index(String id,
            @RequestParam(value="p", defaultValue="1")Integer page, 
            @RequestParam(value="q", defaultValue="")String query,
            Model model) {
        List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page,query);
        List<SiteBoard> sitelistlike = sqlSession.getMapper(SiteBoardDao.class).getListLike(page, query);
        List<SiteBoard> sitelistcomment = sqlSession.getMapper(SiteBoardDao.class).getListComment(page, query);
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
		String bName = siteBoardDao.getBName(id);
		String sName = siteBoardDao.getSName(id);
		
		
        model.addAttribute("random", random);
		model.addAttribute("l", likeCount);
		model.addAttribute("b", bName);
		model.addAttribute("s", sName);
        
        return "main.index";
    }
    

}
