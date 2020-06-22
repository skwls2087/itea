package com.itea.member.service;

import javax.servlet.http.HttpServletResponse;

import com.itea.member.dto.MemberDTO;

public interface MemberServiceImp {
	
	public void check_mmail(String email, HttpServletResponse response) throws Exception;

	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception;
}

