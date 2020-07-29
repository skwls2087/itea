package com.itea.itLab.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.dto.licenseDTO;

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
	
	@RequestMapping("/itTestResult")
	public  void itTestResult() {
		System.out.println("결과페이지 ");
		//1파라미터 받기
		
		//2비즈니스 로직 수행
//		ArrayList<licenseDTO>list=lService.getLicenseList();
//		//3모델
//		mv.addObject("LIST",list );
//		//4뷰
//		mv.setViewName("/license/licenseList");
//		return mv;
//		
		
	}
}
