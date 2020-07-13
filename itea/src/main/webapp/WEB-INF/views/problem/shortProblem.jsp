<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div class="short-Problem">
	주관식문제 <br/>
	주관식문제는 입력해주신 정답 중 하나라도 맞으면 정답이 됩니다.
	<textarea class="form-control" placeholder="내용을 입력해주세요" rows="5"></textarea>
	  <div class="form-group">
      <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
      </div>
	<input class="form-control form-control-lg" type="text" id="inputLarge">
	<input class="form-control form-control-lg" type="text" id="inputLarge">
	<input class="form-control form-control-lg" type="text" id="inputLarge">
  <img src="${pageContext.request.contextPath}/resources/img/add.png"	width="30"/>
</div>