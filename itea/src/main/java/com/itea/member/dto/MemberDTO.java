package com.itea.member.dto;

import java.sql.Date;

public class MemberDTO {
	
	private int mno;
	private String mmail;
	private String mpw;
	private String mname;
	private String mnick;
	private String msex;
	private String mbirth;
	private String mgradu;
	private Date mdate;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMmail() {
		return mmail;
	}
	public void setMmail(String mmail) {
		this.mmail = mmail;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	public String getMsex() {
		return msex;
	}
	public void setMsex(String msex) {
		this.msex = msex;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMgradu() {
		return mgradu;
	}
	public void setMgradu(String mgradu) {
		this.mgradu = mgradu;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", mmail=" + mmail + ", mpw=" + mpw + ", mname=" + mname + ", mnick=" + mnick
				+ ", msex=" + msex + ", mbirth=" + mbirth + ", mgradu=" + mgradu + ", mdate=" + mdate + "]";
	}
	
}
