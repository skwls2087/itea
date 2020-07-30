package com.itea.itLab.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itea.dao.itLabDAO;



@Service
public class ItLabService {

	@Autowired
	itLabDAO iDao;
	
	public int checkResult(String test) {
		 int result = iDao.resultCheck(test);
		return result;
	}



	
	
	


}
