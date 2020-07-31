package com.itea.itLab.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itea.itLab.service.ItLabService;

@Controller
@RequestMapping("/itLab")
public class itLabController {
	
	@Autowired
	ItLabService  iservice;
	
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
	
	@RequestMapping("/itTestResult")
	public  ModelAndView itTestResult(HttpServletRequest request, ModelAndView mv) {
		System.out.println("결과페이지 ");
		//1파라미터 받기
		String test = request.getParameter("str");
		System.out.println(test);
		//2비즈니스 로직 수행
		int result = iservice.checkResult(test);
		//3모델
		mv.addObject("RESULT",result );
		//4뷰
		mv.setViewName("/itLab/itTestResult");
		return mv;
	}
		
	}
	
