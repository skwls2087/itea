<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang = "ko">
<head>
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey.css">
</head>	
<body>
<h1>결과다~! 집중해라~!</h1>
<c:if test="${RESULT==0 }"> 
<div class="survey1">
	0이 나온 당신, 그냥 꿈 접어 아직 인생 길어 다른거 공부해 <br/>
	니가 하고 싶다고 해서 잘 될 가능성은 제로인데<br/>
	정말 열정이 있으면 해봐.. 근데 겁나 노력해야해
</div>
</c:if>
<c:if test="${RESULT==1 }">
<div class="survey1">
 	1이 나온 당신, 애매하게 공부할 거면 나중에 기분만 나빠 다른거 공부해<br/>
 	원래 잘하고 못하는 것보다도 애매한게 제일 위험해<br/>
 	10년을 고생해서 배웠는데, 매일 출근이 지옥 같으면<br/>
 	인생살맛 나겠어?<br/>
 	그래도 조금만 노력하고 인식만 바꾸면 잘 적응 할 수 있으니까<br/>
 	너가 의지가 있다면 해봐.. 노력은 필수~!! 이직은 선택이야~!
</div>
</c:if>
<c:if test="${RESULT==2 }"> 
<div class="survey1">
 2가 나온 당신, 개발자에 좋다고 하는데 그 마음 유지할 거 아님 다른거 공부해<br/>
 너가 개발자로 살면 직업에 대한 만족도는 좋을거야 .<br/>
 즉 평생 행복하게 돈 벌고 싶으면 지금의 테스트에선 어울린다는데...<br/>
너가 노력안하면 말짱 꽝이야.. <br/>
그러니까 엄청 노력해 ! 스펀지 같은 느낌으로 다 흡수 할 수 있으니까. </br>
</div>
</c:if>
 
 <a href="<%= request.getContextPath()%>/itLab/itLab.co"><input type="button" value="되돌아가기"></a>
<!-- <form name=frm>
	<input type="hidden" name="str"/>
</form>	 -->
</body>