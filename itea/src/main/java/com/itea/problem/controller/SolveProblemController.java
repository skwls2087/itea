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
		
		List<ProblemDTO> probleminfo=problemSV.selectProblem(tinfo);
		List<ProblemDTO> problemList = new ArrayList<ProblemDTO>();

		for(ProblemDTO problem:probleminfo) {
			int pno=problem.getPno();
			//객관식일 때
			if(problem.getPtype()==1) {
				
				//문제 선지 구하기
				List<HashMap> choice=problemSV.selectChoice(pno);
	
				List<String> list=new ArrayList<String>();
				for(HashMap map:choice) {
					list.add((String) map.get("pccontent"));
				}
				
				String[] simpleArray = new String[4];
				String[] choicelist=list.toArray(simpleArray);
				
				problem.setChoice(choicelist);
				
				//문제 답 구하기
				String choiceCorrect=problemSV.selectChoiceCorrect(pno);
				
				problem.setCorrect(choiceCorrect);
			}else{//주관식,객관식일 때
				
				//문제 답 구하기
				List<HashMap> Corrects=problemSV.selectCorrectList(pno);
				List<String> list=new ArrayList<String>();
				
				for(HashMap map:Corrects) {
					list.add((String) map.get("lcor"));
				}
				
				String[] simpleArray = new String[Corrects.size()];
				String[] CorrectList=list.toArray(simpleArray);
				
				problem.setCorrectList(CorrectList);
				
			}
			
			
			problemList.add(problem);
			System.out.println(problemList);
		}

		request.setAttribute("problemList", problemList);
		
		return "problem/problemProc";
	}
}
