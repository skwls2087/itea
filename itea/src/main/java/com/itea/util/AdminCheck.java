package com.itea.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminCheck extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
//		int mno = Integer.parseInt((String) session.getAttribute("MNO"));
		String mnick = (String)session.getAttribute("MNICK");
		
		if(mnick==null || mnick.length()==0) {
			System.out.println("권한 부족으로  이동 요청");
			response.sendRedirect("../admin/memberList.co");
			return false;
		}else {
			return true;
		}
	}

}
