package com.itea.member.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dao.MemberDAO;
import com.itea.member.dto.MemberDTO;

public class MemberSercive implements MemberServiceImp {

	MemberDAO memberDAO = new MemberDAO();


	// 이메일 중복 검사(AJAX)
	@Override
	public void check_mmail(String mmail, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_mmail(mmail));
		out.close();
	}

	// 회원가입
	@Override
	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (memberDAO.check_mmail(member.getMmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			memberDAO.join_member(member);
			return 1;
		}
	}

}
