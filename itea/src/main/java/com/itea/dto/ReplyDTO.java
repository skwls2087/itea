package com.itea.dto;

import java.util.Date;

public class ReplyDTO {
	
	private int acno; 		//댓글번호
	private int ano;  		//게시글 번호
	private String mnick;	//작성자 닉네임
	private String accontent;	//내용
	private Date acdate;	//작성일
	
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
	@Override
	public String toString() {
		return "replyDTO [acno=" + acno + ", ano=" + ano + ", mnick=" + mnick + ", accontent=" + accontent + ", acdate="
				+ acdate + "]";
	}


	
	
	
	
}
