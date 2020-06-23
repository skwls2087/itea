package com.itea.member.service;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dao.FindIdPwDAO;
import com.itea.member.dao.LoginDAO;
import com.itea.member.dto.MemberDTO;

public class FindIdPwService {
	
	@Autowired
	FindIdPwDAO findidpwDAO;
	LoginDAO loginDAO;
	
	// 아이디 찾기
	public String find_id(HttpServletResponse response, MemberDTO mdto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//MemberDTO member=findidpwDAO.find_id(mdto);
		
		HashMap map = new HashMap();
		map.put("mname", mdto.getMname());  //유저입력이름
		map.put("mphone", mdto.getMphone()); //유저입력휴대폰번호
		
		HashMap result = findidpwDAO.find_id(map);
		String mmail = mdto.getMmail();
		
		if (result == null || result.size()==0) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			out.println("<script>");
			out.println("alert('아이디는'+mmail+'입니다.');");
			out.println("</script>");
			out.close();
			return mmail;
		}
	}
	
	// 비밀번호 찾기
	public void find_pw(HttpServletResponse response, MemberDTO member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 이름이 없으면
		if(findidpwDAO.check_name(member.getMname(),response)==0) {
			out.print("이름이 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!member.getMmail().equals(loginDAO.login(member.getMmail()) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setMpw(pw);
			// 비밀번호 변경
			findidpwDAO.update_pw(member);
			// 비밀번호 변경 메일 발송
			send_mail(member, "find_pw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
		
	
}
