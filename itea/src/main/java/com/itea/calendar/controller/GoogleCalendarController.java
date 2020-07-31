package com.itea.calendar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.CalendarList;
import com.google.api.services.calendar.model.CalendarListEntry;
import com.itea.calendar.dto.GoogleCalendarDTO;
import com.itea.calendar.service.GoogleCalendarService;

@Controller
public class GoogleCalendarController {
	
	@Autowired
	GoogleCalendarService service;
	
	@RequestMapping("/GoogleCalendar")
	public String GoogleCalendar() {
		System.out.println("구글 달력 접속합니다.");
		return "calendar/GoogleCalendar";
	}
	
	@RequestMapping("/schedule")
	public String GoogleCalendarSchedule() {
		System.out.println("구글 달력 스케쥴 항목에 접속합니다.");
		return "calendar/schedule";
	}

	private Logger logger = LoggerFactory.getLogger(GoogleCalendarController.class);
	
	//Calendar List
	@RequestMapping(value="/GoogleCalendarList", method=RequestMethod.GET)
	public String GoogleCalendar(Model model) {
		System.out.println("구글 달력 리스트를 출력합니다.");
		logger.info("GoogleCalendarList");
		try {
			Calendar service		  = 
					GoogleCalendarService.getCalendarService();
			CalendarList calendarList = 
					service.calendarList().list().setPageToken(null).execute();
			List<CalendarListEntry> items = calendarList.getItems();
			model.addAttribute("items", items);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "GoogleCalendar";
	}
	
}




