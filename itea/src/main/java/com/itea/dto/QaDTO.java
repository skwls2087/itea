package com.itea.dto;

import java.util.Date;

public class QaDTO {
	
	private int qno;
	private String qclass;
	private int mno;
	private String qcont;
	private Date qdate;
	private String acont;
	private Date adate;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQclass() {
		return qclass;
	}
	public void setQclass(String qclass) {
		this.qclass = qclass;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getQcont() {
		return qcont;
	}
	public void setQcont(String qcont) {
		this.qcont = qcont;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public String getAcont() {
		return acont;
	}
	public void setAcont(String acont) {
		this.acont = acont;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	
	@Override
	public String toString() {
		return "QaDTO [qno=" + qno + ", qclass=" + qclass + ", mno=" + mno + ", qcont=" + qcont + ", qdate=" + qdate
				+ ", acont=" + acont + ", adate=" + adate + "]";
	}
	
}
