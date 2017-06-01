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
import org.springframework.web.multipart.MultipartFile;

import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.NoticeBoardFileDao;
import com.wiyn.web.entity.NoticeBoard;
import com.wiyn.web.entity.NoticeFile;



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
	
	@RequestMapping("noticeboard")
	public String site(Model model,
			@RequestParam(value="p", defaultValue="1")Integer page){
		
		List<NoticeBoard> list = sqlSession.getMapper(NoticeBoardDao.class).getList();
		int cnt = sqlSession.getMapper(NoticeBoardDao.class).count();
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		if(cnt % 10 == 0)
			model.addAttribute("cnt", cnt/10);
		else
			model.addAttribute("cnt", (cnt/10)+1);
		
		System.out.println(page);
		
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
		
		NoticeFile noticeFile = new NoticeFile();
		noticeFile = sqlSession.getMapper(NoticeBoardFileDao.class).get(id);
		
		model.addAttribute("list", noticeBoard);
		model.addAttribute("file", noticeFile);
		
		noticeBoardDao.updateViewCnt(id);
		
		return "noticeboard.notice-detail";
	}
	
	@RequestMapping(value="noticeBoard-reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String sited(
			NoticeBoard noticeBoard,
			NoticeFile noticeFile,
			@RequestParam(value="file", defaultValue="null") MultipartFile file,
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
		    
		    fullPath = "\\WiynPrj\\resource\\upload\\";
		    
		    noticeFile.setName(rename);
			noticeFile.setNoticeBoardId(noticeBoard.getId());
			noticeFile.setSrc(fullPath);
			
			noticeBoardFileDao.add(noticeFile);
		    
		    System.out.println(fullPath);
		}
		
		return "redirect:notice-detail?c=" + noticeBoard.getId();
		
	}
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	@RequestMapping("notice-modify-load")
	public String modifyDetail(Model model,
			@RequestParam(value="id")String id){
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard = sqlSession.getMapper(NoticeBoardDao.class).get(id);
		
		model.addAttribute("list", noticeBoard);
		
		return "noticeboard.notice-edit";
	}
	
	@RequestMapping("notice-delete")
	public String Delete(
			@RequestParam(value="id")String id){
		
		noticeBoardDao.delete(id);
		
		System.out.println("del?!");
		
		return "redirect:noticeboard";
	}
	
	@RequestMapping(value = "notice-update", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String updateNotice(
			NoticeBoard noticeBoard,
			NoticeFile noticeFile,
			@RequestParam(value="file", defaultValue="null") MultipartFile file,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="contentSrc")String contentSrc,
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
		    
		    fullPath = "\\WiynPrj\\resource\\upload\\";
		    System.out.println(fullPath);
		    
		    noticeFile.setName(rename);
		    
		    noticeBoardFileDao.update(noticeFile);
		}
		
		return "redirect:notice-detail?c=" + id;
	}
}















