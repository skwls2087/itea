package com.itea.util;

import java.util.Date;

public class Visitor {

	private String week;
	private int sum;
	private int vscount;
	private Date vsDate;
	
	public Visitor() {
		
	}
	
	public Visitor(String week,int vscount) {
		this.week = week;
		this.vscount = vscount;
	}
	
	
	public int getVscount() {
		return vscount;
	}

	public void setVscount(int vscount) {
		this.vscount = vscount;
	}

	public Date getVsDate() {
		return vsDate;
	}

	public void setVsDate(Date vsDate) {
		this.vsDate = vsDate;
	}
	
	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "Visitor [week=" + week + ", sum=" + sum + ", vscount=" + vscount + ", vsDate=" + vsDate + "]";
	}
	
	

	
}
