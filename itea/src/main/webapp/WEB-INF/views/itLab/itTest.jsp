<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<html lang = "ko">
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/itTest.css">

<div class="center">
<h2 class="font">당신은 개발자로써 만족하며 살수 있을까요?</h2>
<h3 class="font">당신이 스스로를 바라볼때,<br/>
해당 질문에 대해 동의한다면 "맞다"를 비동의 한다면 "아니다"를 선택해주세요. </h3>
<br/><br/>
<a href="<%= request.getContextPath()%>/itLab/itTestDetail.co"><input type="button" id="startBtn" name="startBtn" class="btn btn-primary" value="시작하기"/></a>
<br/><br/><br/>