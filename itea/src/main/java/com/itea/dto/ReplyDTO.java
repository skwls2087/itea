package com.itea.dto;

import java.util.Date;

public class ReplyDTO {
	
	private int acno; 		//댓글번호
	private int ano;  		//게시글 번호
	private int mno;
	private String mnick;	//작성자 닉네임
	private String accontent;	//내용
	private Date acdate;	//작성일
	private int acparent;	//댓글 부모	 acno
	private int acdepth;	//댓글 0 대댓글 1
	private int acorder;	//정렬순서 acparent가 null이면 초기화
	
	public int getAcno() {
		return acno;
	}
	public void setAcno(int acno) {
		this.acno = acno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public Date getAcdate() {
		return acdate;
	}
	public void setAcdate(Date acdate) {
		this.acdate = acdate;
	}
	public String getAccontent() {
		return accontent;
	}
	public void setAccontent(String accontent) {
		this.accontent = accontent;
	}
	
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
		
	public int getAcparent() {
		return acparent;
	}
	public void setAcparent(int acparent) {
		this.acparent = acparent;
	}
	public int getAcdepth() {
		return acdepth;
	}
	public void setAcdepth(int acdepth) {
		this.acdepth = acdepth;
	}
	public int getAcorder() {
		return acorder;
	}
	public void setAcorder(int acorder) {
		this.acorder = acorder;
	}
	@Override
	public String toString() {
		return "ReplyDTO [acno=" + acno + ", ano=" + ano + ", mno=" + mno + ", mnick=" + mnick + ", accontent="
				+ accontent + ", acdate=" + acdate + ", acparent=" + acparent + ", acdepth=" + acdepth + ", acorder="
				+ acorder + "]";
	}
	
	
	
}
