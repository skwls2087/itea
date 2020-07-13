<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-create-container">
	<div id="problem-create">
	<form action="selectTest.co" method="post">
		출제하실 자격증 시험의 종류와 유형을 선택해주세요.<br/>
		
	    <div class="form-group">
	    	<!-- 자격증테이블에 있는 모든 자격증을 불러올까? 아님 자격증을 따로 지정해줘야될까? -->
		    <select name="Ckind" class="custom-select">
		      <option selected="">자격증 종류</option>
		      <option value="1">One</option>
		      <option value="2">Two</option>
		      <option value="3">Three</option>
		    </select>
		  </div>
		  <div class="form-group">
		  	<!-- 각 자격증에 맞는 유형을 자격증 테이블에서 지정해야 된다. -->
		    <select name="Ctype" class="custom-select">
		      <option selected="">자격증 유형</option>
		      <option value="1">One</option>
		      <option value="2">Two</option>
		      <option value="3">Three</option>
		    </select>
		  </div>
		  <div class="form-group">
		  	<!-- 자격증 유형에 출제유형을 따로 지정해줘야 될까? -->
		    <select name="Qtype" class="custom-select">
		      <option selected="">출제유형</option>
		      <option value="1">객관식</option>
		      <option value="2">단답형</option>
		      <option value="3">서술형</option>
		    </select>
		  </div>
		  <div class="form-group">
		  	<!-- 출제년도는 언제부터 언제까지로 할까? -->
		    <select name="Qyear" class="custom-select">
		      <option selected="">출제년도</option>
		      <option value="1">One</option>
		      <option value="2">Two</option>
		      <option value="3">Three</option>
		    </select>
		  </div>
		  <input type="submit" class="btn btn-primary" value="문제내기">
	  </form>
	</div>
</div>