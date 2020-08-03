package com.itea.problem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itea.problem.service.ProblemService;

@Controller
@RequestMapping("/problem")
public class CorrectProblemController {
	
	@Autowired
	ProblemService problemSV;
	
	//주관식 채점하기
	@RequestMapping("/problemShortScore")
	@ResponseBody
	public int problemShortScore(int pno, String correct) {
		System.out.println(pno+correct);
		
		//해당 pno에 맞는 정답리스트 받아오기
		List<String> clist=problemSV.selectPnoCorrects(pno);
		System.out.println("정답리스트는="+clist);
		
		int iscorrect=0;
		for(String list:clist) {
			if(list.equals(correct)) iscorrect++;
			System.out.println(list);
		}
		System.out.println("정답인 개수는="+iscorrect);
		
		return iscorrect;
		
	}
	//서술형 채점하기
	@RequestMapping("/problemEssayScore")
	@ResponseBody
	public int problemEssayScore(int pno, String correct) {
		System.out.println(pno+correct);
		
		//해당 pno에 맞는 정답리스트 받아오기
		List<String> clist=problemSV.selectPnoCorrects(pno);
		
		int iscorrect=0;
		for(String list:clist) {

			if(correct.contains(list)) {
				iscorrect++;
			}
		}
		
		if(clist.size()==iscorrect) {return 1;}
		else {return 0;}
		
	}

}
