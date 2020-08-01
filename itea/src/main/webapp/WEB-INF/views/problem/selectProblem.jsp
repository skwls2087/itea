<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-solve-container">
	<div id="problem-solve">
		<span id="problem-header">문제 선택</span><br/><br/>
		<hr><br/>
			<a href="solveProblem.co">자격증별 문제</a>
			<a href="${pageContext.request.contextPath}/problem/myProblemList.co">내가 만든 문제</a>
			<a href="${pageContext.request.contextPath}/problem/scrapProblemList.co">즐겨찾기 문제</a>
      <c:if test="${MNICK=='관리자'}">
				<a href="#">신고된 문제</a>
      </c:if>
   </div>
</div>

