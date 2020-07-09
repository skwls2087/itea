package com.itea.dto;

import java.util.Date;

public class AskDTO {
	
	 private int 	ano;
	 private String atitle;
	 private String acontent;
	 private String anick;
	 private String lname;		//자격증이름
	 private int 	pno;		//문제번호
	 private Date	adate; 
	 private int	ahit;
	 private int    start;	 	 //시작 글번호
	 private int    end;		 //끝 글번호
	 private int    nowPage; 	 //보고싶은 페이지
	 private int    size=5;
	 
	 
	
	public AskDTO() {
		
	} 
	 
	public AskDTO(String atitle, String acontent, int pno, String anick) {
		this.atitle=atitle;
		this.acontent=acontent;
		this.pno=pno;
		this.anick=anick;
	}

	public AskDTO(String atitle, String acontent, int pno, int ano) {
		this.atitle=atitle;
		this.acontent=acontent;
		this.pno=pno;
		this.ano=ano;
	}

	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	public int getAhit() {
		return ahit;
	}
	public void setAhit(int ahit) {
		this.ahit = ahit;
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
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getAnick() {
		return anick;
	}

	public void setAnick(String anick) {
		this.anick = anick;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}


	

	
	
	 
	 
	 
}
