<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-proc">

	<div class="processing">
		<span id="psolve">${solve}</span>/<span id="ptotal">${total}</span>
	</div>
	<div class="progress" id="processing-bar">
	  <div class="progress-bar" role="progressbar" style="width:${solve/total*100}%;background:#2E9AFE;" 
	  	aria-valuenow="10" aria-valuemin="0" aria-valuemax="${total}"></div>
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
		정답률: 10%
		</div>
	</div>
	<div id="problem-question">Q. ${problem.pdetail}</div>
	${problem.pimg}
	<img src="${pageContext.request.contextPath}/upload/dd.jsp"><br/>
	
	<!-- 객관식일때 -->
	<table>
	<c:if test="${problem.ptype==1}">
		<c:forEach items="${problem.choice}" var="choice" varStatus="status">
		<tr>
		<td>${status.count}. </td>
		<td><div class="choice">${choice}</div></td>
		</tr>
		</c:forEach>
	</c:if>
	</table>
	<br/>
	
	<!-- 주관,서술형일때 -->
	<c:if test="${problem.ptype!=1}">
		<input type="text"/>
	</c:if>

	<input type="submit" class="btn btn-success center" id="problem-scoring" value="채점하기" >
	
	<form id="nextProblem" action="nextProblem.co" method="post">
		<c:forEach items="${pnoList}" var="pno">
			<input type="hidden" name="pnoList" value="${pno}"/>
		</c:forEach>
		<input type="hidden" name="total" value="${total}"/>
		<div align="right">
		<input type="submit" id="next-problem-submit" class="btn btn-outline-secondary" value="다음문제" >
		</div>
	</form>
	
</div>


<div id="problem-score">
	<a href="#">좋아요</a><a href="#">싫어요</a><a href="#">즐겨찾기</a><a href="#">토론하기</a><br/>
	해설:${problem.pcomment}<br/>
	<c:if test="${problem.ptype!=1}">
		<c:forEach items="${problem.correctList}" var="correct">
		핵심키워드:${correct} 
		</c:forEach>
	</c:if>
</div>


	

    