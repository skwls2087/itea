package com.itea.calendar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private Logger logger = LoggerFactory.getLogger(GoogleCalendarController.class);
	
	//Calendar List
	@RequestMapping(value="/GoogleCalendar.co", method=RequestMethod.GET)
	public String GoogleCalendar(Model model) {
		logger.info("calendarList");
		try {
			Calendar service		  = GoogleCalendarService.getCalendarService();
			CalendarList calendarList = 
					service.calendarList().list().setPageToken(null).execute();
			List<CalendarListEntry> items = calendarList.getItems();
			model.addAttribute("items", items);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "GoogleCalendar";
	}
	
	//Calendar Modify
	@RequestMapping(value="GoogleCalendarModify.co", method=RequestMethod.POST)
	public String GoogleCalendarModify(GoogleCalendarDTO calDto) {
		logger.info("GoogleCalendarModify", calDto.toString());
		try {
			Calendar service = GoogleCalendarService.getCalendarService();
			com.google.api.services.calendar.model.Calendar calendar = 
					service.calendars().get(calDto.getCalendarId()).execute();
			calendar.setSummary(calDto.getSummary());
			service.calendars().update(calendar.getId(), calendar).execute();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/GoogleCalendar.co";
	}
	
	//Calendar Delete
	
	public String GoogleCalendarDelete(HttpServletRequest httpreq) {
		logger.info("GoogleCalendarDelete");
		
		String[] chkVal = httpreq.getParameterValues("chkVal");
		try {
			Calendar service = GoogleCalendarService.getCalendarService();
			for (String calendarId : chkVal) {
				service.calendars().delete(calendarId).execute();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/GoogleCalendar.co";
	}
	
	//Calendar Moving
	
	public String GoogleSchdule(Model model, String calendarId, String title) {
		logger.info("GoogleSchdule");
		model.addAttribute("calendarId", calendarId);
		model.addAttribute("title", title);
		return "GoogleSchdule";
	}
}




