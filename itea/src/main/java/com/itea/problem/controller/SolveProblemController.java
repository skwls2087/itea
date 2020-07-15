package com.itea.problem.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itea.dto.ProblemDTO;
import com.itea.problem.service.ProblemService;

@Controller
@RequestMapping("/problem")
public class SolveProblemController {
	
	@Autowired
	ProblemService problemSV;
	
	//문제 풀기
	@RequestMapping("/selectForTest")
	public String problemMain(ProblemDTO pDTO,HttpServletRequest request,HttpSession session) {
		
		System.out.println("문제풀기페이지 진입");

		String ckind=request.getParameter("Ckind");
		String ctype=request.getParameter("Ctype");
		String qtype=request.getParameter("Qtype");
		int[] qyear=pDTO.getPyearList();
		
		HashMap tinfo=new HashMap();
		tinfo.put("ckind", ckind);
		tinfo.put("ctype", ctype);
		tinfo.put("qtype", qtype);
		tinfo.put("qyear", qyear);
		
		List<ProblemDTO> problem=problemSV.selectProblem(tinfo);
		System.out.println(problem);
		
		return "";
	}
}
