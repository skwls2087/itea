package com.itea.qa.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.itea.dto.QaDTO;
import com.itea.qa.service.QaService;
import com.itea.util.PageUtil;

@Controller
public class QaController {
	
	@Autowired
	QaService qaSV;
	
	//qa게시판 폼 & 리스트 보여주기
	@RequestMapping("qa/qaFrm")
	public ModelAndView listView(@RequestParam(value="nowPage",
			 							required=false,
			 							defaultValue="1")  int  nowPage,
			 					ModelAndView mv
			) {
		
		System.out.println("Q&A게시판 입장");
		
		PageUtil pInfo = qaSV.getPageInfo(nowPage);
		ArrayList<QaDTO> list = qaSV.getListView(pInfo);
		
		System.out.println(pInfo);
		System.out.println(list);
		
		mv.addObject("LIST", list);//실제조회목록
		mv.addObject("PINFO",pInfo);//페이징관련 정보
		
		mv.setViewName("qa/qaFrm");
		
		return mv;
	}
	
	//질문등록
	@RequestMapping("qa/qInsert")
	public ModelAndView qInsert(QaDTO qaDTO,HttpSession session,ModelAndView mv) {
		
		System.out.println("Q&A 질문 등록하기");
		
		int mno=(Integer) session.getAttribute("MNO");
		qaDTO.setMno(mno);
		System.out.println(qaDTO);
		
		qaSV.insertQuestion(qaDTO);
		
		RedirectView rv = new RedirectView("../qa/qaFrm.co");
		
		mv.setView(rv);
		return mv;
	}

}
