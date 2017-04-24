package com.wiyn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/siteboard/*")
public class SiteBoardController {
	
	
	@RequestMapping("site-reg")
	public String site(){
		
		return "siteboard.site-reg";		
	}
	
	
	@RequestMapping("site-detail")
	public String siteDetail(){
		
		return "siteboard.site-detail";
	}
		
}
