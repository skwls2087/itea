package com.itea.ask.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public void askDetail(HttpServletRequest request,HttpSession session) throws Exception{
		int ano=Integer.parseInt(request.getParameter("ano"));
		int nowPage=Integer.parseInt(request.getParameter("nowPage"));
		String userNick=(String) session.getAttribute("MNICK");
		AskDTO askDTO = askSV.askDetail(ano);
		ArrayList<ReplyDTO> list = askSV.replyList(ano);
		askDTO.setNowPage(nowPage);
		request.setAttribute("list", list);
		request.setAttribute("userNick", userNick);
		request.setAttribute("askDTO", askDTO);

	}
	
	
	//댓글 입력
	@RequestMapping("ask/askReplyInsert")
	public ModelAndView askReplyInsert(ReplyDTO replyDTO,HttpSession session,
			HttpServletRequest request,ModelAndView mv) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		int mno = (Integer) session.getAttribute("MNO");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		replyDTO.setAcdepth(0);
		replyDTO.setMno(mno);
		replyDTO.setAno(ano);
		System.out.println("replyDTO="+replyDTO);
		askSV.askReplyInsert(replyDTO);
		
		mv.addObject("ano",ano);
		mv.addObject("nowPage",nowPage);
		mv.setViewName("redirect:askDetail.co");
		
		return mv;
	}
	
	//대댓글 입력
	@RequestMapping("ask/askcoReplyInsert")
	public ModelAndView askcoReplyInsert(ReplyDTO replyDTO,HttpSession session,
			HttpServletRequest request,ModelAndView mv) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		int mno = (Integer) session.getAttribute("MNO");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		int acno = Integer.parseInt(request.getParameter("acno"));
		
		replyDTO.setMno(mno);
		replyDTO.setAno(ano);
		replyDTO.setAcdepth(1);
		replyDTO.setAcparent(acno);
		askSV.askcoReplyInsert(replyDTO);
		
		mv.addObject("ano",ano);
		mv.addObject("nowPage",nowPage);
		mv.setViewName("redirect:askDetail.co");
		
		return mv;
	}
	
	//댓글 삭제
	@RequestMapping("ask/askReplyDelete")
	public ModelAndView askReplyDelete(HttpServletRequest request,
										ModelAndView mv) {
		int acno = Integer.parseInt(request.getParameter("acno"));
		int ano = Integer.parseInt(request.getParameter("ano"));
		int nowPage = Integer.parseInt(request.getParameter("nowPage")); 
		int acdepth = Integer.parseInt(request.getParameter("acdepth"));
		askSV.askReplyDelete(acno,acdepth);
		mv.addObject("ano",ano);
		mv.addObject("nowPage",nowPage);
		mv.setViewName("redirect:askDetail.co");
		
		return mv;
	}
	
	
	//글 수정폼
	@RequestMapping("ask/askModifyFrm")
	public void askModifyFrm(HttpServletRequest request){
		int ano = Integer.parseInt(request.getParameter("ano"));
		int nowPage = Integer.parseInt(request.getParameter("nowPage")); 
		AskDTO askDTO= askSV.askDetail(ano);
		askDTO.setNowPage(nowPage);
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
		int nowPage = Integer.parseInt(request.getParameter("nowPage")); 
		
		AskDTO askDTO= new AskDTO(atitle,acontent,pno,ano);
		askDTO.setNowPage(nowPage);
		
		askSV.askModifyProc(askDTO);
		mv.addObject("ano",ano);
		mv.addObject("nowPage",nowPage);
		mv.setViewName("redirect:/ask/askDetail.co");
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