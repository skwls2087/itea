<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div class="short-Problem">
	주관식문제 <br/>
	주관식문제는 입력해주신 정답 중 하나라도 맞으면 정답이 됩니다.
	<form method="post" action="createProblemProc.co" encType="multipart/form-data">
	
	<!-- 문제 -->
		<textarea class="form-control" name="pdetail" placeholder="내용을 입력해주세요" rows="5"></textarea>
		  <div class="form-group">
	      <input type="file" name="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
	      </div>
	      
    <!-- 해설 -->
    <textarea class="form-control" name="pcomment" placeholder="해설을 입력해주세요" rows="5"></textarea><br/>
    
    <!-- 정답 키워드 -->
		<input class="form-control form-control-lg" type="text" id="inputLarge" name="correctList">
		<input class="form-control form-control-lg" type="text" id="inputLarge" name="correctList">
		<input class="form-control form-control-lg" type="text" id="inputLarge" name="correctList">
	  <img src="${pageContext.request.contextPath}/resources/img/add.png"	width="30"/><br/>
	  <input type="hidden" name="lqno" value="${lqno}"/>
    <input type="hidden" name="pyear" value="${pyear}"/>
    <input type="hidden" name="ptype" value="${ptype}"/>
    <input type="submit" class="btn btn-primary" value="출제하기">
  </form>
</div>