package com.itea.dto;

public class ProblemDTO {

	private int pno; //문제번호
	private int lno; //자격증코드
	private int ppilsil; //필기1,실기2
	private int pyear; //출제년도
	private String pclass; //출제구문(연도내 회차)
	private int ptype; //객관1,주관2,서술3
	private String pman; //출제자
	private String pdetail; //해설
	private String pimg; //출제이미지
	private int plike; //좋아요 수
	private int phate; //싫어요 수
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public int getPpilsil() {
		return ppilsil;
	}
	public void setPpilsil(int ppilsil) {
		this.ppilsil = ppilsil;
	}
	public int getPyear() {
		return pyear;
	}
	public void setPyear(int pyear) {
		this.pyear = pyear;
	}
	public String getPclass() {
		return pclass;
	}
	public void setPclass(String pclass) {
		this.pclass = pclass;
	}
	public int getPtype() {
		return ptype;
	}
	public void setPtype(int ptype) {
		this.ptype = ptype;
	}
	public String getPman() {
		return pman;
	}
	public void setPman(String pman) {
		this.pman = pman;
	}
	public String getPdetail() {
		return pdetail;
	}
	public void setPdetail(String pdetail) {
		this.pdetail = pdetail;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
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
		return "ProblemDTO [pno=" + pno + ", lno=" + lno + ", ppilsil=" + ppilsil + ", pyear=" + pyear + ", pclass="
				+ pclass + ", ptype=" + ptype + ", pman=" + pman + ", pdetail=" + pdetail + ", pimg=" + pimg
				+ ", plike=" + plike + ", phate=" + phate + "]";
	}
	
}
