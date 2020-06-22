package com.itea.member.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itea.member.dao.LoginDAO;
import com.itea.member.dto.MemberDTO;

@Service
public class LoginService {
	
	@Autowired
	LoginDAO loginDAO;
	
	//로그인처리 요청담당  함수
	public void login(MemberDTO mdto) {
		
		System.out.println("서비스옴!");
		
		loginDAO.login(mdto);
		
	}
}
