package com.itea.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itea.dao.memberDAO;
import com.itea.dto.MemberDTO;

@Service
public class ModifyService {
	
	@Autowired
	memberDAO mDao;
	
	public MemberDTO modifyInfo(int mno) {
		MemberDTO mDto = mDao.modifyInfo(mno);
		return mDto;
	}

	public MemberDTO modify(MemberDTO mDto) {
		mDto= mDao.modify(mDto);
		return mDto;
	}

	public void delete(int mno) {
		mDao.delete(mno);
	}

	public int checkNick(MemberDTO mDto) {
		int isNick=mDao.checkNick(mDto);
		return isNick;
	}


}
