<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-proc">
	<div id="problem-pno">#<span id="problemPNO">${problem.pno}</span></div>
	<a href="${pageContext.request.contextPath}/ask/problemAsk.co?pno=${problem.pno}" id="problem-ask">질문하기</a>
	<a href="${pageContext.request.contextPath}/ask/problemBoard.co?pno=${problem.pno}" id="problem-board">질문검색</a>

	<div class="processing">
		<span id="psolve">${solve+1}</span>/<span id="ptotal">${total+1}</span>
	</div>
	<div class="progress" id="processing-bar">
	  <div class="progress-bar" role="progressbar" style="width:${(solve/total*100)+1}%;background:#2E9AFE;" 
	  	aria-valuenow="10" aria-valuemin="0" aria-valuemax="${total+1}"></div>
	</div>
	<div id="problem-info">
		<br/>
		<div class="problem-nick">
		<c:if test="${problem.mnick=='관리자'}">
			기출문제
		</c:if>
		<c:if test="${problem.mnick!='관리자'}">
			출제자: ${problem.mnick}
		</c:if>
		</div>
		<div class="problem-percent">
		<c:if test="${problem.psolve!=0}">
		<fmt:parseNumber var="correct" integerOnly="true" value="${problem.pcorrect/problem.psolve*100}"/>
		정답률: ${correct}%
			
		</c:if>
		</div>
	</div>
	<div id="problem-question">Q. ${problem.pdetail}</div>
	${problem.pimg}
	<%-- <img src="${pageContext.request.contextPath}/upload/dd.jsp"> --%><br/>
	
	<!-- 객관식일때 -->
	<table>
	<c:if test="${problem.ptype==1}">
		<c:forEach items="${problem.choice}" var="choice" varStatus="status">
		<tr>
			<td valign=top>${status.count}. </td>
			<td><span id="solveChoice${status.count}">${choice}
				</span></td>
		</tr>
		</c:forEach>
	</c:if>
	</table>
	<br/>
	
	<!-- 주관,서술형일때 -->
	<c:if test="${problem.ptype!=1}">
		<input type="text"/>
	</c:if>
	
	<form id="nextProblem" action="nextProblem.co" method="post">
	<input type="button" class="btn btn-success center" id="problemScoring" value="채점하기" >
		<c:forEach items="${pnoList}" var="pno">
			<input type="hidden" name="pnoList" value="${pno}"/>
		</c:forEach>
		<input type="hidden" name="total" value="${total}"/>
		<input type="submit" id="next-problem-submit" class="btn btn-outline-secondary" value="다음문제" >
	</form>
</div>

<div class="problemScore" id="problem-wrong" style="display:none">
		<div id="problemScore-left">
			<img src="${pageContext.request.contextPath}/resources/img/close.png" width="50"/><br/>
			틀렸습니다!
		</div>
		<div id="problemScore-right">
			<a href="#">좋아요</a><a href="#">싫어요</a><a href="#"><img src="${pageContext.request.contextPath}/resources/img/star.png" style="cursor:pointer" width="20"/></a><br/>
			정답:<span id="problem-choice-correct">${problem.correct}</span><br/>
			해설:${problem.pcomment}<br/>
			<c:if test="${problem.ptype!=1}">
				<c:forEach items="${problem.correctList}" var="correct">
				핵심키워드:${correct} 
				</c:forEach>
			</c:if>
		</div>
	</div>
	
<div class="problemScore" id="problem-correct" style="display:none">
	<div id="problemScore-left">
		<img src="${pageContext.request.contextPath}/resources/img/correct.png" width="50"/><br/>
		정답입니다!
	</div>
	<div id="problemScore-right">
		<a href="#">좋아요</a><a href="#">싫어요</a><a href="#">즐겨찾기</a><br/>
		정답:<span id="problem-choice-correct">${problem.correct}</span><br/>
		해설:${problem.pcomment}<br/>
		<c:if test="${problem.ptype!=1}">
			<c:forEach items="${problem.correctList}" var="correct">
			핵심키워드:${correct} 
			</c:forEach>
		</c:if>
	</div>
</div>



	

    