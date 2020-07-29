<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang = "ko">
<head>
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>	
<body>
	<script src="${pageContext.request.contextPath}/resources/js/itTest.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey.css">
	
<div class="survey" id="test1">	
	 <div class="index-text">1/10</div>
   <p >문제에 있어서 정답찾기를 좋아한다.</p>
   <div class="survey-answer"> 
         	<input type="button" id=answer1_1 name="answer1" class="survey1"value="그렇다" >    
          <input type="button" id=answer1_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>
<div class="survey" id="test2">	
   <h2>2/10</h2>
   <p>결과물이 있는 것을 선호한다.</p>
   <div class="survey-answer">
      <input type="button" id=answer2_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer2_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>
<div class="survey"id="test3">	
   <h2>3/10</h2>
   <p>항상 새로운 기술을 습득하는 것을 좋아한다.</p>
   <div class="survey-answer">
      <input type="button" id=answer3_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer3_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>
<div class="survey"id="test4">	
   <h2>4/10</h2>
   <p>구현 보다는 활용에 관심이 간다.</p>
   <div class="survey-answer">
      <input type="button" id=answer4_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer4_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>		
<div class="survey"id="test5">	
   <h2>5/10</h2>
   <p>정형화된 직장분위기를 선호하지 않는다.</p>
   <div class="survey-answer">
      <input type="button" id=answer5_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer5_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>	
<div class="survey"id="test6">	
   <h2>6/10</h2>
   <p>일할때 사용하는 프로그램에 대한 편의성에 민감하다.</p>
   <div class="survey-answer">
      <input type="button" id=answer6_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer6_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>	
<div class="survey"id="test7">	
   <h2>7/10</h2>
   <p>모든사항에 있어 정답과 오답은 있어야 한다.</p>
   <div class="survey-answer">
      <input type="button" id=answer7_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer7_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>
<div class="survey"id="test8">	
   <h2>8/10</h2>
   <p>컴퓨터에 대한 지식은 많이 없지만, 배우고 싶은 의향도 없다.</p>
   <div class="survey-answer">
      <input type="button" id=answer8_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer8_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>
<div class="survey"id="test9">	
   <h2>9/10</h2>
   <p>컴퓨터를 가지고 활용하는 것이 더 좋다.</p>
   <div class="survey-answer">
      <input type="button" id=answer9_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer9_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>
<div class="survey"id="test10">	
   <h2>10/10</h2>
   <p>세상에 내가 만든 프로그램을 알리고 싶다.</p>
   <div class="survey-answer">
      <input type="button" id=answer10_1 name="answer1" class="survey1"value="그렇다" >    
      <input type="button" id=answer10_2 name="answer1" class="survey2"value="아니다" >
   </div>
</div>
<div id="test-result">
	<input type="button" id="test-result" class="survey1" value="결과보기">
</div>	
			
</body>