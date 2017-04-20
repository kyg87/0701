package com.wiyn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@RequestMapping("AdminMain")
	public String AdminMain() {

		return "admin.AdminMain";
	}
	
}
