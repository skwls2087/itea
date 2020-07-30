package com.itea.dto;


public class ChatDTO {
	private long id;
	private String writer;
	private String body;
	
	public ChatDTO(long id, String writer, String body) {
		this.id=id;
		this.writer=writer;
		this.body=body;
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
	@Override
	public String toString() {
		return "ChatDTO [id=" + id + ", writer=" + writer + ", body=" + body + "]";
	}
	
	
	
	
	
}