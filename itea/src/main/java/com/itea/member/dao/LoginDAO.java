package com.itea.member.dao;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.itea.member.dto.MemberDTO;

public class LoginDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberDTO member) throws Exception{
		return session.update("member.update_pw", member);
	}
	
	// 아이디 찾기
	public String find_id(String email) throws Exception{
		return session.selectOne("member.find_id", email);
	}
	
	// 이름 중복 검사(AJAX)
	public void check_name(String name, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.close();
	}

	// 아이디 중복 검사(AJAX)
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.close();
	}
		
	//로그인처리 요청담당  함수
	public void login(String id) {

		System.out.println("DAO옴!");
		int cnt = session.selectOne("member.memberCnt");
		System.out.println(cnt);
	}

}
