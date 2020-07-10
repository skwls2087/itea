package com.itea.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProblemDTO {

	private int pno; //문제번호
	private int lno; //자격증코드
	private int ppilsil; //필기1,실기2
	private int pyear; //출제년도
	private int ptype; //객관1,주관2,서술3
	private String pman; //출제자
	private String pdetail; //문제
	private int plike; //좋아요 수
	private int phate; //싫어요 수
	
	private MultipartFile file; //파일받기
	
	private String pimg; //출제이미지
	
	//객관식 선지
	private String choice1;
	private String choice2;
	private String choice3;
	private String choice4;
	
	//정답
	private String correct;

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

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public String getChoice1() {
		return choice1;
	}

	public void setChoice1(String choice1) {
		this.choice1 = choice1;
	}

	public String getChoice2() {
		return choice2;
	}

	public void setChoice2(String choice2) {
		this.choice2 = choice2;
	}

	public String getChoice3() {
		return choice3;
	}

	public void setChoice3(String choice3) {
		this.choice3 = choice3;
	}

	public String getChoice4() {
		return choice4;
	}

	public void setChoice4(String choice4) {
		this.choice4 = choice4;
	}

	public String getCorrect() {
		return correct;
	}

	public void setCorrect(String correct) {
		this.correct = correct;
	}

	@Override
	public String toString() {
		return "ProblemDTO [pno=" + pno + ", lno=" + lno + ", ppilsil=" + ppilsil + ", pyear=" + pyear + ", ptype="
				+ ptype + ", pman=" + pman + ", pdetail=" + pdetail + ", plike=" + plike + ", phate=" + phate
				+ ", file=" + file + ", pimg=" + pimg + ", choice1=" + choice1 + ", choice2=" + choice2 + ", choice3="
				+ choice3 + ", choice4=" + choice4 + ", correct=" + correct + "]";
	}

	
	
}
