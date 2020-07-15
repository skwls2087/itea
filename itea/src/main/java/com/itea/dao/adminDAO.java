package com.itea.dao;

import java.util.ArrayList;
import java.util.Date;

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
	
	
	/*관리자페이지 홈화면-단위기간별 가입자 수 추이 구하기*/
	
	//한 주간 가입자 수 검색
	public ArrayList<MemberDTO> WeekMember(MemberDTO mdto) throws Exception {
		ArrayList<MemberDTO> member = null;
		member=(ArrayList)session.selectList("admin.WeekMember", mdto);
		System.out.println("weekmember dao "+member);
		return member;
	}
	
	//하루 가입자 수 검색
	public int TodayMember(MemberDTO mdto) throws Exception {
		int member = (int)session.selectOne("admin.TodayMember", mdto);
		System.out.println("TodayMember dao "+member);
		return member;
	}

	
	//회원목록
	public ArrayList<MemberDTO> memberList(MemberDTO mdto) throws Exception{
		ArrayList<MemberDTO> list = null;
		list = (ArrayList)session.selectList("admin.memberList", mdto);
		return list;
	}
	
	//전체게시물 수 조회
	public  int  totalCount() {
		return (Integer)session.selectOne("admin.totalCnt");
	}

	//회원검색
	public ArrayList<MemberDTO> memberSearchMnick(MemberDTO mdto) throws Exception{
		ArrayList<MemberDTO> list = null;
		list = (ArrayList)session.selectList("admin.memberSearchMnick",mdto);
		return list;
	}
	
	//회원검색
	public ArrayList<MemberDTO> memberSearchMmail(MemberDTO mdto) throws Exception{
		ArrayList<MemberDTO> list = null;
		list = (ArrayList)session.selectList("admin.memberSearchMmail",mdto);
		return list;
	}
	
	//회원검색 수 조회
	public int mCntMnick(MemberDTO mdto) {
		int ncnt=(Integer)session.selectOne("admin.mCntMnick",mdto);
		return ncnt;
	}
	
	//회원검색 수 조회
	public int mCntMmail(MemberDTO mdto) {
		String column="mnick";
		int ncnt=(Integer)session.selectOne("admin.mCntMmail",mdto);
		return ncnt;
	}
	
	//회원 강제탈퇴
	public void deleteMember(String mnick)throws Exception{
		session.delete("admin.deleteMember",mnick);
	}

}
