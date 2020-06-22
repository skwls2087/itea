package com.itea.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//메인화면
	@RequestMapping("/")
	public String loginFrm() {
		
		return "index";
	}
	
}
