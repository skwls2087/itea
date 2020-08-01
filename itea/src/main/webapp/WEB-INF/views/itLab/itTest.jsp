<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/itTest.css">

<div class="itTest">
	<p>개발자 직업 만족도 TEST</p>
	<h2 class="font">당신은 개발자로써 만족하며 살 수 있을까요?</h2><br/>
	<img src="<%= request.getContextPath()%>/resources/img/question2.png" width="200"/><br/><br/>
	<h4 class="font">당신이 스스로를 바라볼 때,<br/>
	해당 질문에 대해 가장 적합한 문장을 선택해주세요. </h4>
	<br/><br/>
	<a href="<%= request.getContextPath()%>/itLab/itTestDetail.co">
	<input type="button" id="startBtn" name="startBtn" class="startBtn" value="시작하기"/></a>
	<br/><br/><br/>
</div>