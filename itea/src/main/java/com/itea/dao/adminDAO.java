package com.itea.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itea.dto.MemberDTO;
import com.itea.util.Visitor;
@Repository
public class adminDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
		this.sqlSession = session;  
	}
	
	/*관리자페이지 홈화면-단위기간별 가입자 수 추이 구하기*/
	
	//방문자수 추가
	public void setVisitTotalCount1(Visitor vo) throws Exception {
		System.out.println("dao들어옴");
		System.out.println("vo 1"+vo);
		session.insert("admin.setVisitTotalCount1", vo);
		System.out.println("vo 2"+vo);
	}
	
	//방문자수 추가
	public void setVisitTotalCount2(Visitor vo) throws Exception {
		System.out.println("dao들어옴");
		session.update("admin.setVisitTotalCount2", vo);
	}
	
	//방문자수 조회 오늘
	public int getVisitTodayCount(Visitor vo) throws Exception {
		System.out.println("dao today "+vo);
		int todayCount = (int)session.selectOne("admin.getVisitTodayCount", vo);
		System.out.println("dao today "+todayCount);
		return todayCount;
	}
	
	//방문자수 조회 총
	public int getVisitTotalCount(Visitor vo) throws Exception {
		int totalCount = (int)session.selectOne("admin.getVisitTotalCount", vo);
		System.out.println("dao total "+totalCount);
		return totalCount;
	}
	
	//한 주간 방문자 수 검색
	public ArrayList<MemberDTO> WeekVisitor(Visitor vo) throws Exception {
		ArrayList<MemberDTO> visitor = null;
		visitor=(ArrayList)session.selectList("admin.WeekVisitor", vo);
		return visitor;
	}
		
	
	//-------------------------------------------------------------------------------
	//한 주간 가입자 수 검색
	public ArrayList<MemberDTO> WeekMember(MemberDTO mdto) throws Exception {
		ArrayList<MemberDTO> member = null;
		member=(ArrayList)session.selectList("admin.WeekMember", mdto);
		return member;
	}
	
	//하루 가입자 수 검색
	public int TodayMember(MemberDTO mdto) throws Exception {
		int member = (int)session.selectOne("admin.TodayMember", mdto);
		return member;
	}

	
	//회원목록
	public ArrayList<MemberDTO> memberList(MemberDTO mdto) throws Exception{
		ArrayList<MemberDTO> list = null;
		list = (ArrayList)session.selectList("admin.memberList", mdto);
		return list;
	}
	
	//전체게시물 수 조회
	public int  totalCount() {
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
