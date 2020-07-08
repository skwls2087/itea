package com.itea.license.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.itea.dao.licenseDAO;
import com.itea.dto.licenseDTO;
import com.itea.license.service.LicenseService;




@Controller
public class LicenseListController {
	
	@Autowired
	LicenseService lService;
	licenseDAO lDao;
	//리스트 보여주기	
	@RequestMapping("/license/licenseList.co")
	public ModelAndView licenseList(ModelAndView mv ) {
		System.out.println("1.목록보기 요청-licenseList 진입");
		//1파라미터 받기
		
		//2비즈니스 로직 수행
		ArrayList<licenseDTO>list=lService.getLicenseList();
		//3모델
		mv.addObject("LIST",list );
		//4뷰
		mv.setViewName("/license/licenseList");
		return mv;
		
	}
	//게시판 등록폼보기
	@RequestMapping("/license/licenseInsert.co")
	public void licenseInsert () {
		System.out.println("등록폼보기 진입/");
		
	}
	
	//글쓰기처리
	@RequestMapping("/license/insertProc.co")
	public ModelAndView insertProc(licenseDTO lDto,ModelAndView mv) {
		System.out.println("글쓰기처리-insertProc진입");
		System.out.println("lDto"+lDto);
		lService.insertProc(lDto);
		RedirectView rv = new RedirectView("../license/licenseList.co");
		mv.setView(rv);
		return mv;
	}
		
	//게시판 상세보기
	@RequestMapping("/license/detailView.co")
	public ModelAndView detailView(HttpServletRequest request,
						ModelAndView mv) {
		System.out.println("상세보기 요정함수 detailView()진입");
		//1. 파라미터 받기
		int lno = Integer.parseInt(request.getParameter("lno"));
		//2. 비즈니스 로직 수행
		licenseDTO lDto = lService.detailView(lno);
		mv.addObject("LDTO",lDto);
		mv.setViewName("/license/detailView");
		return mv;
	}
		
	//게시판 게시판 수정 폼보기
	@RequestMapping("/license/licenseModify.co")
	public String licenseModify (HttpServletRequest request) {
		System.out.println("수정하기 요청함수 진입");
		//1.파라미터 받기
		int lno = Integer.parseInt(request.getParameter("lno"));
		//2.비즈니스 로직 수행
		licenseDTO lDto = lService.modifyInfo(lno);
		//3.모델
		request.setAttribute("lDto", lDto);
		//4.뷰
		return "license/licenseModify";
	}
	
	@RequestMapping("/license/modify.co")
	public ModelAndView modify(HttpSession session,HttpServletRequest request,
			ModelAndView mv,licenseDTO lDto) {
		System.out.println("수정 정보바꾸기 폼 진입"+lDto);
		//1.파라미터 받기
		int lno = Integer.parseInt(request.getParameter("lno"));
		//2.비즈니스 로직 수행
		lService.modify(lDto);
		//3.모델//4.뷰
		RedirectView rv = new RedirectView("../license/licenseList.co");
		mv.setView(rv);	
		return mv;
	}
	
	//게시판 삭제
	@RequestMapping("/license/licenseDelete.co")
	public ModelAndView licenseDelete(HttpServletRequest request,HttpSession session,ModelAndView mv,licenseDTO lDto) {
		System.out.println("삭제하기");
		//1.파라미터 받기
		int lno = Integer.parseInt(request.getParameter("lno"));
		//2.비즈니스 로직 수행
		lService.delete(lno);
		//3.
		session.invalidate();
		//3.모델//4.뷰
		RedirectView rv = new RedirectView("../license/licenseList.co");
		mv.setView(rv);	
		return mv;
	}
	
	
}

