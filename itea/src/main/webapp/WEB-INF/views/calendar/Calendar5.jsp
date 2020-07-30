<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.1.0/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.1.0/lib/main.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyAVIOOupclxyUQEFJ_XtOcfdc7BzbQYWgY',
    eventSources: [
      {
        googleCalendarId: '468luudes1qj4bdj1p4d8k6mro@group.calendar.google.com',
        className: '정보처리기사'
      },
      {
        googleCalendarId: 'a7ob6dtqanjd6jvas1fpjaa8i4@group.calendar.google.com',
        className: '정보처리산업기사'
      },
      {
         googleCalendarId: 'bockikpkbi8al3sq8u5c74ik6c@group.calendar.google.com',
         className: '네트워크관리사'
      }
    ]
  });

  calendar.render();
});
</script>
<style>
#calendar{
	width:60%;
	margin:20px auto;
}
</style>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

