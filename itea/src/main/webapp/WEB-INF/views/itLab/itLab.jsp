<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/itLab.css">

<div class="itLab">
	<div id="itLab-heading"><span>IT 연구소</span></div>
	<div id="itTest">
	  <div class="itTest-left">
			내가 개발자가 된다면<br/>직업 만족도는 얼마나 될까?
			<p id="itTest-left-sub">해당 자료는 <a href="https://stackoverflow.com/" target="_blank">Stack overflow</a> 의 2017년 SURVEY에서 사용되었던 문제입니다.<br/>
			5만명의 조사에 참여해주신 분들중 개발자로써 활동을 하고 있는 사람들이 자신들의 성향에 대한 응답을 했고,그와 함께 자신들의 직업 만족도를 표시한 것을 응용하였습니다.</p>
		</div>
		<div class="itTest-right">
			<img src="${pageContext.request.contextPath}/resources/img/test.png" ><br/>
			<a href="<%= request.getContextPath()%>/itLab/itTest.co">
			<input type="button" class="btn btn-outline-warning" value="TEST하기" id="it_test_button"></a>
		</div>
	</div>
	
	<div id="itKeyword">
		<div id="itKeyword-left">
			<p>2020년 7월<br/>IT뉴스 워드클라우드</p>
			<a href="http://www.itworld.co.kr/main/">ITWorld Korea</a><br/>
			<a href="http://www.ciokorea.com/main/">CIO Korea</a><br/>
			<a href="https://www.etnews.com/">etnews</a><br/>
			<a href="https://kbench.com/">케이벤치</a><br/>
			<a href="http://it.chosun.com/">IT 조선</a><br/>
			<a href="http://www.digitaltoday.co.kr/">디지털투데이</a><br/>
			<a href="http://www.inews24.com/list/it">아이뉴스24</a><br/>
			
		</div>
		<div id="itKeyword-right">
			<img class="wordcloudArrow" src="${pageContext.request.contextPath}/resources/img/pre.png">
			<img class="wordcloud" src="${pageContext.request.contextPath}/resources/wordcloud/word2007.png">
			<img class="wordcloudArrow" src="${pageContext.request.contextPath}/resources/img/post.png">
		</div>
	</div>
</div>

	<div id="itInfo">
		<img src="${pageContext.request.contextPath}/resources/itinfo/itinfo.png">
	</div>
