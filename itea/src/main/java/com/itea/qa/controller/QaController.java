package com.itea.qa.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
								 @RequestParam(value="field",required=false,defaultValue="all") String field,
								 HttpSession session,
			 					 ModelAndView mv
			) {
		
		System.out.println("Q&A게시판 입장");
		
		PageUtil pInfo;
		ArrayList<QaDTO> list;
		
		//선택된 필드가 있다면
		if(field.equals("all")) { //전체 질문 보기라면
			pInfo = qaSV.getPageInfo(nowPage);
			list = qaSV.getListView(pInfo);
			
		}else {
			if(field.equals("my")) { //내가 쓴 글 보기라면
				int mno=(Integer) session.getAttribute("MNO");
				pInfo = qaSV.getmyPageInfo(nowPage,mno);
				list = qaSV.getmyListView(pInfo,mno);
				
			}else { //특정 유형의 질문을 보기라면
				pInfo = qaSV.getfieldPageInfo(nowPage,field);
				list = qaSV.getListView(pInfo,field);
			}
		}
		
		

		mv.addObject("LIST", list);//실제조회목록
		mv.addObject("PINFO",pInfo);//페이징관련 정보
		mv.addObject("field",field);//페이징관련 정보
		
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
	
	//질문삭제
	@RequestMapping("qa/qDelete")
	public ModelAndView qDelete(@RequestParam("qno") int qno,@RequestParam("nowPage") int page,ModelAndView mv) {
		
		System.out.println("Q&A 질문 삭제하기");
		
		qaSV.deleteQuestion(qno);
		
		RedirectView rv = new RedirectView("../qa/qaFrm.co?nowPage="+page);
		
		mv.setView(rv);
		return mv;
		
	}
	
	//질문에 답변하기
	@RequestMapping("qa/aInsert")
	public ModelAndView aInsert(HttpServletRequest request,QaDTO qaDTO,@RequestParam("nowPage") int page, ModelAndView mv) {
		
		System.out.println("Q&A 질문 답변하기");
		
		System.out.println(qaDTO);
		qaSV.insertAnswer(qaDTO);
		
		RedirectView rv = new RedirectView("../qa/qaFrm.co?nowPage="+page);
		
		mv.setView(rv);
		return mv;
		
	}

}
