<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.error-page{
	margin:55px auto;
	text-align:center;
	width:80%;
	font-family: 'Noto Sans KR', sans-serif;
	color:#6c757d;
}
.error-header{
	font-size:35px;
	margin:33px 0;
}
.error-main{
	font-size:20px;
}
.error-footer{
	font-size:15px;
}
#error-button{
	width: 150px;
    height: 50px;
    font-size: 21px;
}
</style>

<div class="error-page">
	<img src="${pageContext.request.contextPath}/resources/img/errorpage.png" width="220"/>
	<p class="error-header">예기치 못한 문제로 에러가 발생했습니다.</p>
	<p class="error-main">구체적인 에러상황을 메일로 보내주시면 관리자가 빠르게 조치하도록 하겠습니다.<br/>불편함을 드려서 죄송합니다. 앞으로 더 나은 서비스를 제공하기 위해 노력하겠습니다.</p> 
	<p class="error-footer">문의메일:iteaweb20@gmail.com</p>
	<a href="<%= request.getContextPath()%>/">
	<input type="button" id="error-button" class="btn btn-outline-secondary" value="메인으로 이동"></a>
</div>