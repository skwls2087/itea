package com.itea.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.MemberDTO;

public class adminDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}
	
    //회원목록
	public ArrayList<MemberDTO> memberList(MemberDTO mdto) throws Exception{
		ArrayList<MemberDTO> list = null;
		list = (ArrayList)session.selectList("admin.memberList", mdto);
		return list;
	}
	
	//전체게시물 수 조회
	public  int  getTotalCnt() {
		return (Integer)session.selectOne("admin.totalCnt");
	}
	
	//회원검색
	public ArrayList<MemberDTO> memberSearch(MemberDTO mdto) throws Exception{
		System.out.println(mdto.getStart()+"--"+mdto.getSize());
		ArrayList<MemberDTO> list = null;
		list = (ArrayList)session.selectList("admin.memberSearch",mdto);
		return list;
	}
	
	//회원검색 수 조회
	public  int  mCnt(String column, String value) {
		HashMap map = new HashMap<>();
		map.put("column", column);
		map.put("value", value);
		System.out.println("map-"+map.toString());
		return (Integer)session.selectOne("admin.mCnt",map);
	}
	
	//관리자 비번 확인
	public String checkAdminPw(String mpw) throws Exception{
		return session.selectOne("admin.checkAdminPw",mpw);
	}
	
	//회원 강제탈퇴
	public void deleteMember(String mnick)throws Exception{
		session.delete("admin.deleteMember",mnick);
	}

}
