package com.wiyn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@RequestMapping("admin")
	public String admin() {

		return "admin.admin";
	}
	
}
