package com.itea.member.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dao.FindIdPwDAO;
import com.itea.member.dao.LoginDAO;
import com.itea.member.dto.MemberDTO;

public class FindIdPwService {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	FindIdPwDAO findidpwDAO;
	
	@Autowired
	LoginDAO loginDAO;
	
	
	// 아이디 중복 검사(AJAX)
	public void check_name(String name, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(findidpwDAO.check_name(name));
		out.close();
	}

	// 이메일 중복 검사(AJAX)
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(findidpwDAO.check_email(email));
		out.close();
	}

	// 아이디 찾기
	public ArrayList find_id(HttpServletResponse response, MemberDTO mdto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("서비스들어옴");
		System.out.println(mdto);
		
		ArrayList<MemberDTO> list = findidpwDAO.find_id(mdto);
		
		System.out.println(list);
		if (list == null || list.size()==0) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			System.out.println("아이디 x");
			return null;
		} else {
			System.out.println("아이디가 있음");
			return list;
		}
	}
	
	// 이메일 발송
	public void send_mail(MemberDTO member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "이메일 입력";
		String hostSMTPpwd = "비밀번호 입력";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "이메일 입력";
		String fromName = "Spring Homepage";
		String subject = "";
		String msg = "";
		
		if(div.equals("find_pw")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMname() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getMpw() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = member.getMmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	// 비밀번호 찾기
	public void find_pw(HttpServletResponse response, MemberDTO member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 이름이 없으면
		if(findidpwDAO.check_name(member.getMname())==0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!member.getMmail().equals(loginDAO.login(member))) {
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
