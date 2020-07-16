<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:forEach items="${problemList}" var="problem">
	<c:if test="${problem.ptype==1}">
	<p>객관식</p>
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
</c:forEach>
    