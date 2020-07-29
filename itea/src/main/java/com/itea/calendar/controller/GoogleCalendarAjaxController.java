package com.itea.calendar.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;
import com.google.api.services.calendar.model.Events;
import com.itea.calendar.dto.GoogleCalendarDTO;
import com.itea.calendar.service.GoogleCalendarService;

@RestController
public class GoogleCalendarAjaxController {

	private Logger logger = LoggerFactory.getLogger(GoogleCalendarAjaxController.class);
	
	//달력 일정 데이터 처리
	@RequestMapping(value="GoogleCalendarEventList.co", method=RequestMethod.POST)
	public List<Event> GoogleCalendarEventList(GoogleCalendarDTO calDto) {
		logger.info("GoogleCalendarEventList" + calDto.toString());
		
		List<Event> items = new ArrayList<Event>();
		try {
			Calendar service = GoogleCalendarService.getCalendarService();
			Events events = 
					service.events()
					.list(calDto.getCalendarId()).
					setOrderBy("startTime").
					setSingleEvents(true).
					execute();
			items = events.getItems();	
		} catch (IOException e) {
			e.printStackTrace();
		}
		return items;
	}	
		
		
	//달력 일정 저장 처리	
	@RequestMapping(value="/GoogleCalendarEventAdd.co", method=RequestMethod.POST)
    public Map<String, Boolean> GoogleCalendarEventAdd(GoogleCalendarDTO calDto) {

        logger.info("GoogleCalendarEventAdd" + calDto.toString());
		
		boolean isc = false;
		try {
			Calendar service = GoogleCalendarService.getCalendarService();
			Event event      = 
					new Event()
					.setSummary(calDto.getSummary())
					.setDescription(calDto.getDescription());
			
			//달력 시작일
			DateTime startDateTime = new DateTime(calDto.getStartDateTime());
			EventDateTime starttime    = 
					new EventDateTime()
					.setDateTime(startDateTime)
					.setTimeZone("Asia/Seoul");
			event.setStart(starttime);
			
			//달력 종료일
			DateTime endDateTime  = new DateTime(calDto.getEndDateTime());
			EventDateTime endtime = 
					new EventDateTime()
					.setDateTime(endDateTime)
					.setTimeZone("Asia/Seoul");
			event.setEnd(endtime);
			event = service.events().insert(calDto.getCalendarId(), event).execute();
			isc   = true;
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isc", isc);
		return map;
	}
	
	//달력 일정 수정
	
	public Map<String, Boolean> GoogleCalendarEventModify(GoogleCalendarDTO calDto) {
		logger.info("GoogleCalendarEventModify" + calDto.toString());
		
		boolean isc = false;
		
		try {
			Calendar service = GoogleCalendarService.getCalendarService();
			Event 	 event   = 
					service.events()
					.get(calDto.getCalendarId(), calDto.getEventId())
					.execute();
			service.events()
			.update(calDto.getCalendarId(), event.getId(), event)
			.execute();
			isc = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isc", isc);
		return map;
	}
	
	//달력 일정 삭제
	@RequestMapping(value="/GoogleCalendarEventDeleteOne.co", method=RequestMethod.POST)
	public Map<String, Boolean> GoogleCalendarEventDeleteOne(GoogleCalendarDTO calDto) {
		logger.info("GoogleCalendarEventDeleteOne" + calDto.toString());
		
		boolean isc = false;
		
		try {
			Calendar service = GoogleCalendarService.getCalendarService();
			service.events()
			.delete(calDto.getCalendarId(), calDto.getEventId())
			.execute();
			isc = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isc", isc);
		return map;
	}
	
}



