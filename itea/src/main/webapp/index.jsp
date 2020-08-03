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

	/*태강-채팅*/
	function sendMessage(form){
		form.writer.value = form.writer.value.trim();
		
		form.body.value = form.body.value.trim();
		
		if(form.body.value.length==0){
			alert('내용을 입력해주세요.');
			form.body.focus();
			return false;
		}
		
		//서버로 전송
		$.post('chat/addMessage.co',{
			writer : form.writer.value,
			body : form.body.value
		},function(data){

		},'json');
		form.body.value='';
		form.body.focus();
	}
	
	var Chat__lastReceivedMessageId= -1;
	
	function Chat__loadNewMessages(){
		$.get('chat/getMessages.co', {
			from : Chat__lastReceivedMessageId+1
		},  function(data){
				/* data.id.sort(function(a,b){
					return b-a;
				}); */
				for(var i=0; i<data.length;i++){
					var message = data[i];
					
					Chat__lastReceivedMessageId=message.id;
					Chat__drawMessages(message);
				}
			
				setTimeout(Chat__loadNewMessages,3000);
			
		}, 'json');
	}
		
	function Chat__drawMessages(message){
		
		name=document.getElementById("chatname").innerText;
		
		if(name==message.writer){
			
			var html = 
				'<div class="myname">'+message.writer+'</div><br/>'+
				'<div class="mychat">'+message.body+'</div><br/>'
				
				$('.chat-list').append(html)
		}else{
			var html = 
				'<div class="othername">'+message.writer+'</div><br/>'+
				'<div class="otherchat">'+message.body+'</div><br/>'
				
				$('.chat-list').append(html)
		}
			
		var objDiv=document.getElementById("chat-list");
		objDiv.scrollTop=objDiv.scrollHeight;
		
	}
		
	
	
	$(function(){
		
		Chat__loadNewMessages();
		
		$(document).on("keyup","#chattext",function(event){
	        var flag = true;
	        flag = $(this).val().length > 0 ? false : true;
	       	if(flag==true){
	       		$("#chat-submit").attr('src','${pageContext.request.contextPath}/resources/img/up.png');
	       		$("#chat-submit").removeClass();
	       	}else{
	       		$("#chat-submit").attr('src','${pageContext.request.contextPath}/resources/img/uphover.png');
	       		$("#chat-submit").addClass('chat-submit');
	       	}
	    });
		
		$(document).on("click",".chat-submit",function(event){
			$("#chat-form").submit();
		});
		
	})

</script>

<style>
.mychat{ 
	background:#ffd043; 
	word-break:break-all; 
	display:inline-block; 
	padding:5px; 
	border-radius:5px; 
	text-align:right;
	float:right;
	margin-bottom:5px;
}
.myname{
	color:black; 
	display:inline-block; 
	width:100%;
	text-align:right;
}
.otherchat{ 
	background:white; 
	word-break:break-all; 
	display:inline-block; 
	padding:5px; 
	border-radius:5px; 
	text-align:left;
	float:left;
	margin-bottom:5px;
}
.othername{
	color:black; 
	display:inline-block; 
	width:100%;
	text-align:left;
}
</style>

<div class="itea-main">
	<div class="main-calendar">
		<div id='calendar'></div>
	</div>
	<div class="main-chat">
		<div style="display:none" id="chatname">${MNICK}</div>
		<div class="container" id="chatbox">
		<div class="chat-header">아이티어 채팅</div>
		<div class="chat-list" id="chat-list" style="overflow-y:scroll;height:550px; padding:4px; border:1 solid #000000;"></div>
		
			<form id="chat-form" onsubmit="sendMessage(this); return false;">
				<c:if test="${empty MNO}">
					<input type="hidden" name="writer" value="비회원">
				</c:if>
				<c:if test="${!empty MNO}">
					<input type="hidden" name="writer" value="${MNICK}">
				</c:if>
				<div class="chat-footer">
					<textarea name="body" id="chattext" style="resize: none;" placeholder="내용을 입력해주세요"></textarea>
					<img src="${pageContext.request.contextPath}/resources/img/up.png" width="25" id="chat-submit" style="cursor:pointer"/>
				</div>
			</form>
		</div>
	</div>

</div>
