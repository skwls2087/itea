<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-create-container">
	<div id="problem-create">
	<form action="selectTest.co" method="post">
		<span id="problem-header">자격증 선택</span><br/><br/>
		<hr><br/>
	    <div class="form-group">
		    <select id="Ckind" name="Ckind" class="custom-select">
		      <option value="" selected="">자격증 종류</option>
		      <c:forEach var="ckind" items="${ckind}">
			      <option value="${ckind.lno}">${ckind.lname}</option>
		      </c:forEach>
		    </select>
		  </div>
		  
		  <div class="form-group" id="ctype-select">
		    <select id="Ctype" name="Ctype" class="custom-select">
		      <option id="type0" value="" selected="">자격증 유형</option>
		      <option id="type1" value=""></option>
		      <option id="type2" value=""></option>
		    </select>
		  </div>
		  
		  <div class="form-group">
		    <select id="Qtype" name="Qtype" class="custom-select">
		      <option value="" selected="">출제유형</option>
		      <option value="1">객관식</option>
		      <option value="2">단답형</option>
		      <option value="3">서술형</option>
		    </select>
		  </div>
		  
		  <!-- 관리자일때만 출제년도 나오기 -->
		  <c:if test="${MNICK=='관리자'}">
			  <div class="form-group">
			    <select id="Qyear" name="Qyear" class="custom-select">
			      <option value="" selected="">출제년도</option>
			      <option value="2020">2020년도</option>
			      <option value="2019">2019년도</option>
			      <option value="2018">2018년도</option>
			      <option value="2017">2017년도</option>
			      <option value="2016">2016년도</option>
			      <option value="2015">2015년도</option>
			      <option value="2014">2014년도</option>
			      <option value="2013">2013년도</option>
			      <option value="2012">2012년도</option>
			      <option value="2011">2011년도</option>
			      <option value="2010">2010년도</option>
			      <option value="2009">2009년도</option>
			      <option value="2008">2008년도</option>
			      <option value="2007">2007년도</option>
			    </select>
			  </div>
		  </c:if>
		  <c:if test="${MNICK!='관리자'}">
			  <input type="hidden" id="Qyear" value="2020" name="Qyear"/>
		  </c:if>
		  
		  <input type="submit" class="btn btn-primary btn-lg" value="문제내기" id="select-test-button">
	  </form>
	</div>
</div>