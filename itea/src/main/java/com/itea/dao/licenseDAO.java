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
		if(Integer.parseInt(lDto.getLqclass())==1) {
		session.insert("license.insertProc1",lDto);
		session.insert("license.insertProc2",lDto);
		}else if(Integer.parseInt(lDto.getLqclass())==2) {
		session.insert("license.insertProc3",lDto);
		session.insert("license.insertProc4",lDto);
		}else {
		session.insert("license.insertProc5",lDto);	
		}
	}

	public licenseDTO detailView(int lno) {
		return (licenseDTO)session.selectOne("license.detailView",lno);
	}


	public licenseDTO modifyInfo(int lno) {
		return (licenseDTO)session.selectOne("license.modifyInfo",lno);
	}


	public void modify(licenseDTO lDto) {
		System.out.println("naii###########"+lDto);
		session.update("license.modify",lDto);	
		session.delete("license.deleteClass",lDto.getLno());
		if(Integer.parseInt(lDto.getLqclass())==1) {
		session.insert("license.insertProc11",lDto);
		session.insert("license.insertProc22",lDto);
		}else if(Integer.parseInt(lDto.getLqclass())==2) {
		session.insert("license.insertProc33",lDto);
		session.insert("license.insertProc44",lDto);
		}else {
		session.insert("license.insertProc55",lDto);	
		}
	}


	public void delete(int lno) {
		System.out.println("deleteClass ");
		session.delete("license.deleteClass",lno);
		System.out.println("delete");
		session.delete("license.delete",lno);
		
	}


	
	
}
