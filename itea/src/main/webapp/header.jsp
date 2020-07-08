<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이티어</title>

<!-- 부트스트랩 url 연결 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<!-- 구글폰트-굵은글씨표현 -->
<!-- font-family: 'Black Han Sans', sans-serif; -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- 얇은 글씨 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!-- JSTL 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 네이버 아이디찾기 링크 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- 제이쿼리 선언 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
#main-logo{font-family: 'Do Hyeon', sans-serif; font-size:30px;}
#nav-join{float:right;}
#mNick{color:white;}
#right-nav .container{padding-left: 0px;margin-left:0px;}
.dropdown-menu{left:-80px;}
</style>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
  <a class="navbar-brand " href="<%= request.getContextPath()%>" id="main-logo"><strong>아이티어</strong></a>
  <button class="navbar-toggler m-2" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item m-2">
        <a class="nav-link" href="<%= request.getContextPath()%>/license/licenseList.co">자격증소개</a>
      </li>
      <li class="nav-item m-2">
        <a class="nav-link" href="#">문제풀이</a>
      </li>
      <li class="nav-item  m-2">
        <a class="nav-link" href="#">질문/토론</a>
      </li>
      <li class="nav-item  m-2">
        <a class="nav-link" href="#">채팅방</a>
      </li>
      <li class="nav-item  m-2">
        <a class="nav-link" href="#">Q&A</a>
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
