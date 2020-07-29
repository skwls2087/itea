package com.itea.problem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itea.dto.ProblemDTO;
import com.itea.problem.service.ProblemService;

@Controller
@RequestMapping("/problem")
public class SolveProblemController {
	
	@Autowired
	ProblemService problemSV;
	
	//문제 풀기
	@RequestMapping("/selectForTest")
	public String problemMain(
			ProblemDTO pDTO,HttpServletResponse response,HttpServletRequest request,HttpSession session) 
					throws IOException {
		
		System.out.println("문제풀기페이지 첫화면 진입");
		
		//자격증,출제 유형및 종류 파라미터로 받기
		String ckind=request.getParameter("Ckind");
		String ctype=request.getParameter("Ctype");
		String qtype=request.getParameter("Qtype");
		//선택한 연도 목록 불러오기
		int[] qyear=pDTO.getPyearList();
		
		HashMap tinfo=new HashMap();
		tinfo.put("ckind", ckind); //자격증 종류
		tinfo.put("ctype", ctype); //자격증 유형
		tinfo.put("qtype", qtype); //출제유형
		tinfo.put("qyear", qyear); //출제년도
		
		//조건에 맞는 문제번호 리스트 작성 후 순서 섞기
		List<String> pnoList=problemSV.selectPnoList(tinfo);
		Collections.shuffle(pnoList);
		
		if(pnoList.isEmpty()) {
			System.out.println("문제가 없어유");
			
			 response.setContentType("text/html;charset=utf-8");
		     PrintWriter out = response.getWriter();

		      
			 out.println("<script>");
	         out.println("alert('선택한 조건에 해당되는 문제가 없습니다');");
	         //out.println("$(location).attr(\"href\",\"problemMain.co\");");
	         out.println("history.go(-2);");
	         out.println("</script>");
	         out.close();
	         System.out.println("아이디 x");
	         
	         response.sendRedirect("/problemMain.jsp");
			
			return "problem/problemMain";
		}
		
		//첫번째 문제의 상세정보 가져오기
		int pno=Integer.parseInt(pnoList.get(0));
		
		int size=problemLogic(pno,pnoList,request);
		
		request.setAttribute("total", size);
		request.setAttribute("solve", 0);
		
		return "problem/problemProc";

	}
	
	//다음 문제 클릭
	@RequestMapping("/nextProblem")
	public String nextProblem(HttpServletRequest request) {
		
		System.out.println("다음문제");
		
		String[] pnoList=request.getParameterValues("pnoList");
		int total=Integer.parseInt(request.getParameter("total"));
		
		System.out.println(pnoList);
		ArrayList<String> pnoArray = new ArrayList<>();

		for(String temp : pnoList){

			pnoArray.add(temp);

		}

		int pno=Integer.parseInt(pnoList[0]);
		
		int size=problemLogic(pno,pnoArray,request);
		
		int solve=total-size;
		
		request.setAttribute("total", total);
		request.setAttribute("solve", solve);
		
	return "problem/problemProc";
	}
	
	//pno에따른 리스트 검색하는 로직
	public int problemLogic(int pno,List<String> pnoList,HttpServletRequest request) {
		ProblemDTO problemInfo=problemSV.problemInfo(pno);
		
		//객관식일 때
		if(problemInfo.getPtype()==1) {
			
			//문제 선지 구하기
			List<Object> choice=problemSV.selectChoice(pno);
			
			String[] simpleArray = new String[4];
			String[] choicelist=choice.toArray(simpleArray);
			
			problemInfo.setChoice(choicelist);
			
			//문제 답 구하기
			String choiceCorrect=problemSV.selectChoiceCorrect(pno);
			problemInfo.setCorrect(choiceCorrect);
			
		}else{//주관식,객관식일 때
			
			//문제 답 구하기
			List<Object> Corrects=problemSV.selectCorrectList(pno);
			
			String[] simpleArray = new String[Corrects.size()];
			String[] CorrectList=Corrects.toArray(simpleArray);
			
			problemInfo.setCorrectList(CorrectList);
			
		}
		System.out.println(pnoList);
		
		pnoList.remove(0);
		request.setAttribute("pnoList", pnoList); //문제번호리스트 보내기
		request.setAttribute("problem", problemInfo); //1번 문제 보내기
		
		return pnoList.size();
	}
	
	//문제를 풀면 정답률에 반영하기
	@RequestMapping("/problemScore")
	@ResponseBody
	public void problemScore(int pno, int correct) {
		problemSV.problemCountUp(pno,correct);
	}
}
