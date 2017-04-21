package com.wiyn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/siteboard/*")
public class SiteBoardController {
	
	
	@RequestMapping("sitemain")
	public String site(){
		
		return "siteboard.sitemain";		
	}
	
	
	@RequestMapping("site-detail")
	public String siteDetail(){
		
		return "siteboard.siteboard-detail";
	}
		
}
