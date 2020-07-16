package com.itea.admin.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.itea.admin.service.AdminService;
import com.itea.dao.adminDAO;
import com.itea.util.Visitor;

@WebListener
public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
    	System.out.print("세션시작-");
    	
    	int todayCount = 0;
    	int totalCount = 0;
        adminDAO adminDAO = new adminDAO();
        AdminService adminSV = new AdminService();
        Visitor vo = new Visitor();
        
        try {
        	//전체 방문자수 +1
        	adminSV.setVisitTotalCount(vo);
        	// 오늘 방문자 수
			todayCount = adminSV.getVisitTodayCount(vo);
			// 전체 방문자 수
			totalCount = adminSV.getVisitTotalCount(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
        System.out.print("세션시작-"+vo);
        System.out.print("세션시작-"+todayCount);
        System.out.print("세션시작-"+totalCount);
        
        HttpSession session = se.getSession();
        
        // 세션 속성에 담아준다.
        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    	System.out.println("세션삭제");
    }
 
}