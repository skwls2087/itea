<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">

<title>아이티어</title>

<!-- 부트스트랩 url 연결 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<!-- 구글폰트-굵은글씨표현 -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- font-family: 'Do Hyeon', sans-serif; -->

<!-- 얇은 글씨 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<!-- font-family: 'Noto Sans KR', sans-serif; -->

<!-- 굵은 글씨 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<!-- font-family: 'Noto Sans KR', sans-serif; -->

<!-- 통통 특이한 글씨 -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<!-- font-family: 'Black Han Sans', sans-serif; -->

<!-- 귀욤 손글씨 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<!-- font-family: 'Nanum Pen Script', cursive; -->

<!-- 동글동그한 글씨 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- font-family: 'Jua', sans-serif; -->

<!-- 로봇같은 글씨 -->
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300;500&display=swap" rel="stylesheet">
<!-- font-family: 'Sunflower', sans-serif; -->

<!-- JSTL 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 네이버 아이디찾기 링크 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- 제이쿼리 선언 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">

<script>

	 /*태강-채팅*/
		function sendMessage(form){

			//서버로 전송
			$.post('<%= request.getContextPath()%>/chat/addMessage.co',{
				writer : form.writer.value,
				body : form.body.value
			},function(data){

			},'json');
			form.body.value='';
			form.body.focus();
			
		}
		
		var Chat__lastReceivedMessageId= -1;
		
		function Chat__loadNewMessages(){
			
			var objDiv=document.getElementById("chat-list");
			objDiv.scrollTop=objDiv.scrollHeight;
			
			$.get('<%= request.getContextPath()%>/chat/getMessages.co', {
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
			
			/*나진 채팅 js효과*/
			
			//텍스트 입력하면 버튼 활성화하기
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
			
			//채팅 보내고나면 버튼 비활성화
			$(document).on("click",".chat-submit",function(event){
				$("#chat-form").submit();
				$("#chat-submit").attr('src','${pageContext.request.contextPath}/resources/img/up.png');
     		$("#chat-submit").removeClass();
			});
			
			//엔터누르면 채팅전송
			$(document).on("keydown","#chattext",function(key){
          if (key.keyCode == 13) {
        	  if($(this).val().length>0){
        		  $("#chat-form").submit();
        		  $("#chat-submit").attr('src','${pageContext.request.contextPath}/resources/img/up.png');
		       		$("#chat-submit").removeClass();
		       		return false;
		       	}else{
		       		return false;
		       	}
          }
      });

			//채팅 배너 클릭했을 때 채팅창 보이게하기
			$("#chat-banner").click(function(){
				$("#pop").css('display','');
			})
			
			//채팅 배너 클릭했을 때 활성화
			$(document).on("click",".chat-banner",function(event){
				$("#pop").css('display','');
				$("#chat-banner").removeClass();
				$("#chat-banner").addClass('chatOn');
				$("#chat-banner").attr('src','${pageContext.request.contextPath}/resources/img/chatclick.png');
				
			})
			
			//채팅 배너 클릭했을 때 비활성화
			$(document).on("click",".chatOn",function(event){
				$("#pop").css('display','none');
				$("#chat-banner").removeClass();
				$("#chat-banner").addClass('chat-banner');
				$("#chat-banner").attr('src','${pageContext.request.contextPath}/resources/img/chat.png');
			})
			
		})

</script>

</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark" id="itea-header"> 
  <a class="navbar-brand " href="<%= request.getContextPath()%>/" id="main-logo"><strong>아이티:어</strong></a>
  <button class="navbar-toggler m-2" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item m-2">
        <a class="nav-link" href="<%= request.getContextPath()%>/license/licenseList.co">자격증소개</a>
      </li>
      <li class="nav-item m-2">
        <a class="nav-link" href="<%= request.getContextPath()%>/problem/problemMain.co">문제풀이</a>
      </li>
      <li class="nav-item  m-2">
        <a class="nav-link" href="<%= request.getContextPath()%>/ask/askList.co">질문/토론</a>
      </li>
      <li class="nav-item  m-2">
        <a class="nav-link" href="<%= request.getContextPath()%>/qa/qaFrm.co">Q&A</a>
      </li>
      <li class="nav-item  m-2">
        <a class="nav-link" id="it-test" href="<%= request.getContextPath()%>/itLab/itLab.co">IT연구소</a>
      </li>
    </ul>
    
    <ul class="navbar-nav navbar-right">
    	 <!-- 비로그인시 -->
	     <c:if test="${empty MNO}">
	      <li class="nav-item m-1">
	        <a class="nav-link" href="<%= request.getContextPath()%>/member/joinFrm.co">회원가입</a>
	      </li>
	      <li class="nav-item m-1">
	        <a class="nav-link" href="<%= request.getContextPath()%>/member/loginFrm.co">로그인</a>
	      </li>
	     </c:if>
	     
	     <!-- 로그인시 -->
	     <c:if test="${!empty MNO}">
	     
	      <li class="nav-item m-1" id="right-nav">
	      <div class="container"> 
		        <div class="dropdown"> 
			        <a id="mNick" class="dropdown-toggle" href="#" data-toggle="dropdown"> ${MNICK}님 </a> 
			        <div class="dropdown-menu"> 
			        <c:if test="${MNICK eq '관리자' }">
			       	  <a class="dropdown-item" href="<%= request.getContextPath()%>/admin/memberList.co">회원관리</a> 
			       	</c:if>  
				        <a class="dropdown-item" href="<%= request.getContextPath()%>/member/modifyFrm.co">정보수정</a> 
				        <a class="dropdown-item" href="<%= request.getContextPath()%>/member/logoutProc.co">로그아웃</a> 
			        </div> 
		        </div> 
	        </div>
	      </li>
	      
	     </c:if>
    </ul>
  </div>
</nav>

<div id="pop" class="chatPop" style="display:none;">
	<div class="main-chat">
		<div style="display:none" id="chatname">${MNICK}</div>
		<div class="container" id="chatbox">
		<div class="chat-header">아이티어 채팅</div>
		<div class="chat-list" id="chat-list" style="overflow-y:scroll;height:550px; border:1 solid #000000;"></div>
		
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

<!-- 채팅 퀵 배너 -->
<img id="chat-banner" class="chat-banner" src="${pageContext.request.contextPath}/resources/img/chat.png" width="40"/>
