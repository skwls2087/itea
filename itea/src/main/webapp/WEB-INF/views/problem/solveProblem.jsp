<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<ul class="nav nav-pills">
<li class="nav-item dropdown show">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="true">Dropdown</a>
    <div class="dropdown-menu show" style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;" x-placement="bottom-start">
      <a class="dropdown-item" href="#">자격증별 문제</a>
      <a class="dropdown-item" href="${pageContext.request.contextPath}/problem/myProblemList.co">내가 만든 문제</a>
      <a class="dropdown-item" href="#">즐겨찾기 문제</a>
      <c:if test="${MNICK=='관리자'}">
	      <div class="dropdown-divider"></div>
	      <a class="dropdown-item" href="#">신고된 문제</a>
      </c:if>
    </div>
  </li>
</ul>
		  
<div id="problem-solve-container">
	<div id="problem-solve">
	<form action="selectForTest.co" method="post">
		<span id="problem-header">시험 선택</span><br/><br/>
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
		      <option id="type0" value="" selected="">문제 유형</option>
		      <option id="type1" value=""></option>
		      <option id="type2" value=""></option>
		    </select>
		  </div>
		  
		  <div class="form-group">
		    <select id="Qtype" name="Qtype" class="custom-select">
		      <option value="1">기출문제만 풀기</option>
		      <option value="2">회원이 출제한 문제만 풀기</option>
		      <option value="3">종합문제</option>
		    </select>
		  </div>
		  
		  <div class="form-group">
		    <select id="Qyear" name="pyearList" size="10" class="custom-select" multiple>
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
		  
		  <input type="submit" class="btn btn-primary" value="문제풀기" id="select-test-button">
	  </form>
	</div>
</div>