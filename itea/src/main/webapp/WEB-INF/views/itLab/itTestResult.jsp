<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey.css">

<script>
$(function(){
	$(".btn-back").click(function(){
		location.href='<%= request.getContextPath()%>/itLab/itLab.co';
	})
})
</script>

<c:if test="${RESULT==0 }"> 
	<div class="result">
	 <img src="${pageContext.request.contextPath}/resources/img/0.PNG" ><br/>
		<div id="result-header">에러만 보면 머리가 하얘지는 당신,<br/>여긴 어디이고 나는 누구인가</div>
		<div id="result-main">코드 한 줄에 한숨 한 번....<br/>당신의 출근길에 깊은 한숨이 예상됩니다.<br/>
		하지만 노력한다면 당신은 누구보다 훌륭한 개발자가 될 수 있습니다!</div>
	</div>
</c:if>

<c:if test="${RESULT==1 }">
	<div class="result">
	 <img src="${pageContext.request.contextPath}/resources/img/1.PNG" ><br/>
     <div id="result-header">개발자를 고민하는 당신,<br/>당신의 몸에 개발자의 피가 흐르고있어요!</div>
	 	<div id="result-main">당신은 개발자가 될 자격이 충분합니다.<br/>
	 	개발자로 일한다면 당신의 만족도는 50%!!<br/>
	 	당신의 노력에 따라 미래의 직업만족도가 달려있습니다.<br/>
	 	</div>
	</div>
</c:if>

<c:if test="${RESULT==2 }"> 
	<div class="result">
	<img src="${pageContext.request.contextPath}/resources/img/2.PNG" ><br/>
	 <div id="result-header">if(당신==개발자)는 true<br/>
	 당신은 개발자가 되기위해  태.어.난.사람</div>
	<div id="result-main">개발이 제일 쉬웠어요~<br/>개발자로 일한다면 당신의 만족도는 100%!!<br/>
	 조금만 더 노력한다면 제 2의 스티브잡스가 될지도 몰라요.</div>
	</div>
</c:if>
<div class="goItlab">
 <input type="button" class="btn-back" value="돌아가기">
</div>
</body>