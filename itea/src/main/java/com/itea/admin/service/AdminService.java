package com.itea.admin.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.adminDAO;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;
import com.itea.util.Statistics;
import com.itea.util.Visitor;



public class AdminService<Hashmap> {
	
	@Autowired
	adminDAO adminDAO;
	
	//today,total 통계데이터 구하는 메서드
	public Statistics staticService(MemberDTO mdto) throws Exception {
		Statistics memberStatistics= new Statistics();
		ArrayList<MemberDTO> member=new ArrayList<MemberDTO>();

		int totalMember=adminDAO.totalCount();
		int todayMember=adminDAO.TodayMember(mdto);
		//System.out.println("service totalmember "+totalMember);
		
		Calendar cal = Calendar.getInstance();
		 
		//현재 년도, 월, 일
		int year = cal.get ( Calendar.YEAR );
		int month = cal.get ( Calendar.MONTH );
		int date = cal.get ( Calendar.DATE );
		String today=year+"-"+(month+1)+"-"+(date);
		Date now=Date.valueOf(today);
		mdto.setMdate(now);
		System.out.println("service todaymember "+todayMember);
		memberStatistics.setTotalMember(totalMember);
		return memberStatistics;
	}
	
	//방문자수 추가
	public int setVisitTotalCount(Visitor vo) throws Exception {
		Calendar cal = Calendar.getInstance();
		 
		//현재 년도, 월, 일
		int year = cal.get ( Calendar.YEAR );
		int month = cal.get ( Calendar.MONTH );
		int date = cal.get ( Calendar.DATE );
		
		String today=year+"-"+(month+1)+"-"+(date);
		Date now=Date.valueOf(today);
		
		vo.setVsdate(now);
		int todayCount = adminDAO.getVisitTodayCount(vo);
		
		if(todayCount!=0) { //오늘 날짜의 방문자 데이터가 있으면
			System.out.println("방문자수 1명 증가 ");
			return adminDAO.setVisitTotalCount2(vo);
		}else {
			vo.setVsdate(now);
			System.out.println(now+"일자 첫 방문자");
			return adminDAO.setVisitTotalCount1(vo);
		}
	}	
	
	//오늘 방문자 수 구하는 메서드
	public int getVisitTodayCount(Visitor vo) throws Exception {
		Calendar cal = Calendar.getInstance();
		
		//현재 년도, 월, 일
		int year = cal.get ( Calendar.YEAR );
		int month = cal.get ( Calendar.MONTH );
		int date = cal.get ( Calendar.DATE );
		String today=year+"-"+(month+1)+"-"+(date+1);
		Date now=Date.valueOf(today);
		vo.setVsDate(now);
		
		return adminDAO.getVisitTodayCount(vo);
	}
	
	//전체 방문자 수 구하는 메서드
	public int getVisitTotalCount(Visitor vo) throws Exception {
		return adminDAO.getVisitTotalCount(vo);
	}
	
		
	//visitor 통계데이터 구하는 메서드	
	public ArrayList WeekVisitor(Visitor vo) throws Exception {
		Calendar today = Calendar.getInstance();
		ArrayList visitor= adminDAO.WeekVisitor(vo);
		ArrayList list = new ArrayList();
		ArrayList cntList = new ArrayList();
		
		int sum = adminDAO.getVisitTotalCount(vo);
		
		for(int i=0;i<visitor.size();i++) {
			if(i!=0) {
				int cntstr = (int) visitor.get(i);
				System.out.println("service cntstr "+cntstr);
				System.out.println("service member "+(int) visitor.get(i));
				sum = sum-cntstr;
			}
			list.add(sum);
		}
			for(int i=0;i<7;i++) {
				//HashMap<String,Integer> map = new HashMap<String,Integer>();
				int weekNum=today.get(Calendar.DAY_OF_WEEK)-i; //오늘부터 7일전까지의 요일 구하기
				String week="";
				if(weekNum==1 || weekNum==-6 ) {
					week="일";
				}else if(weekNum==2 || weekNum==-5) {
					week="월";
				}else if(weekNum==3 || weekNum==-4) {
					week="화";
				}else if(weekNum==4 || weekNum==-3) {
					week="수";
				}else if(weekNum==5 || weekNum==-2) {
					week="목";
				}else if(weekNum==6 || weekNum==-1) {
					week="금";
				}else if(weekNum==7 || weekNum==0) {
					week="토";
				}
				//map.put(week,(int)list.get(i));
				//map.put("term",week);
				//map.put("sum",(int)list.get(i));
				
				int vscount=(int)list.get(i);
				vo.setWeek(week);
				vo.setVscount(vscount);
				cntList.add(new Visitor(week,vscount));
			}
			Collections.reverse(cntList); //리스트 순서를 반대로
			System.out.println("service"+cntList);
		return cntList;
	}	
	
	
	//member 통계데이터 구하는 메서드	
	public ArrayList WeekMember(MemberDTO mdto) throws Exception {
		Calendar today = Calendar.getInstance();
		ArrayList member= adminDAO.WeekMember(mdto);
		ArrayList list = new ArrayList();
		ArrayList cntList = new ArrayList();
		
		int sum = adminDAO.totalCount();
		
		for(int i=0;i<member.size();i++) {
			if(i!=0) {
				int cntstr = (int) member.get(i);
				//System.out.println("service cntstr "+cntstr);
				//System.out.println("service member "+(int) member.get(i-1));
				sum = sum-cntstr;
			}
			list.add(sum);
		}
			for(int i=0;i<7;i++) {
				//HashMap<String,Integer> map = new HashMap<String,Integer>();
				int weekNum=today.get(Calendar.DAY_OF_WEEK)-i; //오늘부터 7일전까지의 요일 구하기
				String week="";
				if(weekNum==1 || weekNum==-6 ) {
					week="일";
				}else if(weekNum==2 || weekNum==-5) {
					week="월";
				}else if(weekNum==3 || weekNum==-4) {
					week="화";
				}else if(weekNum==4 || weekNum==-3) {
					week="수";
				}else if(weekNum==5 || weekNum==-2) {
					week="목";
				}else if(weekNum==6 || weekNum==-1) {
					week="금";
				}else if(weekNum==7 || weekNum==0) {
					week="토";
				}
				//map.put(week,(int)list.get(i));
				//map.put("term",week);
				//map.put("sum",(int)list.get(i));
				
				int weekCnt=(int)list.get(i);
				mdto.setWeek(week);
				mdto.setWeekCnt(weekCnt);
				cntList.add(new MemberDTO(week,weekCnt));
			}
			Collections.reverse(cntList); //리스트 순서를 반대로
			//System.out.println("service"+cntList);
		return cntList;
	}
	
	
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











