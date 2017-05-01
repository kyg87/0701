package com.wiyn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/requestboard/*")
public class RequestBoardController {
	@RequestMapping("request-reg")
	public String site(){
		
		return "requestboard.request-reg";		
	}
	
	
	@RequestMapping("request-detail")
	public String siteDetail(){
		
		return "requestboard.request-detail";
	}
}
