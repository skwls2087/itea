package com.itea.itLab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/itLab")
public class itLabController {
	
	@RequestMapping("/itLab")
	public void itLabMain() {
		
		System.out.println("it연구소 진입");

	}
	@RequestMapping("/itTest")
	public void  itTest(){
		System.out.println("itTest 진입");
		
	}
	@RequestMapping("/itTestDetail")
	public void  itTestDetail(){
		System.out.println("itTestDetail 진입");
	}
}
