package com.itea.member.dto;

public class MemberDTO {
	
	private String mid;
	private String mpw;
	private String mname;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	
	@Override
	public String toString() {
		return "member [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + "]";
	}
	
}
