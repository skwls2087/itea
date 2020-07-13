package com.itea.license.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itea.dao.licenseDAO;
import com.itea.dto.licenseDTO;


@Service
public class LicenseService {

	@Autowired
	licenseDAO lDao;
	licenseDTO lDto;
	
	public ArrayList<licenseDTO> getLicenseList() {
		ArrayList<licenseDTO>list=lDao.getLicenseList(lDto);
		return list;
	}

	public licenseDTO detailView(int lno) {
		lDto = lDao.detailView(lno);
		return lDto ;
	}

	public void insertProc(licenseDTO lDto) {
		lDao.insertProc(lDto);
	}

	public licenseDTO modifyInfo(int lno) {
		lDto=lDao.modifyInfo(lno);
		return lDto;
	}

	public void modify(licenseDTO lDto) {
		lDao.modify(lDto);
		
	}

	public void delete(int lno) {
		lDao.delete(lno);
	}


	
	
	


}
