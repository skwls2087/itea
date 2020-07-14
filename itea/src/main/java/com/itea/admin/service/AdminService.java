package com.itea.admin.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.adminDAO;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;
import com.itea.util.Statistics;



public class AdminService {
	
	@Autowired
	adminDAO adminDAO;
	
	//today,total 통계데이터 구하는 메서드
	public Statistics staticService(MemberDTO mdto) throws Exception {
		
		Statistics memberStatistics= new Statistics();
		ArrayList<MemberDTO> member=new ArrayList<MemberDTO>();

		int totalMember=adminDAO.totalCount();
		int todayMember=adminDAO.TodayMember(mdto);
		
		Calendar cal = Calendar.getInstance();
		 
		//현재 년도, 월, 일
		int year = cal.get ( Calendar.YEAR );
		int month = cal.get ( Calendar.MONTH );
		int date = cal.get ( Calendar.DATE );
		String today=year+"-"+(month+1)+"-"+(date+1);
		Date now=Date.valueOf(today);
		mdto.setMdate(now);
		
		memberStatistics.setTotalMember(totalMember);
		memberStatistics.setTodayMember(todayMember);
		
		return memberStatistics;
	}
	
	
	//member 통계데이터 구하는 메서드	
	public ArrayList<MemberDTO> WeekMember(MemberDTO mdto) throws Exception {
		Calendar today = Calendar.getInstance();
		ArrayList<MemberDTO> member= adminDAO.WeekMember(mdto);
			for(int i=1;i<8;i++) {
				int weekNum=today.get(Calendar.DAY_OF_WEEK)-i; //오늘부터 7일전까지의 요일 구하기
				String week="";
				if(weekNum==0 || weekNum==-7 ) {
					week="일";
				}else if(weekNum==1 || weekNum==-6) {
					week="월";
				}else if(weekNum==2 || weekNum==-5) {
					week="화";
				}else if(weekNum==3 || weekNum==-4) {
					week="수";
				}else if(weekNum==4 || weekNum==-3) {
					week="목";
				}else if(weekNum==5 || weekNum==-2) {
					week="금";
				}else if(weekNum==6 || weekNum==-1) {
					week="토";
				}
				member.add(new MemberDTO(week, weekNum));
			}
			System.out.println("service"+member);
			Collections.reverse(member); //리스트 순서를 반대로
		return member;
	}
	
	/*//visitor 통계데이터 구하는 메서드	
	public List<Visitor> visitService(String term) {
		if(term.equals("week")) {
			visitor=adminDao.selectWeekVisitor(conn);
		}else if(term.equals("month")) {
			visitor=adminDao.selectMonthVisitor(conn);
		}else if(term.equals("year")) {
			visitor=adminDao.selectYearVisitor(conn);
		}
		return visitor;
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//회원 목록
	public PageUtil memberList(int page) throws Exception {
		MemberDTO mdto = new MemberDTO();
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.totalCount();
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberList(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;
	}
		
	//회원 검색
	public PageUtil memberSearchMnick(int page,MemberDTO mdto) throws Exception {
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.mCntMnick(mdto);
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberSearchMnick(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;		
	}
	
	//회원 검색
	public PageUtil memberSearchMmail(int page,MemberDTO mdto) throws Exception {
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.mCntMmail(mdto);
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberSearchMmail(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;		
	}
	
	
	//강제탈퇴
	public void deleteMember(String mnick) throws Exception {
		adminDAO.deleteMember(mnick);
	}
		
	
}











