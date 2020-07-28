<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/itLab.css">

<div id="itLab-heading"><span>IT 연구소</span></div>
	
<div class="itLab">
	<div id="itTest">
		<%-- <img src="${pageContext.request.contextPath}/resources/img/question.png"> --%>
		<p>내가 개발자가 된다면 행복할까?</p>
		<a href="<%= request.getContextPath()%>/it/itTest.co">
		<input type="button" class="btn btn-outline-info" value="TEST하기" id="it-test-button"></a>
	</div>
	
	<div id="itKeyword">
		<img class="wordcloudArrow" src="${pageContext.request.contextPath}/resources/img/pre.png">
		<img class="wordcloud" src="${pageContext.request.contextPath}/resources/wordcloud/word2007.png">
		<img class="wordcloudArrow" src="${pageContext.request.contextPath}/resources/img/post.png">
		<p>2020년도 7월 IT 키워드</p>
	</div>
</div>

	<div id="itInfo">
	인포그래픽
	</div>
