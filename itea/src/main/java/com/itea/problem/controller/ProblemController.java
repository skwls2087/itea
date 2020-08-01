package com.itea.problem.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itea.dto.ProblemDTO;
import com.itea.dto.licenseDTO;
import com.itea.problem.service.ProblemService;
import com.itea.util.FileUtil;
import com.itea.util.PageUtil;

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

	//문제 유형 고르기
	@RequestMapping("/selectProblem")
	public void selectProblem(HttpServletRequest request) {
		
	}
	
	//문제출제 : 자격증 선택 페이지
	@RequestMapping("/createProblem")
	public void createProblem(HttpServletRequest request) {
		
		System.out.println("문제 출제페이지 진입");
		
		//자격증 종류 보내기
		List<licenseDTO> ckind=problemSV.selectCkind();
		request.setAttribute("ckind", ckind);
	}
	
	/*//자격증 종류를 선택하면 그에맞는 유형을 리턴하기(ajax)
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
	}*/
	
	//자격증을 모두 선택한 경우 로직 
	@RequestMapping("/selectTest.co")
	public String selectTest(HttpServletRequest request) {
		
		System.out.println("자격증 선택 페이지");
		
		//시험종류와 유형을 파라미터로 받아 셋팅하기
		String lqno=request.getParameter("lqno");
		String qtype=request.getParameter("Qtype");
		String qyear=request.getParameter("Qyear");
		
		System.out.println(lqno+qtype+qyear);
		
		request.setAttribute("ptype", qtype);
		request.setAttribute("pyear", qyear);
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
	
	//내가 출제한 문제 리스트
	@RequestMapping("/myProblemList")
	public ModelAndView myProblemList(
			@RequestParam(value="nowPage",required=false, defaultValue="1") int nowPage,
			@RequestParam(value="lqno",required=false, defaultValue="0") int selectKind, 
			@RequestParam(value="search",required=false, defaultValue="") String search,
			@RequestParam(value="scontent",required=false, defaultValue="") String scontent,
			HttpServletRequest request,HttpSession session,ModelAndView mv) {
		
		System.out.println("내가 낸 문제 list 진입"+":페이지"+nowPage+":선택한자격증"+selectKind+":검색부분"+search+":검색내용"+scontent);
		
		//자격증 종류 보내기
		List<licenseDTO> ckind=problemSV.selectCkind();
		request.setAttribute("ckind", ckind);
		
		//내가 선택한 자격증 저장
		request.setAttribute("lqno", selectKind);
		request.setAttribute("search", search);
		request.setAttribute("scontent", scontent);

		PageUtil pInfo;

		//회원 닉네임 받기
		int mno=(Integer) session.getAttribute("MNO");
		
		ArrayList<ProblemDTO> list;
		
		HashMap cert = new HashMap();
		cert.put("mno", mno);
		cert.put("selectKind", selectKind);
		cert.put("search", search);
		cert.put("scontent", scontent);
		
		//내가 낸 문제  찾아온다는 표시하기
		cert.put("type", "my");
		
		pInfo = problemSV.getPageInfo(nowPage,cert);
		list= problemSV.myProblemList(pInfo,cert);
		
		mv.addObject("PINFO",pInfo);//페이징관련 정보
		mv.addObject("LIST",list);
		mv.setViewName("problem/myProblemList");
		
		return mv;
	}
	
	//즐겨찾기한 문제
	@RequestMapping("/scrapProblemList")
	public ModelAndView scrapProblemList(
			@RequestParam(value="nowPage",required=false, defaultValue="1") int nowPage,
			@RequestParam(value="lqno",required=false, defaultValue="0") int selectKind, 
			@RequestParam(value="search",required=false, defaultValue="") String search,
			@RequestParam(value="scontent",required=false, defaultValue="") String scontent,
			HttpServletRequest request,HttpSession session,ModelAndView mv) {
		
		System.out.println("즐겨찾기한 문제 list 진입"+":페이지"+nowPage+":선택한자격증"+selectKind+":검색부분"+search+":검색내용"+scontent);
		
		//자격증 종류 보내기
		List<licenseDTO> ckind=problemSV.selectCkind();
		request.setAttribute("ckind", ckind);
		
		//내가 선택한 자격증 저장
		request.setAttribute("lqno", selectKind);
		request.setAttribute("search", search);
		request.setAttribute("scontent", scontent);
		
		PageUtil pInfo;
		
		//회원 닉네임 받기
		int mno=(Integer) session.getAttribute("MNO");
		
		ArrayList<ProblemDTO> list;
		
		HashMap cert = new HashMap();
		cert.put("mno", mno);
		cert.put("selectKind", selectKind);
		cert.put("search", search);
		cert.put("scontent", scontent);
		
		//즐겨찾기문제  찾아온다는 표시하기
		cert.put("type", "scrap");
		
		pInfo = problemSV.getPageInfo(nowPage,cert);
		list= problemSV.myProblemList(pInfo,cert);
		
		mv.addObject("PINFO",pInfo);//페이징관련 정보
		mv.addObject("LIST",list);
		mv.setViewName("problem/scrapProblemList");
		
		return mv;
	}
	
	//문제 삭제하기
	@RequestMapping("/problemDelete")
	public String problemDelete(int pno,ModelAndView mv,RedirectAttributes redirect,
			@RequestParam(value="nowPage",required=false, defaultValue="1") int nowPage,
			@RequestParam(value="lqno",required=false, defaultValue="0") int selectKind, 
			@RequestParam(value="search",required=false, defaultValue="") String search,
			@RequestParam(value="scontent",required=false, defaultValue="") String scontent) {
		
		problemSV.deleteProblem(pno);
		
		System.out.println("문제삭제"+":페이지"+nowPage+":선택한자격증"+selectKind+":검색부분"+search+":검색내용"+scontent);
		
		redirect.addAttribute("nowPage", nowPage);
		redirect.addAttribute("lqno", selectKind);
		redirect.addAttribute("search", search);
		redirect.addAttribute("scontent", scontent);
		
		return "redirect:myProblemList.co";
	}
	
	//문제 수정하기
	@RequestMapping("/problemModify")
	public String problemModify(int pno,HttpServletRequest request) {
		
		ProblemDTO problemInfo=problemSV.problemInfo(pno);
		
		System.out.println(problemInfo);
		request.setAttribute("pinfo", problemInfo);
		
		if(problemInfo.getPtype()==1) {
			return "problem/choiceProblemModify";
		}else if(problemInfo.getPtype()==2) {
			return "problem/shortProblemModify";
		}else {
			return "problem/essayProblemModify";
		}
	}
}
