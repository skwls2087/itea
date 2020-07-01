package com.itea.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.itea.dto.MemberDTO;

public class memberDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}
	
	/*회원가입 DAO*/
	public void joinProc(MemberDTO mDto) {
		session.insert("member.joinProc", mDto);
	}

	public void joinProcSNS(MemberDTO mDto) {
		session.insert("member.joinProcSNS",mDto);
	}

	public int checkMail(String mail) {
		int isMail=session.selectOne("member.mailCheck",mail);
		return isMail;
	}

	public int checkNick(String mnick) {
		int isNick=session.selectOne("member.nickCheck",mnick);
		return isNick;
	}
	
	/*로그인 DAO*/
	//로그인처리 요청담당  함수
	public MemberDTO login(MemberDTO mdto) {

		MemberDTO member=session.selectOne("member.login",mdto);
		
		return member;
	}

	public MemberDTO snsLogin(MemberDTO mdto) {
		
		MemberDTO member=session.selectOne("member.snsLogin",mdto);
		
		System.out.println("sql후"+member);
		return member;
	}
	
	/*아이디,비번찾기 DAO*/
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

	/*정보수정 DAO*/
	public MemberDTO modifyInfo(int mno) {
		return (MemberDTO)session.selectOne("member.modifyInfo",mno);
	}
	
	public MemberDTO modify(MemberDTO mDto) {
		session.update("member.modify",mDto);
		return null;
	}

	public void delete(int mno) {
		session.delete("member.delete",mno);
	}

	public int checkNick(MemberDTO mDto) {
		int isNick=session.selectOne("member.mynickCheck",mDto);
		return isNick;
	}
	
}
