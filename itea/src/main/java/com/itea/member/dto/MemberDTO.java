package com.itea.member.dto;

import java.util.Date;

public class MemberDTO {
   
   //sql문과 파라미터를
   private int mno;
   private int mclass;
   private String mmail;
   private String mpw;
   private String mname;
   private String mphone;
   private String mnick;
   private String msex;
   private String mbirth;
   private String mgradu;
   private Date mdate;
   private Date mnickdate;
   private long modifydate;
   
   public int getMno() {
      return mno;
   }
   public void setMno(int mno) {
      this.mno = mno;
   }

   public String getMmail() {
      return mmail;
   }
   public void setMmail(String mmail) {
      this.mmail = mmail;
   }
   public String getMpw() {
      return mpw;
   }
   public void setMpw(String mpw) {
      this.mpw = mpw;
   }
   public String getMname() {
      return mname;
   }
   public void setMname(String mname) {
      this.mname = mname;
   }
   public String getMphone() {
      return mphone;
   }
   public void setMphone(String mphone) {
      this.mphone = mphone;
   }
   public String getMnick() {
      return mnick;
   }
   public void setMnick(String mnick) {
      this.mnick = mnick;
   }
   public String getMsex() {
      return msex;
   }
   public void setMsex(String msex) {
      this.msex = msex;
   }
   public String getMbirth() {
      return mbirth;
   }
   public void setMbirth(String mbirth) {
      this.mbirth = mbirth;
   }
   public String getMgradu() {
      return mgradu;
   }
   public void setMgradu(String mgradu) {
      this.mgradu = mgradu;
   }
   public Date getMdate() {
      return mdate;
   }
   public void setMdate(Date mdate) {
      this.mdate = mdate;
   }
   public int getMclass() {
      return mclass;
   }
   public void setMclass(int mclass) {
      this.mclass = mclass;
   }
   public Date getMnickdate() {
      return mnickdate;
   }
   public void setMnickdate(Date mnickdate) {
      Date now=new Date();
      
      System.out.println(now);
      System.out.println(mnickdate);

      long diffDay = (now.getTime() - mnickdate.getTime())/ (24 * 60 * 60 * 1000);                                              
      modifydate=diffDay;  

      this.mnickdate = mnickdate;
   }
   
   public long getModifydate() {
      return modifydate;
   }

   @Override
   public String toString() {
      return "MemberDTO [mno=" + mno + ", mclass=" + mclass + ", mmail=" + mmail + ", mpw=" + mpw + ", mname=" + mname
            + ", mphone=" + mphone + ", mnick=" + mnick + ", msex=" + msex + ", mbirth=" + mbirth + ", mgradu="
            + mgradu + ", mdate=" + mdate + ", mnickdate=" + mnickdate + "]";
   }
   
   
}