package com.itea.problem.controller;

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

}
