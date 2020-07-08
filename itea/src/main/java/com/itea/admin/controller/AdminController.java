package com.itea.admin.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itea.admin.service.AdminService;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminSV;
	
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
		
		}
	
	//관리자 비번 확인
	@RequestMapping("checkAdminPw.co")
	public String checkAdminPw
	
	""/admin/checkAdminPw";
	
	
	
	//회원탈퇴
	@RequestMapping("/deleteMember")
	public String delete(HttpServletRequest request,HttpSession session) {
		int mno= (Integer) session.getAttribute("MNO");
		System.out.println("회원탈퇴함수 진입"+mno);
		//1.파라미터 받기
		String nick=(String) request.getAttribute("userNick"); //해당 회원 id를 파라미터로 받음
		userDeleteService.service(nick); //회원 id를 가지고 서비스 진행
		
		//2.비즈니스 로직 수행
		modifySV.delete(mno);
		//3.Model
	
		session.invalidate();
		//4.View
		return "admin/userManage";
	}
	
}
