package com.itea.member.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.itea.dto.MemberDTO;
import com.itea.member.service.ModifyService;


@Controller
public class ModifyController {

	@Autowired
	ModifyService modifySV;
	
	//정보수정 폼 보여주기
	@RequestMapping("member/modifyFrm")
	public String modifyFrm(HttpServletRequest request, HttpSession session) {
	System.out.println("폼보기 진입");	
	//1.파라미터 받기
	int mno= (Integer) session.getAttribute("MNO");
	//2.비즈니스로직수행
	MemberDTO mDto = modifySV.modifyInfo(mno);
	String[] mphone = mDto.getMphone().split("-");
	
	//3.Model
	request.setAttribute("mDto", mDto);
	request.setAttribute("mphone", mphone);
	//4.View
	return "member/modifyFrm";
	}
	
	
//	//정보수정 로직 수행
	@RequestMapping("member/modify")
	public ModelAndView modify(HttpSession session,
			ModelAndView mv,
			MemberDTO mDto,@DateTimeFormat(pattern="yyyy-MM-dd") Date mnickdate
			) {
		System.out.println("정보수정함수 진입");
		//1.파라미터 받기  mno=회원번호,
		int mno= (Integer) session.getAttribute("MNO");
		//Date mnickdate=(Date) session.getAttribute("mnickdate");
		//System.out.println("회원번호"+mDto.getMno());
		//SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	/*	String mnickdate=sdf.format(mnickdate);*/

		//		//2.비즈니스 로직수행
			modifySV.modify(mDto);
			
//		//3.Model
			session.setAttribute("MNICK",mDto.getMnick() );
//		//4.View
			RedirectView rv = new RedirectView("../index.jsp");
			mv.setView(rv);	
			return mv;
		//	}
	}
	
	//닉네임 다른사람이 사용중인지 체크
    @RequestMapping("member/checkmyNick")
    @ResponseBody
	public int checkNick(HttpServletRequest request,HttpSession session) throws Exception {
		
    	MemberDTO mDto=new MemberDTO(); 
    	
    	String mnick=request.getParameter("nick");
    	int mno=(Integer) session.getAttribute("MNO");
    	
    	mDto.setMno(mno);
    	mDto.setMnick(mnick);
    	
		int isNick=modifySV.checkNick(mDto);
		
		if(isNick==0) {//같은 닉네임이 없을 때
			
			return 0;
		}else {//같은 닉네임이 있을 때
			
			return 1;
		}
    }
	
	//회원탈퇴
	@RequestMapping("member/delete")
	public String delete(HttpServletRequest request,HttpSession session) {
		int mno= (Integer) session.getAttribute("MNO");
		System.out.println("회원탈퇴함수 진입"+mno);
		//1.파라미터 받기
		
		//2.비즈니스 로직 수행
		modifySV.delete(mno);
		//3.Model
	
		session.invalidate();
		//4.View
		return "../../index";
	}
}
