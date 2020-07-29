<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<html lang = "ko">
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/itTest.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey.css">
	
<div class="survey" id="test1">	
	 <h2>1/10</h2>
   <h4>나는 문제에 직면했을때,</h4>
   <div class="survey-answer"> 
         	<a><div id=answer1_1 name="answer1" class="survey1">직접 해결하기를 선호한다.</div></a>
         	<a><div id=answer1_2 name="answer1" class="survey2">전문가에게 알리고 해결을 기다린다.</div></a>  
   </div>
</div>
<div class="survey" id="test2">	
   <h2>2/10</h2>
   <h4>새로운 결과물들을 만드는 것은</h4>
   <div class="survey-answer">
   				<a><div id=answer2_1 name="answer1" class="survey1">매우 중요하며 좋아한다. 나의 손을 거쳐간 것들을 볼때 마다 자랑스럽다.</div></a>
         	<a><div id=answer2_2 name="answer1" class="survey2">과정에서 내가 배운 것들을 가지고 새로운 상황에 직면했을때,활용하는 것이 좋다.</div></a>  
   </div>
</div>
<div class="survey"id="test3">	
   <h2>3/10</h2>
   <h4>새로운 기술에 대해 소개를 받고 직면한다면,</h4>
   <div class="survey-answer">
  				<a><div id=answer3_1 name="answer1" class="survey1">즐겁게 새로운 기술에 대해 설명을 듣고 배울것이다.</div></a>
         	<a><div id=answer3_2 name="answer1" class="survey2">새롭게 기술을 배우는 것보다 기존에 사용하던 기술을 이용하기를 좋아한다.</div></a>  
   </div>
</div>
<div class="survey"id="test4">	
   <h2>4/10</h2>
   <h4>프로그램 구현에 있어서</h4>
   <div class="survey-answer">
   			<a><div id=answer4_1 name="answer1" class="survey1">세밀하게 요소를 살피는 것보다는 활용할 부분에 대해 관심이 더 간다.</div></a>
    		<a><div id=answer4_2 name="answer1" class="survey2">오류없이 구현되기 위해 세부사항을 확인하는 것이 좋다.</div></a>  
   </div>
</div>		
<div class="survey"id="test5">	
   <h2>5/10</h2>
   <h4>내가 일하는 직장분위기는</h4>
   <div class="survey-answer">
   			<a><div id=answer5_1 name="answer1" class="survey1">새롭고 다양함이 있는 것이 중요하다.</div></a>
    		<a><div id=answer5_2 name="answer1" class="survey2">체계적이고 규칙적인 것이 좋다.</div></a>  
   </div>
</div>	
<div class="survey"id="test6">	
   <h2>6/10</h2>
   <h4>컴퓨터 앞에서 몇시간째 일하고 있는 당신, 사용 프로그램의 활용성이 떨어진다면</h4>
   <div class="survey-answer">
   			<a><div id=answer6_1 name="answer1" class="survey1">활용성이 떨어지는 것은 매우 중요한 일이며, 짜증이 날 수 있다.</div></a>
    		<a><div id=answer6_2 name="answer1" class="survey2">짜증을 내기 보다는 실용적으로 그 시간에 내가 할일에 집중한다.</div></a>  
   </div>
</div>	
<div class="survey"id="test7">	
   <h2>7/10</h2>
   <h4>오랜만에 가족들과 외식을 했다. 외식을 한 후 식당에 대한 리뷰를 남긴다면?</h4>
   <div class="survey-answer">
   			<a><div id=answer7_1 name="answer1" class="survey1">음식의 맛에 중점을 둔다.</div></a>
    		<a><div id=answer7_2 name="answer1" class="survey2">맛과 식당의 분위기, 친절도, 가격 등을 고려한다.</div></a>  
   </div>
</div>
<div class="survey"id="test8">	
   <h2>8/10</h2>
   <h4>"1"+"1"=</h4>
   <div class="survey-answer">
   			<a><div id=answer8_1 name="answer1" class="survey1">2</div></a>
    		<a><div id=answer8_2 name="answer1" class="survey2">11</div></a>  
   </div>
</div>
<div class="survey"id="test9">	
   <h2>9/10</h2>
   <h4>내가 일할때 사용하는 도구에 대해서 배워야 한다면,</h4>
   <div class="survey-answer">
   			<a><div id=answer9_1 name="answer1" class="survey1">많은 시간을 투자하여 도구에 대한 확실한 이해를 하고 알려주고 싶다.</div></a>
    		<a><div id=answer9_2 name="answer1" class="survey2">내가 정말 필요한 부분만을 배우고 실생활 활용에 힘쓴다.</div></a> 
   </div>
</div>
<div class="survey"id="test10">	
   <h2>10/10</h2>
   <h4>팀프로젝트를 할 때 나는</h4>
   <div class="survey-answer">
   			<a><div id=answer10_1 name="answer1" class="survey1">리더가 되어 주도적으로 이끌고 싶다.</div></a>
    		<a><div id=answer10_2 name="answer1" class="survey2">리더의 든든한 조력자가 되고 싶다.</div></a> 
   </div>
</div>
<div id="test-result">
	<a href="<%= request.getContextPath()%>/itLab/itTestResult.co"><input type="button" id="test-result" class="survey1" value="결과보기"></a>
</div>	
