package com.itea.util;

import java.util.Date;

public class Visitor {

	private String term;
	private int sum;
	private int vscount;
	private Date vsDate;
	
	public Visitor() {
		
	}
	
	public Visitor(String term,int sum) {
		this.term = term;
		this.sum = sum;
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

	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "Visitor [term=" + term + ", sum=" + sum + ", vscount=" + vscount + ", vsDate=" + vsDate + "]";
	}
	
	
}
