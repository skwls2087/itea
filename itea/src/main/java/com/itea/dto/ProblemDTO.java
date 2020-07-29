package com.itea.dto;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProblemDTO {

	private int pno; //문제번호
	private int mno; //출제자
	private String mnick; //출제자 닉네임
	private int lqno; //자격증코드
	private int pyear; //출제년도
	private int ptype; //객관1,주관2,서술3
	private String pdetail; //문제
	private String pcomment; //해설
	private int plike; //좋아요 수
	private int phate; //싫어요 수
	private int psolve; //전체 푼 수
	private int pcorrect; //문제 맞은 수
	
	private MultipartFile file; //파일받기
	
	private String pimg; //출제이미지
	
	//객관식 선지
	private String[] choice;
	
	//객관식정답
	private String correct;
	
	//주관식,서술형 정답
	private String[] correctList;
	
	//출제년도 list
	private int[] pyearList; //출제년도

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
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

	public int getPsolve() {
		return psolve;
	}

	public void setPsolve(int psolve) {
		this.psolve = psolve;
	}

	public int getPcorrect() {
		return pcorrect;
	}

	public void setPcorrect(int pcorrect) {
		this.pcorrect = pcorrect;
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

	public String[] getChoice() {
		return choice;
	}

	public void setChoice(String[] choice) {
		this.choice = choice;
	}

	public String getCorrect() {
		return correct;
	}

	public void setCorrect(String correct) {
		this.correct = correct;
	}

	public String[] getCorrectList() {
		return correctList;
	}

	public void setCorrectList(String[] correctList) {
		this.correctList = correctList;
	}

	public int[] getPyearList() {
		return pyearList;
	}

	public void setPyearList(int[] pyearList) {
		this.pyearList = pyearList;
	}

	@Override
	public String toString() {
		return "ProblemDTO [pno=" + pno + ", mno=" + mno + ", mnick=" + mnick + ", lqno=" + lqno + ", pyear=" + pyear
				+ ", ptype=" + ptype + ", pdetail=" + pdetail + ", pcomment=" + pcomment + ", plike=" + plike
				+ ", phate=" + phate + ", psolve=" + psolve + ", pcorrect=" + pcorrect + ", file=" + file + ", pimg="
				+ pimg + ", choice=" + Arrays.toString(choice) + ", correct=" + correct + ", correctList="
				+ Arrays.toString(correctList) + ", pyearList=" + Arrays.toString(pyearList) + "]";
	}

}