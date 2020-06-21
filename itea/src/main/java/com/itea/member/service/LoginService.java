package com.itea.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itea.member.dao.LoginDAO;

@Service
public class LoginService {
	
	@Autowired
	LoginDAO loginDAO;

	public void selectMember() {
		loginDAO.selectMember();
	}

}
