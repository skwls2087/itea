package com.itea.member.dao;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.itea.member.dto.MemberDTO;

public class FindIdPwDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private FindIdPwDAO findIdPwDAO;
	
	public void setFindIdPwDAO(FindIdPwDAO findIdPwDAO) {
		  this.findIdPwDAO = findIdPwDAO;
	}

	// 아이디 찾기
	public String find_id(String mmail) throws Exception{
		return session.selectOne("member.find_id", mmail);
	}
	
	// 이메일 중복 검사
	public int check_mmail(String mmail) throws Exception{
		return session.selectOne("member.check_mmail", mmail);
	}
	
	// 이름 중복 검사(AJAX)
	public void check_name(String name, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.close();
	}

	// 이메일 중복 검사(AJAX)
	public void check_mmail(String mmail, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.close();
	}
		
	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberDTO member) throws Exception{
		return session.update("member.update_pw", member);
	}
	

}
