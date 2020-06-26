package com.itea.member.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dao.JoinDAO;
import com.itea.member.dto.MemberDTO;
import com.itea.member.util.MailAuthentication;

public class JoinService {

	@Autowired
	JoinDAO joinDAO;
	
	//이메일 유무 확인하기
	public int checkMail(String email) {
		
		int isMail=joinDAO.checkMail(email);
		
		return isMail;
	}

	//인증코드생성
	public String getCode() throws Exception {
		
		Random rand = new Random();
		String code = "";
		for (int i = 0; i < 8; i++) {
			code += Integer.toString(rand.nextInt(10));
		}
		return code;
	}
	
	// 이메일 발송
	public void sendMail(String code,String mmail) throws Exception {
		
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
		
		subject = "아이티어에서 보낸 인증번호 입니다";
		msg += "<div>";
		msg += "<h1>인증번호를 알려드립니다.</h1><hr><br/>";
		msg += "<h3>안녕하세요. 아이티어입니다.<h1>";
		msg += "<h3>회원님의 회원가입을 진심으로 축하드리며<h1>";
		msg += "<h3>이메일 인증을 위한 번호를 다음과 같이 알려드립니다.<h1>";
		msg += "<h3 style='color: red;'>인증번호 8자리를 진행 중인 화면에 입력해주세요.<h3><br/>";
		msg += "<h1 style='background:#f8f8f8;padding:10px;'>인증번호 : "+code+"</h1>";
		msg += "</div>";
		
		// 받는 사람 E-Mail 주소
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

	//닉네임 중복체크
	public int checkNick(String mnick) {
		int isNick=joinDAO.checkNick(mnick);
		return isNick;
	}
	
}

