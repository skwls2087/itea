package com.itea.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {

@Autowired
private UserSearchService searchService;
@Autowired
private UserMailSendService mailsender;

// 아이디 찾기
@RequestMapping(value = "/user/userSearch", method = RequestMethod.POST)
@ResponseBody
public String userIdSearch(@RequestParam("inputName_1") String user_name, 
		@RequestParam("inputPhone_1") String user_phone) {
	
	String result = searchService.get_searchId(user_name, user_phone);

	return result;
}

// 비밀번호 찾기
@RequestMapping(value = "/user/searchPassword", method = RequestMethod.GET)
@ResponseBody
public String passwordSearch(@RequestParam("userId")String user_id,
		@RequestParam("userEmail")String user_email,
		HttpServletRequest request) {

	mailsender.mailSendWithPassword(user_id, user_email, request);
	
	return "user/userSearchPassword";
}
}
