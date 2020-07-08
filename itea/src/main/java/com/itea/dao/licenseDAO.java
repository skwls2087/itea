package com.itea.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.licenseDTO;

public class licenseDAO {

	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}

	
	public ArrayList<licenseDTO> getLicenseList(licenseDTO lDto) {
		
		return (ArrayList)session.selectList("license.licenseList", lDto);
	}

	public void  insertProc(licenseDTO lDto) {
		session.insert("license.insertProc",lDto);
	}

	public licenseDTO detailView(int lno) {
		return (licenseDTO)session.selectOne("license.detailView",lno);
	}


	public licenseDTO modifyInfo(int lno) {
		return (licenseDTO)session.selectOne("license.modifyInfo",lno);
	}


	public licenseDTO modify(licenseDTO lDto) {
		session.update("license.modify",lDto);	
		return null;
	}


	public void delete(int lno) {
		session.delete("license.delete",lno);
	}


	
	
}
