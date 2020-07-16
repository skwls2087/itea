package com.itea.admin.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.itea.admin.service.AdminService;
import com.itea.util.Visitor;

@WebListener
public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
    	System.out.print("세션시작-");
        
        	int todayCount;
        	int totalCount;
        	AdminService adminSV = new AdminService();
        	Visitor vo = new Visitor();
        	
        	try {
        	//전체 방문자수 +1
        		adminSV.setVisitTotalCount(vo);
        	// 오늘 방문자 수
			todayCount = adminSV.getVisitTodayCount(vo);
			// 전체 방문자 수
			totalCount = adminSV.getVisitTotalCount(vo);
			
			System.out.print("세션시작-"+vo);
			System.out.print("세션시작-"+todayCount);
			System.out.print("세션시작-"+totalCount);
			
			HttpSession session = se.getSession();
			ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()); 
			adminSV = (AdminService) context.getBean("adminSV");
			
			// 세션 속성에 담아준다.
			session.setAttribute("totalCount", totalCount); // 전체 방문자 수
			session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
		} catch (Exception e) {
			e.printStackTrace();
			
		}
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    	System.out.println("세션삭제");
    }
 
}