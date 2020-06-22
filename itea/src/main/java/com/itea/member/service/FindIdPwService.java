package com.itea.member.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dao.FindIdPwDAO;
import com.itea.member.dao.MemberDAO;
import com.itea.member.dto.MemberDTO;

public class FindIdPwService {
	
	@Autowired
	FindIdPwDAO findidpwDAO;
	
	// 아이디 찾기
	public String find_id(HttpServletResponse response, String mmail) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = findidpwDAO.find_id(mmail);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
}
