package com.itea.dto;

import java.util.Date;

public class ChatDTO {
	private long id;
	private String writer;
	private String body;
	private String time;
	
	public ChatDTO(long id, String writer, String body,String time) {
		this.id=id;
		this.writer=writer;
		this.body=body;
		this.time=time;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	
	
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "ChatDTO [id=" + id + ", writer=" + writer + ", body=" + body + ", time=" + time + "]";
	}

	
	
	
	
}