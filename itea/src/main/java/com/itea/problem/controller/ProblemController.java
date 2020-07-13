package com.itea.problem.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/problem")
public class ProblemController {
	
	@RequestMapping("/problemMain")
	public void problemMain() {
		
		System.out.println("문제 컨트롤러 진입");

	}
	@RequestMapping("/createProblem")
	public void createProblem() {
		
		System.out.println("문제 컨트롤러 진입");

	}
	@RequestMapping("/solveProblem")
	public void solveProblem() {
		
		System.out.println("문제 컨트롤러 진입");

	}
	
	@RequestMapping("/selectTest.co")
	public String selectTest(HttpServletRequest request) {
		
		System.out.println("문제 컨트롤러 진입");
		
		String qtype=request.getParameter("Qtype");
		
		if(qtype.equals("1")){
			return "problem/choiceProblem";
		}else if(qtype.equals("2")){
			return "problem/shortProblem";
		}else if(qtype.equals("3")){
			return "problem/essayProblem";
		}
		return "problem/createProblem";
	}
}
