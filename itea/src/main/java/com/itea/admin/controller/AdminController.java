package com.itea.admin.controller;


import java.util.ArrayList;

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
	
	
//	//회원탈퇴
//	@RequestMapping("member/delete")
//	public String delete(HttpServletRequest request,HttpSession session) {
//		int mno= (Integer) session.getAttribute("MNO");
//		System.out.println("회원탈퇴함수 진입"+mno);
//		//1.파라미터 받기
//		
//		//2.비즈니스 로직 수행
//		modifySV.delete(mno);
//		//3.Model
//	
//		session.invalidate();
//		//4.View
//		return "../../index";
//	}
}
