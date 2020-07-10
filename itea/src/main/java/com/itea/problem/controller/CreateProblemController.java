package com.itea.problem.controller;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itea.dto.ProblemDTO;
import com.itea.problem.service.ProblemService;


@Controller
@RequestMapping("/problem")
public class CreateProblemController {
	
	@Autowired
	ProblemService problemSV;
	
	//객관식 문제 출제하기
	@RequestMapping("/choiceProblem")
	public void problemMain(ProblemDTO pDTO,HttpServletRequest request) throws FileNotFoundException {
		
		String path=request.getContextPath();
		System.out.println(path);
		
		String oriName = pDTO.getFile().getOriginalFilename();
		FileOutputStream fos = new FileOutputStream("d:/iteaFile/" + oriName);

		System.out.println(pDTO);

	}
}
