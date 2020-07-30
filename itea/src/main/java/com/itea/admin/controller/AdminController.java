package com.itea.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.admin.service.AdminService;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;
import com.itea.util.Visitor;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminSV;
	
	@RequestMapping("/memberList")
	public String memberList(HttpServletRequest request, 
						  HttpServletResponse response,MemberDTO mdto,Visitor vo) throws Exception {
		ArrayList member=new ArrayList();//단위기간별 방문자 데이터를 담을 객체 생성(기간별 방문자 통계)
		member=adminSV.WeekMember(mdto);
		request.setAttribute("member", member);
		
		ArrayList visitors=new ArrayList();//단위기간별 방문자 데이터를 담을 객체 생성(기간별 방문자 통계)
		visitors=adminSV.WeekVisitor(vo);
		request.setAttribute("visitors", visitors);
		
		//------------------------------------------------------
		String column=request.getParameter("column");
		String value=request.getParameter("value");
		String nowPage=request.getParameter("nowPage");
		
		mdto.setColumn(column);
		mdto.setValue(value);
		
		PageUtil pinfo = null;
		int pageNo;
		
		if(column==null) {//검색 안했을 때
			if(nowPage==null) {//처음화면
				pageNo=1;
			}else {//페이지 눌렀을 때
				pageNo=Integer.parseInt(nowPage);
			}
			pinfo=adminSV.memberList(pageNo);
			
		}else {//검색 했을 때
			if(nowPage==null) {//처음화면
				pageNo=1;
			}else { //페이지 눌렀을 때
				pageNo=Integer.parseInt(nowPage);
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
		return "/admin/userManage";
	}
	
	
	//회원탈퇴
		@RequestMapping("deleteMember")
		public void delete(HttpServletRequest request,HttpServletResponse response) throws Exception {
			//1.파라미터 받기
			String mnick=(String)request.getParameter("userNick"); 
			String nowPage = request.getParameter("nowPage"); 
			System.out.println(mnick+"님 강제탈퇴완료");
			//2.비즈니스 로직 수행
			adminSV.deleteMember(mnick);
			//4.View
			response.sendRedirect("../admin/memberList.co");
		}
		
	
	
}
