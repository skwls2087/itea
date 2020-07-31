package com.itea.dto;

import java.util.Date;

//통계자료를 담아 뷰단으로 넘겨주는 객체를 생성하기위해 VO클래스생성
public class Statistics {
	
	private Date mdate;
	private String week;
	private int weekCnt;
	
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public int getWeekCnt() {
		return weekCnt;
	}
	public void setWeekCnt(int weekCnt) {
		this.weekCnt = weekCnt;
	}
	@Override
	public String toString() {
		return "Statistics [mdate=" + mdate + ", week=" + week + ", weekCnt=" + weekCnt + "]";
	}
	
	
}
