package com.itea.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.admin.service.AdminService;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminSV;
	
	
	@RequestMapping("/memberList")
	public String memberList(HttpServletRequest request, 
						  HttpServletResponse response,MemberDTO mdto) throws Exception {
		
		String column=request.getParameter("column");
		String value=request.getParameter("value");
		String nowPage=request.getParameter("nowPage");
		System.out.println("controller1 "+column+"/"+value+"/"+nowPage);
		
		mdto.setColumn(column);
		mdto.setValue(value);
		
		PageUtil pinfo = null;
		int pageNo;
		
		if(column==null) {//검색 안했을 때
			System.out.println("전체회원출력-검색어 없음");
			if(nowPage==null) {//처음화면
				pageNo=1;
			}else {//페이지 눌렀을 때
				pageNo=Integer.parseInt(nowPage);
				System.out.println("관리자페이지-회원목록 "+pageNo+"페이지");
			}
			pinfo=adminSV.memberList(pageNo);
			
		}else {//검색 했을 때
			System.out.print("검색된 회원출력:");
			if(nowPage==null) {//처음화면
				pageNo=1;
			}else { //페이지 눌렀을 때
				pageNo=Integer.parseInt(nowPage);
				System.out.println("관리자페이지-회원목록 "+pageNo+"페이지");
			}
			
			if(column.equals("mnick")) {
				pinfo=adminSV.memberSearchMnick(pageNo,mdto);
				System.out.println(column+"에 "+value+"가 포함되는 회원 출력");
			}else if(column.equals("mmail")) {
				pinfo=adminSV.memberSearchMmail(pageNo,mdto);
				System.out.println(column+"에 "+value+"가 포함되는 회원 출력");
			}
		}
		request.setAttribute("column",column);
		request.setAttribute("value",value);
		request.setAttribute("PINFO",pinfo);
		System.out.println("controller2 "+pinfo);
		return "/admin/userManage";
	}
	
	
	
	//회원탈퇴
		@RequestMapping("deleteMember")
		public String delete(HttpServletRequest request) throws Exception {
			//1.파라미터 받기
			String mnick=(String)request.getParameter("userNick"); 
			System.out.println(mnick+"님 강제탈퇴완료");
			//2.비즈니스 로직 수행
			adminSV.deleteMember(mnick);
			//4.View
			return "../../index";
		}
		
	
	
}
