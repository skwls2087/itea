package com.itea.dto;

import java.sql.Date;

public class QaDTO {
	
	private int qno;
	private String qclass;
	private int mno;
	private String qcont;
	private Date qdate;
	private String acont;
	private Date adate;
	private String mnick;
	
	//페이지 변수
	private int		start; 		//시작글번호
	private	int		end;		//끝글번호
	private int		nowPage;	//보고싶은페이지
	
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
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	
	@Override
	public String toString() {
		return "QaDTO [qno=" + qno + ", qclass=" + qclass + ", mno=" + mno + ", qcont=" + qcont + ", qdate=" + qdate
				+ ", acont=" + acont + ", adate=" + adate + ", mnick=" + mnick + ", start=" + start + ", end=" + end
				+ ", nowPage=" + nowPage + "]";
	}
	
}
