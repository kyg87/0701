package com.wiyn.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;

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
	private NoticeFile noticeFile;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("noticeboard")
	public String site(Model model){
		
		List<NoticeBoard> list = sqlSession.getMapper(NoticeBoardDao.class).getList();
		model.addAttribute("list", list);
		
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
		
		model.addAttribute("list", noticeBoard);
		
		noticeBoardDao.updateViewCnt(id);
		
		return "noticeboard.notice-detail";
	}
	
	@RequestMapping(value="noticeBoard-reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String sited(
			NoticeBoard noticeBoard,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="memberId")String memberId,
			@RequestParam(value="contentSrc")String contentSrc,
			@RequestParam(value = "file") List<MultipartFile> file
			)throws IOException{
		
		String path = context.getRealPath("/resource/upload");
		
		File d = new File(path);
		if(!d.exists())//경로가 존재하지 않는다면
			d.mkdir();
	
		byte[] buf = new byte[1024];
					
		for(MultipartFile fi : file){
			if(!fi.isEmpty()){
				String fileName = fi.getOriginalFilename();
				InputStream fis = fi.getInputStream();
				OutputStream fos = new FileOutputStream(path+File.separator+fileName);
				
				int len = 0; 
				
				while((len = fis.read(buf)) > 0)
					fos.write(buf, 0, len);
				
				fis.close();
				fos.close();
			}
		}
		
						
		noticeBoard.setTitle(title);
		noticeBoard.setContent(content);
		noticeBoard.setMemberId(memberId);
		noticeBoard.setContentSrc(contentSrc);
		
		noticeBoardDao.add(noticeBoard);
		
		for(MultipartFile fi : file){
			if(!fi.isEmpty()){
				String fileName = fi.getOriginalFilename();
				NoticeFile f = new NoticeFile();
				f.setNoticeId(noticeBoardDao.lastCode());
				f.setSrc(fileName);
				noticeBoardFileDao.add(f);
			}
		}
		
		return "redirect:notice-detail?c=" + noticeBoard.getId();
		
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
		
		return "redirect:noticeboard";
	}
	
	@RequestMapping(value = "notice-update", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String updateNotice(NoticeBoard noticeBoard,
			@RequestParam(value="title")String title, 
			@RequestParam(value="content")String content,
			@RequestParam(value="contentSrc")String contentSrc,
			@RequestParam(value="id")String id){
		
		noticeBoard.setTitle(title);
		noticeBoard.setContent(content);
		noticeBoard.setContentSrc(contentSrc);
		
		noticeBoardDao.update(noticeBoard);
		
		return "redirect:notice-detail?c=" + id;
	}
}















