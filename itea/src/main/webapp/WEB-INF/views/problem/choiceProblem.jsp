<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-create">
	<span id="problem-header">서술형 출제</span><br/><br/>
	<form id="choice-problem-create" method="post" action="createProblemProc.co" encType="multipart/form-data">
		<table width="100%">
		<!-- 문제 -->
		<tr>
		<td valign=top width="10px">
		Q.</td>
		<td>
		<textarea class="form-control" name="pdetail" id="pdetail" placeholder="문제를 입력해주세요" rows="2"></textarea>
		  <div class="filebox">
		  	<label for="problemFile">이미지 첨부</label> 
		  	<input type="file" name="file" id="problemFile">
	    </div>
    <div>
    	<div class="img_wrap" id="img_wrap" style="display:none;">
    		<img id="img">
    	</div>
    </div>
    <br/><br/>
    </td>
    <br/>
    <!-- 지문 -->
   	<div class="form-group">
   	<!-- 1번 -->
   	<tr>
		<td valign=top width="10%">1.</td>
		<td width="80%">
		<textarea class="form-control" placeholder="내용을 입력해주세요" rows="1" name="choice" id="choice1"></textarea> </td>
		<td width="10%">
		<div class="custom-control custom-radio">
	      <input type="radio" id="customRadio1" name="correct" class="custom-control-input" value="1">
	      <label class="custom-control-label" for="customRadio1"></label>
	    </div>
	    </td>
		</tr>
		
		<!-- 2번 -->
    <tr>
		<td valign=top>2.</td>
		<td><textarea class="form-control" placeholder="내용을 입력해주세요" rows="1" name="choice" id="choice2"></textarea> </td>
		<td>
		<div class="custom-control custom-radio">
	      <input type="radio" id="customRadio2" name="correct" class="custom-control-input" value="2">
	      <label class="custom-control-label" for="customRadio2"></label>
	    </div>
	    </td>
		</tr>
		
		<!-- 3번 -->
		<tr>
		<td valign=top>3.</td>
		<td><textarea class="form-control" placeholder="내용을 입력해주세요" rows="1" name="choice" id="choice3"></textarea> </td>
		<td>
		<div class="custom-control custom-radio">
	      <input type="radio" id="customRadio3" name="correct" class="custom-control-input" value="3">
	      <label class="custom-control-label" for="customRadio3"></label>
	    </div>
	    </td>
		</tr>
		
		<!-- 4번 -->
		<tr>
			<td valign=top>4.</td>
			<td><textarea class="form-control" placeholder="내용을 입력해주세요" rows="1" name="choice" id="choice4"></textarea> </td>
			<td>
			<div class="custom-control custom-radio">
		      <input type="radio" id="customRadio4" name="correct" class="custom-control-input" value="4">
		      <label class="custom-control-label" for="customRadio4"></label>
		    </div>
		    </td>
		</tr>
		</div>
		
		<!-- 해설 -->
		<tr>
			<td valign=top>해설.</td>
			<td><textarea class="form-control" name="pcomment" placeholder="내용을 입력해주세요" id="pcomment" rows="3"></textarea></td>
    </tr>
    </table>
	    <input type="hidden" name="lqno" value="${lqno}"/>
	    <input type="hidden" name="pyear" value="${pyear}"/>
	    <input type="hidden" name="ptype" value="${ptype}"/>
	    <br/><br/>
	    <input type="submit" id="create-problem-submit" class="btn btn-primary btn-lg" value="출제하기">
    </form>
	
</div>
