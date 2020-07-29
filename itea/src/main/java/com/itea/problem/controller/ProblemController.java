package com.itea.problem.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.itea.dto.licenseDTO;
import com.itea.problem.service.ProblemService;


@Controller
@RequestMapping("/problem")
public class ProblemController {
	
	@Autowired
	ProblemService problemSV;
	
	//문제풀이 메인화면
	@RequestMapping("/problemMain")
	public void problemMain() {
		
		System.out.println("문제 메인화면 진입");

	}
	//문제출제 : 자격증 선택 페이지
	@RequestMapping("/createProblem")
	public void createProblem(HttpServletRequest request) {
		
		System.out.println("문제 출제페이지 진입");
		
		//자격증 종류 보내기
		List<licenseDTO> ckind=problemSV.selectCkind();
		request.setAttribute("ckind", ckind);
	}
	//자격증 종류를 선택하면 그에맞는 유형을 리턴하기(ajax)
	@ResponseBody
	@RequestMapping("/testType")
	public Object testType(HttpServletRequest request) {
		
		System.out.println("출제유형 검색하기");
		
		int lno=Integer.parseInt(request.getParameter("lno"));
		
		//2.단일 시험이 아닌경우의 시험 유형 보내기
		List<Object> ctype=problemSV.selectLclass(lno);
		request.setAttribute("ctype", ctype);
		System.out.println("유형"+ctype);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(ctype.size()!=0) {
			
	        map.put("first", ctype.get(0));
	        map.put("second", ctype.get(1));
	        return map;
		}
		
		return map;
	}
	
	//자격증을 모두 선택한 수 
	@RequestMapping("/selectTest.co")
	public String selectTest(HttpServletRequest request) {
		
		System.out.println("자격증 선택 페이지");
		
		//시험종류와 유형을 파라미터로 받아 셋팅하기
		String ckind=request.getParameter("Ckind");
		String ctype=request.getParameter("Ctype");
		String qtype=request.getParameter("Qtype");
		String qyear=request.getParameter("Qyear");
		
		System.out.println(ckind+ctype+qtype+qyear);
		
		request.setAttribute("ptype", qtype);
		request.setAttribute("pyear", qyear);
		
		HashMap map = new HashMap();
		map.put("lno",    ckind);
		map.put("lqclass", ctype);

		int lqno=problemSV.selectLqno(map);
		
		request.setAttribute("lqno", lqno);
		
		//출제 유형에 맞는 폼 보여주기
		if(qtype.equals("1")){
			return "problem/choiceProblem";
		}else if(qtype.equals("2")){
			return "problem/shortProblem";
		}else if(qtype.equals("3")){
			return "problem/essayProblem";
		}
		return "problem/createProblem";
	}
	
	@RequestMapping("/solveProblem")
	public void solveProblem(HttpServletRequest request) {
		
		System.out.println("문제 풀기페이지 진입");
		
		//자격증 종류 보내기
		List<licenseDTO> ckind=problemSV.selectCkind();
		request.setAttribute("ckind", ckind);
		
	}
}
