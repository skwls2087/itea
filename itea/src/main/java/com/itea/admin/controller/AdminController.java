package com.itea.admin.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.admin.service.AdminService;
import com.itea.dao.adminDAO;
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
		ArrayList member=new ArrayList();//단위기간별 방문자 데이터를 담을 객체 생성(기간별 방문자 통계)
		member=adminSV.WeekMember(mdto);
		/*HashMap map= new HashMap();
		map=(HashMap)adminSV.WeekMemberMap(mdto);
		
		System.out.println("con map "+map);
		request.setAttribute("map",map);*/
		System.out.println("con member "+member);
		request.setAttribute("member", member);
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
