package com.wiyn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/noticeboard/*")
public class NoticeBoardController {
	@RequestMapping("notice-reg")
	public String site(){
		
		return "noticeboard.notice-reg";		
	}
	
	
	@RequestMapping("notice-detail")
	public String siteDetail(){
		
		return "noticeboard.notice-detail";
	}
}
