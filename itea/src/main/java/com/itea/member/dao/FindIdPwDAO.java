package com.itea.member.dao;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dto.MemberDTO;

public class FindIdPwDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private SqlSessionTemplate sqlSession;  

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}
	
	// 아이디 찾기
	public MemberDTO find_id(MemberDTO mdto) throws Exception{
		MemberDTO member = session.selectOne("member.find_id", mdto);
		return member;
	}
	
	/*public String find_id_Dao(String mname,String mphone) throws Exception{
		String find_id(@Param("mname")String mname, @Param("mname")String mphone); 
		return session.selectOne("member.find_id", mmail);

	}*/
	
	// 비밀번호 변경
	public int update_pw(MemberDTO member) throws Exception{
		return session.update("member.update_pw", member);
	}

	//이름 확인
	public int check_name(String mname, HttpServletResponse response) {
		return 0;
	}
	

}
