<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<style>
#selectButton{
	padding:20px;
	width:50%;
    margin: 9px;
    font-size: 16px;
}
</style>

<div id="problem-solve-container">
	<div id="problem-solve">
		<span id="problem-header">문제 선택</span><br/><br/>
		<hr><br/>
			<a href="${pageContext.request.contextPath}/problem/solveProblem.co"><input type="button" class="btn btn-outline-info" id="selectButton" value="자격증별 문제"/></a><br/>
		<c:if test="${MNO!=null}">
			<a href="${pageContext.request.contextPath}/problem/myProblemList.co"><input type="button" class="btn btn-outline-info" id="selectButton" value="내가 만든 문제"/></a><br/>
			<a href="${pageContext.request.contextPath}/problem/scrapProblemList.co"><input type="button" class="btn btn-outline-info" id="selectButton" value="즐겨찾기한 문제"/></a><br/>
        </c:if>
        <c:if test="${MNICK=='관리자'}">
			<br/><a href="${pageContext.request.contextPath}/problem/errorProblemList.co"><input type="button" class="btn btn-outline-danger" id="selectButton" value="신고된 문제"/></a>
        </c:if>
   </div>
</div>

