package com.itea.admin.listener;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.itea.dao.adminDAO;
import com.itea.util.Visitor;

@WebListener
public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
    //Spring 컨테이너에 등록된 특정 객체를 호출하고자 할 때는 
   	//ApplicationContext를 이용해 원하는 객체를 주입받는다.	
    	System.out.print("세션시작-");
    	HttpSession session = se.getSession();
    	ApplicationContext context = 
    			WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()); 
    	
    	int todayCount = 0;
    	int totalCount = 0;
        
        adminDAO adminDAO = (adminDAO)context.getBean("adminDAO");
        Visitor vo = new Visitor();
        
        try {
			todayCount = adminDAO.getVisitTodayCount(vo);
			totalCount = adminDAO.getVisitTotalCount(vo);
			if(todayCount!=0) {
				adminDAO.setVisitTotalCount2(vo);
			}else {
				adminDAO.setVisitTotalCount1(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        // 세션 속성에 담아준다.
        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    	System.out.println("세션삭제");
    }
 
}