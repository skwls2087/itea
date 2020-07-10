package com.itea.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.admin.service.AdminService;
import com.itea.util.PageUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminSV;
	
	@RequestMapping("/memberList")
	public String memberList(HttpServletRequest request, 
						  HttpServletResponse response) throws Exception {
		
		String column=request.getParameter("search");
		String value=request.getParameter("user-inform");
		String page=request.getParameter("nowPage");
		
		PageUtil pinfo;
		int pageNo;
		
		if(column==null) {//검색 안했을 때
			System.out.println("전체회원출력-검색어 없음");
			if(page==null) {//처음화면
				pageNo=1;
			}else {//페이지 눌렀을 때
				pageNo=Integer.parseInt(page);
				System.out.println("관리자페이지-회원목록 "+pageNo+"페이지");
			}
			pinfo=adminSV.memberList(pageNo);
			
		}else {//검색 했을 때
			System.out.print("검색된 회원출력:");
			if(page==null) {//처음화면
				pageNo=1;
			}else { //페이지 눌렀을 때
				pageNo=Integer.parseInt(page);
				System.out.println("관리자페이지-회원목록 "+pageNo+"페이지");
			}
			pinfo=adminSV.memberSearch(pageNo,column,value);
			System.out.println(column+"에 "+value+"가 포함되는 회원 출력");
		}
		request.setAttribute("PINFO",pinfo);
		System.out.println(pinfo);
		return "/admin/userManage";
	}
	
	/*
	//회원목록
	@RequestMapping("/memberList")
	public ModelAndView memberList(@RequestParam(value="nowPage",required=false,
	defaultValue="1")  int  nowPage, ModelAndView mv) throws Exception{
		
		//1.파라미터받기 nowPage=
		//2.비즈니스로직	
		//	2-1) 페이징관련 정보준비
		PageUtil pInfo = adminSV.getPageInfo(nowPage);
		
		//	2-2) 해당 페이지에 출력할 목록조회
		ArrayList<MemberDTO> list = adminSV.memberList(pInfo);
		
		//3.Model
		mv.addObject("LIST", list);//실제조회목록
		mv.addObject("PINFO",pInfo);//페이징관련 정보
		
		//4.View
		mv.setViewName("/admin/userManage");
		return mv;
	}
	
	//회원 검색
	@RequestMapping("/memberSearch")
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String column=request.getParameter("search");
		String value=request.getParameter("user-inform");
		String page=request.getParameter("nowPage");
		
		PageUtil pInfo;
		int pageNo;
		
		if(page==null) {//처음화면
			pageNo=1;
		}else { //페이지 눌렀을 때
			pageNo=Integer.parseInt(page);
			System.out.println("관리자페이지-회원목록 "+pageNo+"페이지");
		}
		pInfo=adminSV.memberSearch(pageNo,column,value);
		System.out.println(column+"에 "+value+"가 포함되는 회원 출력");
		System.out.println(pageNo);
		
		request.setAttribute("PINFO",pInfo);
		//페이지에서 출력할 공지사항 객체 arrayList를 request속성에 담아보내기
		//<1번회원객체,2번회원객체.....>
		return "admin/userManage";
		
		}*/
	
	//관리자 비번 확인
	@RequestMapping("/checkAdminPw.co")
	public String checkAdminPw(HttpServletRequest request, 
			  HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		String mnick=(String) session.getAttribute("MNICK");
		String mpw=request.getParameter("adminPw");
		
		if(mpw==null) {//처음 비밀번호 입력 화면에 들어왔을 때 form만 출력
			return "admin/checkAdminPw";
		}
		System.out.print(mnick+"님이 입력한 비밀번호는 "+mpw+"입니다-");
		
		String pwCheck=adminSV.checkAdminPw(mpw);
		System.out.println("비밀번호가 일치하는가?"+pwCheck);
		
		if(pwCheck.equals(mpw)) {//비밀번호가 맞으면 이 페이지를 부른 각 페이지로 리턴
			String service=request.getParameter("service");
			String memberNick=request.getParameter("mnick");
			request.setAttribute("mnick",mnick);
			return "admin/deleteMember"; //회원을 삭제하는 로직 수행
		}else {//비밀번호가 다르면 에러메시지를 가지고 비밀번호 입력 폼으로 이동
			String error="비밀번호를 다시 입력하세요";
			request.setAttribute("error", error);
		}
		return "/admin/userManage";
	}
	
	//회원탈퇴
	@RequestMapping("/deleteMember")
	public String deleteMember(HttpServletRequest request,HttpSession session) throws Exception {
		int mno= (Integer) session.getAttribute("MNO");
		System.out.println("회원탈퇴함수 진입"+mno);
		
		//1.파라미터 받기
		String mnick=(String) request.getAttribute("mnick");
		//2.비즈니스 로직 수행
		adminSV.deleteMember(mnick);
		//3.Model
		session.invalidate();
		//4.View
		return "/admin/deleteMember";
	}
	
	
}
