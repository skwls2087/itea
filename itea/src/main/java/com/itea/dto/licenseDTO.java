package com.itea.dto;

public class licenseDTO {

	private int lno;  		//자격증 코드       N.N
	private String lname;   //자격증이름        N.N
	private String lorg;    //자격증발급기관  N.N
	private String lfee;    //응시료
	private String lclass;  //자격증분류기준
	private String lreq; 	//자격요건
	private String ldetail; //시험과목
	private String lcut; 	//검정기준합격기준
	private String linfo; 	//자격증정보
	private String la;		//관련페이지(시험일정)
	private String lqclass; //시험 유형
	private int lqno;       //번호
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	/*public int getLqno() {
		return lqno;
	}
	public void setLqno(int lqno) {
		this.lqno = lqno;
	}*/
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLorg() {
		return lorg;
	}
	public void setLorg(String lorg) {
		this.lorg = lorg;
	}
	public String getLfee() {
		return lfee;
	}
	public void setLfee(String lfee) {
		this.lfee = lfee;
	}
	public String getLclass() {
		return lclass;
	}
	public void setLclass(String lclass) {
		this.lclass = lclass;
	}
	public String getLreq() {
		return lreq;
	}
	public void setLreq(String lreq) {
		this.lreq = lreq;
	}
	public String getLdetail() {
		return ldetail;
	}
	public void setLdetail(String ldetail) {
		this.ldetail = ldetail;
	}
	public String getLcut() {
		return lcut;
	}
	public void setLcut(String lcut) {
		this.lcut = lcut;
	}
	public String getLinfo() {
		return linfo;
	}
	public void setLinfo(String linfo) {
		this.linfo = linfo;
	}
	public String getLa() {
		return la;
	}
	public void setLa(String la) {
		this.la = la;
	}
	public String getLqclass() {
		return lqclass;
	}
	public void setLqclass(String lqclass) {
		this.lqclass = lqclass;
	}
	@Override
	public String toString() {
		return "licenseDTO [lno=" + lno + ", lname=" + lname + ", lorg=" + lorg + ", lfee=" + lfee + ", lclass="
				+ lclass + ", lreq=" + lreq + ", ldetail=" + ldetail + ", lcut=" + lcut + ", linfo=" + linfo + ", la="
				+ la + ", lqclass=" + lqclass+"]";
	}
	
	

}
