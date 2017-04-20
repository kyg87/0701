package com.wiyn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/siteBoard/*")
public class BoardController {
	
	
	@RequestMapping("MainBoard")
	public String MainBoard(){
		
		return "siteBoard.MainBoard";
		
		
	}
		
}
