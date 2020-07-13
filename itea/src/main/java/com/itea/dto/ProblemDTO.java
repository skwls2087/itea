package com.itea.dto;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class ProblemDTO {

	private int pno; //문제번호
	private int lqno; //자격증코드
	private int pyear; //출제년도
	private int ptype; //객관1,주관2,서술3
	private String pman; //출제자
	private String pdetail; //문제
	private String pcomment; //해설
	private int plike; //좋아요 수
	private int phate; //싫어요 수
	
	private MultipartFile file; //파일받기
	
	private String pimg; //출제이미지
	
	//객관식 선지
	private String[] choice;
	
	//정답
	private String correct;

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getLqno() {
		return lqno;
	}

	public void setLqno(int lqno) {
		this.lqno = lqno;
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

	public String getPcomment() {
		return pcomment;
	}

	public void setPcomment(String pcomment) {
		this.pcomment = pcomment;
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

	public String getCorrect() {
		return correct;
	}

	public void setCorrect(String correct) {
		this.correct = correct;
	}
	


	public String[] getChoice() {
		return choice;
	}

	public void setChoice(String[] choice) {
		this.choice = choice;
	}

	@Override
	public String toString() {
		return "ProblemDTO [pno=" + pno + ", lqno=" + lqno + ", pyear=" + pyear + ", ptype=" + ptype + ", pman=" + pman
				+ ", pdetail=" + pdetail + ", pcomment=" + pcomment + ", plike=" + plike + ", phate=" + phate
				+ ", file=" + file + ", pimg=" + pimg + ", choice=" + Arrays.toString(choice) + ", correct=" + correct
				+ "]";
	}

	

	
}
