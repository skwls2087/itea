package com.itea.member.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.itea.member.dto.MemberDTO;

public class FindIdPwDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}
	
	// 아이디 찾기
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<MemberDTO> find_id(MemberDTO mdto) throws Exception{
		System.out.println("dao들어옴");
		ArrayList<MemberDTO> list = null;
		list = (ArrayList)session.selectList("member.find_id", mdto);
		return list;
	}
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberDTO member) throws Exception{
		return session.update("member.update_pw", member);
	}
	
	//중복검사
	public int check(MemberDTO member) throws Exception{
		System.out.println("member dao ="+member);
		return session.selectOne("member.check", member);
	}
	
	/*// 이름 중복 검사
	public int check_name(int mname) throws Exception{
		System.out.println("mname dao ="+mname);
		return session.selectOne("member.check_name", mname);
	}
	
	// 이메일 중복 검사
	public int check_email(int mmail) throws Exception{
		System.out.println("mmail dao ="+mmail);
		return session.selectOne("member.check_email", mmail);
	}*/
	

}
