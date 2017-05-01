package com.wiyn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	@RequestMapping("free-reg")
	public String site(){
		
		return "freeboard.free-reg";		
	}
	
	
	@RequestMapping("free-detail")
	public String siteDetail(){
		
		return "freeboard.free-detail";
	}
}
