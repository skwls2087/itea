<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-create">
	<div class="short-Problem">
	<span id="problem-header">문제출제</span><br/><br/>
		<form method="post" action="createProblemProc.co" id="create-text-problem-submit" encType="multipart/form-data">
		
		<!-- 문제 -->
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
	    <!-- 해설 -->
	    <textarea class="form-control" name="pcomment" id="pcomment" placeholder="해설을 입력해주세요" rows="5"></textarea><br/>
	    
	    <!-- 정답 키워드 -->
	    <input type="button" class="btn btn-link" id="plus-keyword" value="키워드 추가"/>
	    
	    <div id="correct-boxes">
		    <div class="correct-box">
					<input class="form-control form-control-lg" name="correctList" type="text" id="correct-keyword" 
						name="correctList" size="5">
				</div>
			</div>
		  
		  <input type="hidden" name="lqno" value="${lqno}"/>
	    <input type="hidden" name="pyear" value="${pyear}"/>
	    <input type="hidden" name="ptype" value="${ptype}"/><br/><br/>
	    <input type="submit" id="essay-problem-submit" class="btn btn-primary" value="출제하기">
	  </form>
	</div>
</div>