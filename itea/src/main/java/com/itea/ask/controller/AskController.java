package com.itea.ask.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itea.ask.service.AskService;
import com.itea.dto.AskDTO;
import com.itea.dto.ReplyDTO;
import com.itea.util.PageUtil;

@Controller
public class AskController {

	@Autowired
	AskService askSV;
	
	//게시글 조회
	@RequestMapping("ask/askList")
	public void askList(HttpServletRequest request,HttpSession session) {
		
		int nowPage=1;
		if(request.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		String mnick=(String) session.getAttribute("MNICK");
		PageUtil pInfo = askSV.getPageInfo(nowPage);
		
		ArrayList<AskDTO> list= askSV.askList(pInfo);
		request.setAttribute("mnick", mnick);
		request.setAttribute("pInfo", pInfo);
		request.setAttribute("list", list);
	}
	
	//글 입력 폼
	@RequestMapping("ask/aWriteFrm")
	public void aWriteFrm() {
		
	}
	
	//글 쓰기 처리
	@RequestMapping("ask/aWriteProc")
	public ModelAndView aWriteProc(HttpServletRequest request,HttpSession session,
			ModelAndView mv) {
		String atitle=request.getParameter("atitle");
		String acontent=request.getParameter("acontent");
		int pno=Integer.parseInt(request.getParameter("pno"));
		int mno=(Integer)session.getAttribute("MNO");
		AskDTO askDTO= new AskDTO(mno,pno,atitle,acontent);
		askSV.aWriteProc(askDTO);
		mv.setViewName("redirect:/ask/askList.co");
		return mv;
	}
	
	
	//글 상세보기  && 댓글 리스트
	@RequestMapping("ask/askDetail")
	public void askDetail(HttpServletRequest request,HttpSession session) {
		int ano=Integer.parseInt(request.getParameter("ano"));
		int nowPage=Integer.parseInt(request.getParameter("nowPage"));
		System.out.println("nowPage="+nowPage);
		String userNick=(String) session.getAttribute("MNICK");
		AskDTO askDTO = askSV.askDetail(ano);
		ArrayList<ReplyDTO> list = askSV.replyList(ano);
		askDTO.setNowPage(nowPage);
		
		request.setAttribute("userNick", userNick);
		request.setAttribute("askDTO", askDTO);
		request.setAttribute("list", list);
	}
	
	
	//댓글 입력
	@RequestMapping("ask/askReplyInsert")
	public void askReplyInsert(ReplyDTO replyDTO,HttpSession session) {
		String mnick = (String)session.getAttribute("MNICK");
		replyDTO.setMnick(mnick);
		askSV.askReplyInsert(replyDTO);
	}
	
	//댓글 삭제
	@RequestMapping("ask/askReplyDelete")
	public void askReplyDelete(HttpServletRequest request) {
		int acno = (Integer) request.getAttribute("acno");
		askSV.askReplyDelete(acno);
	}
	
	
	//글 수정폼
	@RequestMapping("ask/askModifyFrm")
	public void askModifyFrm(HttpServletRequest request){
		int ano = Integer.parseInt(request.getParameter("ano"));
		AskDTO askDTO= askSV.askDetail(ano);
		
		request.setAttribute("askDTO", askDTO);
	}
	
	//글 수정 처리
	@RequestMapping("ask/askModifyProc")
	public ModelAndView askModifyProc(HttpServletRequest request, HttpSession session,
			ModelAndView mv){
		String atitle=request.getParameter("atitle");
		String acontent=request.getParameter("acontent");
		int pno=Integer.parseInt(request.getParameter("pno"));
		int ano=Integer.parseInt(request.getParameter("ano"));
		
		AskDTO askDTO= new AskDTO(atitle,acontent,pno,ano);
		
		askSV.askModifyProc(askDTO);
		mv.setViewName("redirect:/ask/askDetail.co?ano="+ano);
		return mv;
			
	}
	
	//글 삭제
	@RequestMapping("ask/askDelete")
	public ModelAndView askDlelte(HttpServletRequest request,
			ModelAndView mv) {
		int ano=Integer.parseInt(request.getParameter("ano"));
		askSV.askDelete(ano);
		mv.setViewName("redirect:/ask/askList.co");
		return mv;
	}
	
	//조회수 증가
	@RequestMapping("ask/askCnt")
	public ModelAndView askCnt(HttpServletRequest request,
			HttpSession session,
			ModelAndView mv) {
		int ano=Integer.parseInt(request.getParameter("ano"));
		int nowPage=Integer.parseInt(request.getParameter("nowPage"));

		System.out.println("nowPage="+nowPage);
		askSV.askCnt(ano,session);
		mv.setViewName("redirect:/ask/askDetail.co?ano="+ano+"&nowPage="+nowPage);
		return mv;
	}
	
	//검색
	@RequestMapping("ask/askSearch")
	public String askSearch(HttpServletRequest request,HttpSession session) {
		String search = request.getParameter("asearch");
		int nowPage=1;
		if(request.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		String mnick=(String) session.getAttribute("MNICK");
		PageUtil pInfo = askSV.getPageInfo(nowPage);
		
		ArrayList<AskDTO> list = askSV.askSearch(search,pInfo);
		request.setAttribute("mnick", mnick);
		request.setAttribute("pInfo", pInfo);
		request.setAttribute("list", list);
		return "ask/askList";
	}
	
	
	

	
	
	
	
}
