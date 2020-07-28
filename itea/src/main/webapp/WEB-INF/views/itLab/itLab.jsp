<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/itLab.css">


	
<div class="itLab">
	<div id="itLab-heading"><span>IT 연구소</span></div>
	<div id="itTest">
	  <div class="itTest-left">
			내가 개발자가 된다면<br/>직업 만족도는 얼마나 될까?
			<p id="itTest-left-sub">어디어디 사이트에서 진행한 설문 내용을 바탕으로 성향에 따른 직업만족도 테스트 입니다.</p>
		</div>
		<div class="itTest-right">
			<a href="<%= request.getContextPath()%>/it/itTest.co">
			<input type="button" class="btn btn-outline-info" value="TEST하기" id="it-test-button"></a>
		</div>
	</div>
	
	<div id="itKeyword">
		<p>2020년도 7월 IT 키워드</p>
		<img class="wordcloudArrow" src="${pageContext.request.contextPath}/resources/img/pre.png">
		<img class="wordcloud" src="${pageContext.request.contextPath}/resources/wordcloud/word2007.png">
		<img class="wordcloudArrow" src="${pageContext.request.contextPath}/resources/img/post.png">
	</div>
</div>

	<div id="itInfo">
		<img src="${pageContext.request.contextPath}/resources/img/itinfo.png">
	</div>
