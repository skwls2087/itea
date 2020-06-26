package com.itea.member.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dao.JoinDAO;
import com.itea.member.util.MailAuthentication;

public class JoinService {

	@Autowired
	JoinDAO joinDAO;
	
	//이메일 유무 확인하기
	public int checkMail(String email) {
		
		int isMail=joinDAO.checkMail(email);
		
		return isMail;
	}
	
	//메일전송
	public void sendMail(String title, String content, String eamil) throws UnsupportedEncodingException, MessagingException {
		Properties props = System.getProperties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.user", "mediqmaster");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		Authenticator auth = new MailAuthentication();
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);
		msg.setSentDate(new Date());
		System.out.println(eamil);
		msg.setFrom(new InternetAddress("mediqmaster@gmail.com"));
		System.out.println("setFrom");
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(eamil));
		System.out.println("setRecipient");
		msg.setSubject(title, "UTF-8");
		msg.setText(content, "UTF-8");
		//msg.setHeader("content-Type", "text/html");
		System.out.println("set all");
		Transport.send(msg);
		System.out.println("send");
	}
	
}

