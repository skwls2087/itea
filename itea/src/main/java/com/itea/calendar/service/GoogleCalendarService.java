package com.itea.calendar.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.calendar.model.CalendarList;
import com.google.api.services.calendar.model.CalendarListEntry;

public class GoogleCalendarService {
	
	public static final String APPLICATION_NAME
		= "Google Calendar API Java Quickstart";
	
	private static final File DATA_STORE_DIR
		= new File(System.getProperty("user.home"),
				".credentials/google_client_secret.json");
	
	private static FileDataStoreFactory DATA_STORE_FACTORY;
	
	private static final JsonFactory JSON_FACTORY 
		= JacksonFactory.getDefaultInstance();
	
	private static HttpTransport HTTP_TRANSPORT;
	
	private static final List<String> SCOPES 
		= Arrays.asList(CalendarScopes.CALENDAR);
	
	static {
		try {
			HTTP_TRANSPORT	   = GoogleNetHttpTransport.newTrustedTransport();
			DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
		} catch (Throwable t) {
			t.printStackTrace();
			System.exit(1);
		}
	}
	
/*	인증된 자격 증명 개체 생성
	@param HTTP_TRANSPORT The network HTTP Transport.
	@return An authorized Credential object.
	@throw IOException If the credentials.json file cannot be found.	*/
	public static Credential authorize() throws IOException {
		//클라이언트 암호 로드
		System.out.println("client_secret.json 파일 로드!");
		InputStream in = GoogleCalendarService.class
				.getResourceAsStream("/credentials/google_client_secret.json");
		
		GoogleClientSecrets clientSecrets 
			= GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
		
		//Build flow and 사용자 권한 부여 요청을 trigger.
		GoogleAuthorizationCodeFlow flow 
			= new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
			.setDataStoreFactory(DATA_STORE_FACTORY)
			.setAccessType("offline").build();
		
		Credential credential 
			= new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");

		System.out.println("Credentials saved to :" + DATA_STORE_DIR.getAbsolutePath());
		
		return credential;
	}
	
	public static Calendar getCalendarService() throws IOException {
		Credential credential = authorize();
		
		return new Calendar.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
				.setApplicationName(APPLICATION_NAME).build();
	}
	
	//Calendar 조회부분
	public static void main(String[] args) throws IOException {
		System.out.println("구글 달력 조회하기~~");
		Calendar service = getCalendarService();
		String pageToken = null;
		do {
			CalendarList calendarList
				= service.calendarList().list().setPageToken(pageToken).execute();
			List<CalendarListEntry> items1 = calendarList.getItems();
			
			for(CalendarListEntry calendarListEntry : items1) {
				System.out.println("달력 리스트 " + calendarListEntry.getSummary());
				System.out.println("달력 리스트 user " + calendarListEntry.getId());
			}
			
			pageToken = calendarList.getNextPageToken();			
		} while (pageToken != null);
	}
}


