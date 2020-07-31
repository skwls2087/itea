package com.itea.dto;

import org.springframework.web.multipart.MultipartFile;

public class WordCloud {

	private MultipartFile file; //파일받기
	private String pimg; //출제이미지
	
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

	@Override
	public String toString() {
		return "WordCloud [file=" + file + ", pimg=" + pimg + "]";
	}
	

}
