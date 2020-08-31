package com.itea.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String mnick = (String)session.getAttribute("MNICK");
		
		if( !mnick.equals("관리자") ) { //관리자가 아닐 경우
			System.out.println("권한부족으로 로그인폼으로 이동");
			response.sendRedirect("/member/loginFrm.co");
			return false;
		}else {
			return true;
		}
	}
}
