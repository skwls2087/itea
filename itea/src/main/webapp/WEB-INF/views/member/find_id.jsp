<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces = "true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/find.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$("#loginBtn").click(function(){
		location.href='../member/loginFrm.co';
	})
})
</script>
<title>아이디 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4" id="find_container">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
			<table id="find_mail">
				<c:forEach var="list" items="${LIST}">
				<tr>
				<td id="social">
				<c:set var="mmail" value="${list.mmail}"/>
       					<c:choose >
						<c:when test="${list.mclass==1}">
						</c:when>
						<c:when test="${list.mclass==2}">
							&nbsp<img src="${pageContext.request.contextPath}/resources/img/naver-logo.png" 
							width="15"/>
						</c:when>
						<c:when test="${list.mclass==3}">
							&nbsp<img src="${pageContext.request.contextPath}/resources/img/kakao-logo.png"
							width="15"/>
						</c:when>
						<c:when test="${list.mclass==4}">
							&nbsp<img src="${pageContext.request.contextPath}/resources/img/google-logo.png"
							width="15"/>
						</c:when>
					</c:choose>
					</td>
					<td>
					${fn:substring(mmail,0,3)}
					<c:forEach var="i" begin="1" end="${fn:indexOf(mmail,'@')-3}">
						<c:forEach var="j" items="*">
							*
		        </c:forEach>
		        
        	</c:forEach>
        	<c:set var="email" value="${fn:indexOf(mmail,'@')}"/>
        	<c:set var="len" value="${fn:length(mmail)}"/>
        	${fn:substring(mmail,email,len)}
				</td>
					</tr>
				</c:forEach><br/>
				</table>
				<p class="w3-center">
					<button type="button" id=loginBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Login</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
				
			</div>
		</div>
	</div>
</body>
</html>

