package com.wiyn.web.controller;

import java.io.File;
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
import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteBoardLikeDao;
import com.wiyn.web.dao.SiteCommentDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.dao.TagDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.SiteBoardLike;
import com.wiyn.web.entity.SiteComment;
import com.wiyn.web.entity.SmallCategory;
import com.wiyn.web.entity.Tag;

@Controller
@RequestMapping("/siteboard/*")
public class SiteBoardController {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private SiteBoardDao siteBoardDao;
	
	@Autowired
	private SiteCommentDao siteCommentDao;
	
	@Autowired
	private SiteBoardLikeDao siteBoardLikeDao;
	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SmallCategoryDao smallCategoryDao;
	
	@Autowired
	private TagDao tagDao;
	
    @RequestMapping("siteboard")
    public String siteboard(String id,
            @RequestParam(value="p", defaultValue="1")Integer page, 
            @RequestParam(value="q", defaultValue="")String query,
            @RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            Model model){
        

        List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page,query,bigCategoryId, smallCategoryId);
            

        model.addAttribute("sitelist", sitelist);
        
        int size= sqlSession.getMapper(SiteBoardDao.class).getSize();
        String last= sqlSession.getMapper(SiteBoardDao.class).lastId();
        SiteBoard board=sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
        model.addAttribute("size", size);
        model.addAttribute("last", last);
        model.addAttribute("board", board);
        
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
        
//        -------------------------����̵�-----------------------
        List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
        
        for (BigCategory bigCategory : bcbList) {
            List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
            bigCategory.setSmallCategory(small);
        }
        model.addAttribute("bcbList", bcbList);
        
        return "siteboard.siteboard";    
    }

	@RequestMapping("site-reg")
	public String site(Model model,
			@RequestParam(value="bigCa",defaultValue="")String bigcategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallcategoryId){
				
		List<BigCategory> bcList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcList) {
			bigCategory.setSmallCategory(sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId()));
		}

		model.addAttribute("bcList", bcList);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		
		return "siteboard.site-reg";		
	}
	
	@RequestMapping(value="getListWithBC", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String GetListWithBC(Model model,
			@RequestParam(value="bigCategoryId")String bigCategoryId){

		System.out.println(bigCategoryId);
		List<SmallCategory> scList = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategoryId);
		model.addAttribute("scList", scList);

		
		Gson gson = new Gson();
		String json = gson.toJson(scList);
		
		return json;
	}
	
	@RequestMapping(value="reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String site(
			SiteBoard siteBoard,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="url")String url,
			@RequestParam(value="memberId")String memberId,
			@RequestParam(value="bigCategoryId")String bigCategoryId,
			@RequestParam(value="smallCategoryId")String smallCategoryId,
			Tag tag,
			@RequestParam(value="tag")String name
			){
					
		System.out.println(title);
		System.out.println(url);
		System.out.println(content);
		System.out.println(bigCategoryId);
		
	
		siteBoard.setContent(content);
		siteBoard.setTitle(title);
		siteBoard.setUrl(url);
		siteBoard.setMemberId(memberId);
		siteBoard.setBigCategoryId(bigCategoryId);
		siteBoard.setSmallCategoryId(smallCategoryId);
		siteBoardDao.add(siteBoard);
		
		if(name!=null){
			
			System.out.println("포문전태그네임"+name);
			
			
			String[] tagName=(name.replace(" ", "")).split(",");
			
			System.out.println(name);
			
			
			for(int i=0; i<tagName.length; i++){
				
				tag.setName(tagName[i]);
				tag.setSiteBoardId(siteBoard.getId());
				tagDao.add(tag);
				
				System.out.println("사이트보드아이디"+siteBoard.getId());
				System.out.println("태그네임"+tagName[i]);
				System.out.println("아이디"+tag.getId());
			}
			
			
			
		}

		return "redirect:site-detail?c=" + siteBoard.getId();
		
	}

	@RequestMapping(value="site-detail",produces="text/plain;charset=UTF-8")
	public String siteDetail(
			@RequestParam("c")String id, 
			@RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
			Model model
			)
	{
		SiteBoard siteBoard = new SiteBoard();

		siteBoard = sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
		
		siteBoard.setSiteComments(sqlSession.getMapper(SiteCommentDao.class).getList(id, page));
		System.out.println(siteBoard.getMemberId());
		int size = sqlSession.getMapper(SiteCommentDao.class).getSize(id);
		
		int likeCount = siteBoardLikeDao.getLike(id);	
		
		String bName = siteBoardDao.getBName(id);
		String sName = siteBoardDao.getSName(id);
		List<Tag> tName = siteBoardDao.getTName(id);

		model.addAttribute("l", likeCount);
		model.addAttribute("n", siteBoard);
		model.addAttribute("b", bName);
		model.addAttribute("s", sName);
		model.addAttribute("t", tName);
		
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		siteBoardDao.updateHit(id);
		
		System.out.println("태그네임"+tName);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		
		
		return "siteboard.site-detail";
	}
	
	
	@RequestMapping(value="site-list",  produces="text/plain;charset=UTF-8")
	public String siteTag(
			@RequestParam("query")String query,
			Model model
			)
	{

		/*System.out.println("이케쿼리"+query);*/
	    List<SiteBoard> list	= sqlSession.getMapper(SiteBoardDao.class).getTagLoad(query);

		/*System.out.println(list);*/
		
		model.addAttribute("query", query);
		model.addAttribute("list",list);
		
		return "siteboard.site-list";
	}
	
	/*@RequestMapping("site-list")
	public String siteList(
			Model model,
			SiteBoard siteBoard
			){
		List<SiteBoard> list = sqlSession.getMapper(SiteBoardDao.class).getList(page, query);
		model.addAttribute("n", siteBoard);		 
		
		return "siteboard.site-list";
	}*/
	
	@RequestMapping("site-edit")
     public String siteEdit(@RequestParam("c") String id,
    		 @RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
             @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
             Model model){
        
		System.out.println("타닝");

		List<BigCategory> bcList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		
		for (BigCategory bigCategory : bcList) {
			bigCategory.setSmallCategory(sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId()));
		}
		
		
		model.addAttribute("bcList", bcList);
        model.addAttribute("n", siteBoardDao.getBoard(id));
        model.addAttribute("b", siteBoardDao.getBName(id));
        model.addAttribute("s", siteBoardDao.getSName(id));
        model.addAttribute("t", siteBoardDao.getTName(id));
      
        System.out.println(id);
        
        
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
        
        
        
        return "siteboard.site-edit";
     }
	
	 @RequestMapping(value="edit", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
		public String siteEdit(
				SiteBoard siteBoard,
				@RequestParam(value="title")String title, 
				@RequestParam(value="content")String content,
				@RequestParam(value="url")String url,
				@RequestParam(value="bigCategoryId", defaultValue="aa")String bigCategoryId,
				@RequestParam(value="aa")String tegoryId,
				@RequestParam(value="smallCategoryId", defaultValue="bb")String smallCategoryId,
				@RequestParam(value="bb")String oryId,
				Tag tag,
				@RequestParam(value="tag", required=false)String name
				){

		 	/*model.addAttribute("n", siteBoard);	*/
		 		if(bigCategoryId.equals("aa"))bigCategoryId = tegoryId;
		 		if(smallCategoryId.equals("bb"))smallCategoryId = oryId;
		 		
		 		siteBoard.setContent(content);
				siteBoard.setTitle(title);
				siteBoard.setUrl(url);
				
				siteBoard.setBigCategoryId(bigCategoryId);
				siteBoard.setSmallCategoryId(smallCategoryId);
				
				System.out.println("이게수정할사이트아이디"+siteBoard.getId());
				
				tagDao.delete(siteBoard.getId());
				
				if(name!=null){
					
					System.out.println("포문전태그네임"+name);
					
					
					String[] tagName=(name.replace(" ", "")).split(",");
					
					System.out.println(name);
					
					
					for(int i=0; i<tagName.length; i++){
						
						tag.setName(tagName[i]);
						tag.setSiteBoardId(siteBoard.getId());
						tagDao.add(tag);
						
						System.out.println("사이트보드아이디"+siteBoard.getId());
						System.out.println("태그네임"+tagName);
						System.out.println("아이디"+tag.getId());
					}
				}
				
				siteBoardDao.update(siteBoard);
		 	
			System.out.println("대분류"+bigCategoryId);
			System.out.println("소분류"+smallCategoryId);

			System.out.println("태크삭제할아이디"+siteBoard.getId());
			
			

			
			
			return "redirect:site-detail?c=" + siteBoard.getId();
		}
	 
	 
	 @RequestMapping(value ="site-delete", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
     public String siteDelete(@RequestParam(value = "id") String id,
    		 SiteBoard siteBoard ){
 
		siteBoardDao.delete(id);
        
        return "redirect:/main/index";
     }
		
	 @RequestMapping(value="like", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
		public String siteLike(
				SiteBoardLike siteBoardLike,
				@RequestParam(value="siteBoardId")String siteBoardId,
				@RequestParam(value="memberId")String memberId
				){
		    System.out.println("타나여");
			System.out.println("좋아요누른사이트아이디"+siteBoardId);
			System.out.println("좋아요누른멤버아이디"+memberId);

			siteBoardLike.setSiteBoardId(siteBoardId);
			siteBoardLike.setMemberId(memberId);
		
			int exitLike =siteBoardLikeDao.isExitLike(siteBoardId, memberId);
			
			if (exitLike>0){
				siteBoardLikeDao.delete(siteBoardId, memberId);
			}
			else{
				siteBoardLikeDao.add(siteBoardLike);
			}
			
			return "redirect:site-detail?c=" + siteBoardLike.getSiteBoardId();
		}
	 
	

}
