package com.itea.dao;

import java.util.ArrayList;
import java.util.Collections;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itea.dto.MemberDTO;
import com.itea.dto.Statistics;
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
	public void setVisitTotalCount() throws Exception {
		session.insert("admin.setVisitTotalCount");
	}
	
	//방문자수 조회 오늘
	public int getVisitTodayCount(Visitor vo) throws Exception {
		int todayCount = (int)session.selectOne("admin.getVisitTodayCount", vo);
		//System.out.println("dao today1 "+vo);
		//System.out.println("dao today1 "+todayCount);
		return todayCount;
	}
	
	//방문자수 조회 총
	public int getVisitTotalCount() throws Exception {
		int totalCount = (int)session.selectOne("admin.getVisitTotalCount");
		//System.out.println("dao total "+totalCount);
		return totalCount;
	}
	
	//한 주간 방문자 수 검색
	public ArrayList<MemberDTO> WeekVisitor(Visitor vo) throws Exception {
		ArrayList<MemberDTO> visitor = null;
		visitor=(ArrayList)session.selectList("admin.WeekVisitor", vo);
		//Collections.reverse(visitor); //리스트 순서를 반대로
		System.out.println("dao visitor "+visitor);
		return visitor;
	}
	
	//-------------------------------------------------------------------------------
	//한 주간 가입자 수 검색
	public ArrayList<MemberDTO> WeekMember(MemberDTO mdto) throws Exception {
		ArrayList<MemberDTO> member = null;
		member=(ArrayList)session.selectList("admin.WeekMember",mdto);
		//Collections.reverse(member); //리스트 순서를 반대로
		System.out.println("dao member "+member);
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
