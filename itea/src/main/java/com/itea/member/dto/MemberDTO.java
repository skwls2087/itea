package com.itea.member.dto;

import java.sql.Date;

public class MemberDTO {
	
	//db에는 앞에 m이 붙은 이름으로 저장됨(ex.mno)
	private int no;
	private String mail;
	private String pw;
	private String name;
	private String phone;
	private String nick;
	private String sex;
	private String birth;
	private String gradu;
	private Date date;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGradu() {
		return gradu;
	}
	public void setGradu(String gradu) {
		this.gradu = gradu;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", mail=" + mail + ", pw=" + pw + ", name=" + name + ", phone=" + phone
				+ ", nick=" + nick + ", sex=" + sex + ", birth=" + birth + ", gradu=" + gradu + ", date=" + date + "]";
	}
	
}
