package com.itea.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.adminDAO;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;

public class AdminService {
	
	@Autowired
	adminDAO adminDAO;
	
	//회원목록
	public ArrayList<MemberDTO> memberList(PageUtil pInfo) throws Exception {
		//where rno between #{start} and #{end}에 해당하는 부분이
		//lineCount; //	한페이지당 보여주고 싶은 게시물의 개수로 우리는 3설정
		//보고싶은페이지	start	end
		//1			1		3
		//2			4		6
		MemberDTO mdto = new MemberDTO();
		int start= (pInfo.getNowPage()-1)*pInfo.getLineCount()+1;
		int end  = start+pInfo.getLineCount()-1;
			
		mdto.setStart(start);
		mdto.setEnd(end);
		
		ArrayList<MemberDTO> list = adminDAO.memberList(mdto);
		return list;
	}
		
	//페이징관련 정보
	public PageUtil getPageInfo(int nowPage) {
		int totalCount= adminDAO.getTotalCnt();
		
		//PageUtil(보고싶은페이지,   전체게시물수);
		//PageUtil(int nowPage, int totalCount);
		PageUtil pInfo = new PageUtil(nowPage, totalCount);
		//PageUtil객체생성자에서는 내부적으로
		//	한페이지당 보여주고 싶은 게시물의 개수는 3
		//	페이지 이동 기능은 3개까지 지정
		return pInfo;
	}
}
