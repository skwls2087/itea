<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 참조 문서 링크 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.1.0/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.1.0/lib/main.js'></script>

<script type='text/javascript'>

	/* 예인-달력 */
	document.addEventListener('DOMContentLoaded', function() {
  	var calendarEl = document.getElementById('calendar');

 	var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyAVIOOupclxyUQEFJ_XtOcfdc7BzbQYWgY',
    eventSources: [
      {
         googleCalendarId: 'bockikpkbi8al3sq8u5c74ik6c@group.calendar.google.com',
         className: '네트워크관리사',
       	 color: '#848ccf',
         //textColor: 'black' 
      },
      {
          googleCalendarId: 'p6vuu22cdfbbtof421l05u2v20@group.calendar.google.com',
          className: '리눅스마스터',
          color: '#93b5e1',
          //textColor: 'black' 
       },
      {
        googleCalendarId: '468luudes1qj4bdj1p4d8k6mro@group.calendar.google.com',
        className: '정보처리기사',
     	  color: '#e8505b',
     	  //textColor: 'black' 
      },
      {
          googleCalendarId: '9pe6j6ug4748n062j27sj006do@group.calendar.google.com',
          className: '웹디자인기능사',
       	  color: '#be5683',
       	  //textColor: 'black' 
        },
      {
          googleCalendarId: '0etqptotbj5dpuess1c9kq1m8c@group.calendar.google.com',
          className: '정보처리기능사',
       	  color: '#204051',
       	  //textColor: 'black' 
        },
      {
          googleCalendarId: 'a6u1bplljppb20h1ctss39k9eg@group.calendar.google.com',
          className: '워드프로세서',
       	  color: '#3b6978',
       	  //textColor: 'black' 
        },
      {
        googleCalendarId: 'a7ob6dtqanjd6jvas1fpjaa8i4@group.calendar.google.com',
        className: '정보처리산업기사',
      	color: '#726a95',
      	//textColor: 'black' 
      },
     {
         googleCalendarId: 'f6ssvq3aagqfcqnv7ote8fe9rk@group.calendar.google.com',
         className: '컴퓨터활용능력',
       	color: '#709fb0',
       	//textColor: 'black' 
       },
     {
         googleCalendarId: '79kg9go970kb9enjdi4tggg6c0@group.calendar.google.com',
         className: 'ADP/ADsP',
       	color: '#a0c1b8',
       	//textColor: 'black' 
       },
     {
         googleCalendarId: 'vgk12clr874eogdvn31ut6foio@group.calendar.google.com',
         className: 'PC 정비사',
       	color: '#f4ebc1',
       	textColor: 'black' 
       },
     {
         googleCalendarId: '687kr198d3f0uv22u8t8uh4na0@group.calendar.google.com',
         className: 'SQL 전문가/개발자',
       	color: '#127681',
       	//textColor: 'black' 
       }
    ]
  
  	});
  		calendar.render();
	});

</script>

<div class="itea-main">
	<div class="main-calendar">
		<div id='calendar'></div>
	</div>
	
</div>
