<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-main-container">
	<div id="problem-main">
	  <h1 id="problem-main-header" class="display-5">자격증 <span id="problem-highlight">문제풀이</span> 시작하기</h1>
	  <hr class="my-4">
	  <div class="createProblem">
		  <p class="start-cont">문제출제</p>
		  <p class="lead">문제를 직접 출제하여 다른 회원들과 함께 풀어보세요. 내가 출제한 문제만 모아서 공부할 수 있습니다.</p>
		  <p class="lead">
		  <c:if test="${MNO!=null}">
		    <a class="btn btn-primary btn-lg" id="start-button2" href="createProblem.co" role="button">START</a>
	     </c:if>
	     <c:if test="${MNO==null}">
	     	<a class="btn btn-primary btn-lg" id="p-login1" href="#" role="button">START</a>
	     </c:if>
		  </p>
	  </div>
	  <div class="solveProblem">
		  <p class="start-cont">문제풀기</p>
		  <p class="lead">기출문제와 다른 회원들이 낸 문제를 모두 풀어보세요. 다양한 문제를 푸는 것은 합격의 지름길입니다.</p>
		  <p class="lead">
		    <a class="btn btn-primary btn-lg" id="start-button1" href="selectProblem.co" role="button">START</a>

	    <%-- <c:if test="${MNO==null}">
	    	<a class="btn btn-primary btn-lg" id="p-login2" href="#" role="button">START</a>
	    </c:if> --%>
		  </p>
	  </div>
	</div>
</div>
