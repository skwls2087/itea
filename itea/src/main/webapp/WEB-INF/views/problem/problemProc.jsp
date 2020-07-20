<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

	<c:if test="${problem.ptype==1}">
	<p>객관식</p>
		출제자:${problem.mnick}
		Q.${problem.pdetail}<br/>
		<c:forEach items="${problem.choice}" var="choice">
		-${choice}<br/>
		</c:forEach>
		답:${problem.correct}<br/>
		해설:${problem.pcomment}<br/>
	</c:if>
	<c:if test="${problem.ptype!=1}">
	<p>주관식</p>
		Q.${problem.pdetail}<br/>
		답:${problem.pcomment}<br/>
		<c:forEach items="${problem.correctList}" var="correct">
		핵심키워드:${correct} 
		</c:forEach>
	</c:if>
	
	<form action="nextProblem.co" method="post">
	<c:forEach items="${pnoList}" var="pno">
		<input type="hidden" name="pnoList" value="${pno}"/>
	</c:forEach>
	<input type="submit" id="next-problem-submit" value="다음문제">
	</form>

    