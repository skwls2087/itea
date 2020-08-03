package com.itea.dto;

public class ErrorDTO {
	
	private int pno;
	private String econtent;
	private int cnt;
	private int plike;
	private int phate;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public int getPhate() {
		return phate;
	}
	public void setPhate(int phate) {
		this.phate = phate;
	}
	
	@Override
	public String toString() {
		return "ErrorDTO [pno=" + pno + ", econtent=" + econtent + ", cnt=" + cnt + ", plike=" + plike + ", phate="
				+ phate + "]";
	}
}
