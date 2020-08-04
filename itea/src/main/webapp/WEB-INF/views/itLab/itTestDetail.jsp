<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<script src="${pageContext.request.contextPath}/resources/js/itTest.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/itTest.css">
	
<div class="survey" id="test1">	
	 <h2>1/10</h2>
   <h4>어려운 업무를 맡게 된 당신 에러를 마주친다면,</h4>
   <br/>
   <br/>
   <div class="survey-answer"> 
         	<div id=answer1_1 class="survey1"><a>내 에러는 나의 것, 직접 해결한다.</a></div>
         	<div id=answer1_2 class="survey2"><a>직장 동료에게 도움을 요청한다.</a></div>  
   </div>
</div>
<div class="survey" id="test2">	
   <h2>2/10</h2>
   <h4>새롭게 이사를 한 당신 가구를 산다면,</h4>
   <br/>
   <br/>
   <div class="survey-answer">
   				<div id=answer2_1 class="survey1"><a>DIY제품을 구입해 직접 조립한다.</a></div>
         	<div id=answer2_2 class="survey2"><a>가구 매장에 가서 완제품을 구입한다.</a></div>
   </div>
</div>
<div class="survey"id="test3">	
   <h2>3/10</h2>
   <h4>오랜만에 출근을 한 당신 밀려있는 업무를 본다면,</h4>
   <br/>
   <br/>
   <div class="survey-answer">
  				<div id="answer3_1" class="survey1"><a>인터넷에 빠르게 할 수 있는 새로운 방법을 찾아본다.</a></div>
         	<div id="answer3_2" class="survey2"><a>평소에 하던대로 하나씩 천천히 해결한다.</a></div>
   </div>
</div>
<div class="survey"id="test4">	
   <h2>4/10</h2>
   <h4>개발자로 취업한 당신 프로그램을 개발한다면,</h4>
   <br/>
   <br/>
   <div class="survey-answer">
   			<div id="answer4_1" class="survey1"><a>속도는 조금 느리지만 볼거리가 다양한 프로그램</a></div>
    		<div id="answer4_2" class="survey2"><a>필요한 기능만 심플하게 구현된 안정적인 프로그램</a> </div> 
   </div>
</div>		
<div class="survey"id="test5">	
   <h2>5/10</h2>
   <h4>당신이 원하는 회사 분위기는,</h4>
   <br/>
   <br/>
   <div class="survey-answer">
   			<div id="answer5_1" class="survey1"><a>새롭고 다양함이 있는 자유로운 회사</a></div>
    		<div id="answer5_2" class="survey2"><a>체계적이고 규칙적인 편안한 회사</a></div> 
   </div>
</div>	
<div class="survey"id="test6">	
   <h2>6/10</h2>
   <h4>노트북을 산 당신 키보드가 잘 눌리지 않는다면,</h4>
   <br/>
   <br/>
   <div class="survey-answer">
   			<div id="answer6_1" class="survey1"><a>키보드는 노트북의 생명, 당장 다른 제품을 산다.</a></div>
    		<div id="answer6_2" class="survey2"><a>비싸게 주고 산 노트북이니 주의해서 사용한다.</a></div>
   </div>
</div>	
<div class="survey"id="test7">	
   <h2>7/10</h2>
   <h4>팀원들과 오랜만에 회식을 하는 당신 식당을 검색할 때,</h4>
   <br/>
   <br/>
   <div class="survey-answer">
   			<div id="answer7_1" class="survey1"><a>주변의 가장 맛있는 식당을 검색한다.</a></div>
    		<div id="answer7_2" class="survey2"><a>맛과 분위기, 서비스를 모두 고려한다.</a></div>
   </div>
</div>
<div class="survey"id="test8">	
   <h2>8/10</h2>
   <h4>Q.'1'+'1'=?</h4>
   <br/>
   <br/>
   <div class="survey-answer">
   			<div id="answer8_1" class="survey1"><a>2</a></div>
    		<div id="answer8_2" class="survey2"><a>11</a></div>  
   </div>
</div>
<div class="survey"id="test9">	
   <h2>9/10</h2>
   <h4>새로운 프로그래밍 언어를 배우게 된 당신,</h4>
   <br/>
   <br/>
   <div class="survey-answer">
   			<div id="answer9_1" class="survey1"><a>"Hello World"부터 천천히 배워가야지</a></div>
    		<div id="answer9_2" class="survey2"><a>시작부터 고급 버전, 일단 다 쓰고보자!</a></div>
   </div>
</div>
<div class="survey" id="test10">	
   <h2>10/10</h2>
   <h4>팀프로젝트를 할 때 당신은 팀에서,</h4>
   <br/>
   <br/>
   <div class="survey-answer">
   			<div id="answer10_1" class="survey1"><a>팀장이 되어 팀을 주도적으로 이끌고 싶다.</a></div>
    		<div id="answer10_2" class="survey2"><a>팀장의 든든한 조력자가 되고 싶다.</a></div> 
   </div>
</div>
<div id="test-result">
	<div><img src="<%= request.getContextPath()%>/resources/img/question2.png"/></div>
	<input type="button" id="test-result-button" class="survey-result-button" value="결과보기">
</div>
<form name="testfrm" id="testfrm" action="<%= request.getContextPath()%>/itLab/itTestResult.co" method="post">
	<input type="hidden" id="str" name="str"/>
</form>	














