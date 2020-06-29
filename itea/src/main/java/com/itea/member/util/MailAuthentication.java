package com.itea.member.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthentication extends Authenticator {
	private PasswordAuthentication pa;
	public MailAuthentication() {
		String id = "mediqmaster";
		String pw = "jwqzpvhhjzfhcoyv";
		pa = new PasswordAuthentication(id, pw);
	}
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}