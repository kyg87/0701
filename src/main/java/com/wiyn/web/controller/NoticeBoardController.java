package com.wiyn.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.wiyn.web.dao.BigCategoryDao;
import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.NoticeBoardFileDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SmallCategoryDao;
import com.wiyn.web.entity.BigCategory;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.NoticeBoard;
import com.wiyn.web.entity.NoticeFile;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.SmallCategory;



@Controller
@RequestMapping("/noticeboard/*")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardDao noticeBoardDao;
	
	@Autowired
	private NoticeBoardFileDao noticeBoardFileDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ServletContext context;
	
//	---------어사이드 리스트 불러오기-------
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Autowired
	private SmallCategoryDao smallCategoryDao;
	

	
	@RequestMapping(value = "noticeboard", produces="text/plain;charset=UTF-8")
	public String site(Model model,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
			@RequestParam(value="p", defaultValue="1")Integer page){
		
		List<NoticeBoard> list = sqlSession.getMapper(NoticeBoardDao.class).getList();
		/*List<FreeBoard> flist = sqlSession.getMapper(FreeBoardDao.class).getList();*/
		
		int cnt = sqlSession.getMapper(NoticeBoardDao.class).count();
		int listPerFive = (page-1)/5;
		int checkLast = (listPerFive*5) + 5;
		
		if(cnt % 10 == 0)
			cnt = cnt/10;
		else
			cnt = (cnt/10)+1;
		
		if(checkLast > cnt)
			checkLast = cnt;
		
		List<NoticeFile> fileList = sqlSession.getMapper(NoticeBoardFileDao.class).getList();
		
		model.addAttribute("flist", fileList);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("listPerFive", listPerFive);
		model.addAttribute("checkLast", checkLast);
		model.addAttribute("cnt", cnt);
		/*model.addAttribute("noticeboard", "noticeboard");*/
		System.out.println(page);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		
		return "noticeboard.noticeboard";
	}
	
	@RequestMapping("notice-reg")
	public String noticeReg(Model model){
		
		return "noticeboard.notice-reg";
	}
	
	@RequestMapping("notice-detail")
	public String noticeDetail(Model model,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            @RequestParam(value="p")String page,
			@RequestParam(value="c")String id){
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard = sqlSession.getMapper(NoticeBoardDao.class).get(id);
		
		NoticeFile noticeFile = new NoticeFile();
		noticeFile = sqlSession.getMapper(NoticeBoardFileDao.class).get(id);
		
		String content = noticeBoard.getContent().replace("\n", "<br />");
		noticeBoard.setContent(content);
		
		model.addAttribute("list", noticeBoard);
		model.addAttribute("file", noticeFile);
		model.addAttribute("page", page);
		
		noticeBoardDao.updateViewCnt(id);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		
		return "noticeboard.notice-detail";
	}
	
	@RequestMapping(value="noticeBoard-reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String sited(
			NoticeBoard noticeBoard,
			NoticeFile noticeFile,
			@RequestParam(value="file", defaultValue="null") MultipartFile file,
			@RequestParam(value="p")String page,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="memberId")String memberId,
			@RequestParam(value="contentSrc")String contentSrc
			)throws IOException{
		
		noticeBoard.setTitle(title);
		noticeBoard.setContent(content);
		noticeBoard.setMemberId(memberId);
		noticeBoard.setContentSrc(contentSrc);
		
		noticeBoardDao.add(noticeBoard);		
		
		if(!file.isEmpty()){
			String path = context.getRealPath("/resource/upload");
			
			/*String path = "WiynPrj\\resources\\upload";*/
			
			File d = new File(path);
			if(!d.exists())//경로가 존재하지 않는다면
				d.mkdir();
		
			String originalFilename = file.getOriginalFilename(); // fileName.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
			
		    String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
		    String fullPath = path + "\\" + rename;
		    
		    if (!file.isEmpty()) {
		        try {
		            byte[] bytes = file.getBytes();
		            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
		            stream.write(bytes);
		            stream.close();
		            //model.addAttribute("resultMsg", "파일을 업로드 성공!");
		            System.out.println("업로드 성공");
		        } catch (Exception e) {
		            //model.addAttribute("resultMsg", "파일을 업로드하는 데에 실패했습니다.");
		        	System.out.println("업로드 실패");
		        }
		    } else {
		        //model.addAttribute("resultMsg", "업로드할 파일을 선택해주시기 바랍니다.");
		    	System.out.println("업로드 파일 x");
		    }
		    
		    fullPath = "\\resource\\upload\\";
		    
		    noticeFile.setName(rename);
			noticeFile.setNoticeBoardId(noticeBoard.getId());
			noticeFile.setSrc(fullPath);
			
			noticeBoardFileDao.add(noticeFile);
		    
		    System.out.println(fullPath);
		}
		
		return "redirect:notice-detail?c="+noticeBoard.getId()+"&p="+page;
		
	}
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	@RequestMapping("notice-modify-load")
	public String modifyDetail(Model model,
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            @RequestParam(value="p")String page,
			@RequestParam(value="id")String id){
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard = sqlSession.getMapper(NoticeBoardDao.class).get(id);
		
		NoticeFile noticeFile = new NoticeFile();
		noticeFile = sqlSession.getMapper(NoticeBoardFileDao.class).get(id);
		
		model.addAttribute("list", noticeBoard);
		model.addAttribute("file", noticeFile);
		model.addAttribute("page", page);
		
		
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);
		
		return "noticeboard.notice-edit";
	}
	
	@RequestMapping("notice-delete")
	public String Delete(
			@RequestParam(value="id")String id){
		
		noticeBoardDao.delete(id);
		
		System.out.println("del?!");
		
		return "noticeboard:noticeboard";
	}
	
	@RequestMapping(value = "notice-update", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String updateNotice(
			Model model,
			NoticeBoard noticeBoard,
			NoticeFile noticeFile,
			@RequestParam(value="file", defaultValue="null") MultipartFile file,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="contentSrc")String contentSrc,
			@RequestParam(value="p")String page,
			@RequestParam(value="id")String id)throws IOException{
		
		noticeBoard.setTitle(title);
		noticeBoard.setContent(content);
		noticeBoard.setContentSrc(contentSrc);
		
		noticeBoardDao.update(noticeBoard);
		
		if(!file.isEmpty()){
			String path = context.getRealPath("/resource/upload");
			
			File d = new File(path);
			if(!d.exists())//경로가 존재하지 않는다면
				d.mkdir();
		
			String originalFilename = file.getOriginalFilename(); // fileName.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
			
		    String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
		    String fullPath = path + "\\" + rename;
		    
		    if (!file.isEmpty()) {
		        try {
		            byte[] bytes = file.getBytes();
		            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
		            stream.write(bytes);
		            stream.close();
		            //model.addAttribute("resultMsg", "파일을 업로드 성공!");
		            System.out.println("업로드 성공");
		        } catch (Exception e) {
		            //model.addAttribute("resultMsg", "파일을 업로드하는 데에 실패했습니다.");
		        	System.out.println("업로드 실패");
		        }
		    } else {
		        //model.addAttribute("resultMsg", "업로드할 파일을 선택해주시기 바랍니다.");
		    	System.out.println("업로드 파일 x");
		    }
		    
		    fullPath = "\\resource\\upload\\";
		    		    
		    noticeFile.setName(rename);
		    noticeFile.setSrc(fullPath);
		    noticeFile.setNoticeBoardId(id);
		    
		    if(noticeBoardFileDao.get(id) == null)
		    	noticeBoardFileDao.add(noticeFile);
		    
		    else
		    	noticeBoardFileDao.update(noticeFile);
		    
		    System.out.println(noticeBoardFileDao.get(id));
		    		    
		}
		
		model.addAttribute("p", page);
		
		return "redirect:notice-detail?c=" + id;
	}
}















