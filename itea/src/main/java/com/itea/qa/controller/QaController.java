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
@RequestMapping("/qa")
public class QaController {
	
	@Autowired
	QaService qaSV;
	
	//qa게시판 폼 & 리스트 보여주기
	@RequestMapping("/qaFrm")
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
		
		System.out.println(pInfo);
		
		mv.addObject("LIST", list);//실제조회목록
		mv.addObject("PINFO",pInfo);//페이징관련 정보
		mv.addObject("field",field);//검색관련 정보
		
		mv.setViewName("qa/qaFrm");
		
		return mv;
	}
	
	//질문등록
	@RequestMapping("/qInsert")
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
	@RequestMapping("/qDelete")
	public ModelAndView qDelete(@RequestParam("qno") int qno,ModelAndView mv,
			@RequestParam("nowPage") int page,
			@RequestParam("pageGroup") int pageGroup,
			@RequestParam("totalCount") int totalCount,
			@RequestParam(value="field",required=false,defaultValue="all") String field) {
		
		System.out.println("Q&A 질문 삭제하기");
		
		qaSV.deleteQuestion(qno);
		
		System.out.println((totalCount%pageGroup));
		
		if((totalCount%pageGroup)==1) {
			if(page!=1) {
				page=page-1;
			}
		}
		
		RedirectView rv = new RedirectView("../qa/qaFrm.co?nowPage="+page+"&field="+field);
		
		mv.setView(rv);
		return mv;
		
	}
	
	//질문에 답변하기
	@RequestMapping("/aInsert")
	public ModelAndView aInsert(HttpServletRequest request,QaDTO qaDTO,ModelAndView mv,
			@RequestParam("nowPage") int page,
			@RequestParam(value="field",required=false,defaultValue="all") String field) {
		
		System.out.println("Q&A 질문 답변하기");
		
		System.out.println(qaDTO);
		qaSV.insertAnswer(qaDTO);
		
		RedirectView rv = new RedirectView("../qa/qaFrm.co?nowPage="+page+"&field="+field);
		
		mv.setView(rv);
		return mv;
		
	}
	
	//조회수 증가
	@RequestMapping("/cntUpdate")
	public ModelAndView cntUpdate(
			HttpServletRequest request,
			HttpSession session,
			ModelAndView mv) {
		System.out.println("조회수증가요청함수 cntUpdate()진입");
		
		//1.파라미터받기
		int bno  =  Integer.parseInt(request.getParameter("bno"));//글번호
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));//보고싶은페이지(릴레이용)
		
		System.out.println(bno);
		System.out.println(nowPage);
		
		//3.Model
		mv.addObject("nowPage",nowPage);//보고싶은페이지(릴레이용)
		mv.addObject("bno",bno); //글번호
		
		//4.View  리다이렉트용뷰	: 상세보기
		RedirectView rv = new RedirectView("../qa/detailView.co");
		mv.setView(rv);
		return mv;
	}
	
	//상세보기
  	//http://localhost:9000/myapp/fileBoard/detailView.co
	@RequestMapping("/detailView")
	public ModelAndView detailView(
			HttpServletRequest request,
			ModelAndView mv) {
		System.out.println("상세보기요청함수 detailView()진입");
		//1.파라미터받기
		//파라미터	: bno=글번호   nowPage=보고싶은페이지(릴레이용)
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));//보고싶은페이지(릴레이용)

		System.out.println(nowPage);
		
		//3.Model
		mv.addObject("nowPage", nowPage);//보고싶은페이지(릴레이용)
		
		System.out.println("나는"+nowPage);

		//4.View
		mv.setViewName("/fileBoard/detailView");
		return mv;
	}

}
