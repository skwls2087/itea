package com.itea.member.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

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
		String hostSMTP = "smtp.gmail.com";
		int hostPort = 587;
		String hostSMTPid = "iteaweb20@gmail.com";
		String hostSMTPpwd = "ynbetrfjiktgsyzh";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "iteaweb20@gmail.com";
		String fromName = "Spring Homepage";
		String subject = "";
		String msg = "";
		
		if(div.equals("find_pw")) {
			subject = "아이티어에서 보낸 임시 비밀번호 입니다.";
			msg += "<div align='center' style=' font-family:verdana'>";
			msg += "<h1>임시 비밀번호를 알려드립니다.</h1><hr><br/>";
			msg += "<h3>안녕하세요. 아이티어입니다.<h1>";
			msg += "<h3>임시 비밀번호를 다음과 같이 알려드립니다.<h1>";
			msg += "<h3 style='color: red;'>비밀번호를 변경하여 사용하세요.<h3><br/>";
			msg += "<h3 style='background:#f8f8f8;padding:10px;'>"+member.getMname() + "님의 임시 비밀번호는 "+ member.getMpw() +"입니다.</h3>";
			msg += "</div>";
		}
		// 받는 사람 E-Mail 주소
		String mmail = member.getMmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(hostPort);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mmail, charSet);
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
		int mem = findidpwDAO.check(member);
		System.out.println("find_pw SV="+mem);
		if(mem==0) {
			out.print("해당 정보가없습니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setMpw(pw);
			System.out.println("새로운pw="+pw);
			// 비밀번호 변경
			int npw = findidpwDAO.update_pw(member);
			System.out.println("새로운pw="+npw);
			// 비밀번호 변경 메일 발송
			send_mail(member, "find_pw");
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	public int check(MemberDTO member) throws Exception {
		/*PrintWriter out = response.getWriter();
		out.println(findidpwDAO.check(member));
		out.close();*/
		int mem=findidpwDAO.check(member);
		System.out.println("check sv="+mem);
		return mem;
	}
	
	
	/*// 아이디 중복 검사(AJAX)
	public int check_name(int mname, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(findidpwDAO.check_name(mname));
		out.close();
		mname = findidpwDAO.check_name(mname);
		return mname;
	}

	// 이메일 중복 검사(AJAX)
	public int check_email(int mmail, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(findidpwDAO.check_email(mmail));
		out.close();
		mmail = findidpwDAO.check_email(mmail);
		return mmail;
	}*/
	

	
}
