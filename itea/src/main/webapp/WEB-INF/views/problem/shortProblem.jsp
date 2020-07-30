<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-create">
	<div class="short-Problem">
	<span id="problem-header">단답형 출제</span><br/><br/>
		<form method="post" action="createProblemProc.co" id="create-short-submit" encType="multipart/form-data">
		
		<!-- 문제 -->
    <textarea class="form-control" name="pdetail" id="pdetail" placeholder="문제를 입력해주세요" rows="4"></textarea>
		  <div class="filebox">
		  	<label for="problemFile">이미지 첨부</label> 
		  	<input type="file" name="file" id="problemFile">
	    </div>
    <div>
    	<div class="img_wrap" id="img_wrap" style="display:none;">
    		<img id="img">
    	</div>
    </div>
    
	    
	    <!-- 정답 키워드 -->
	    <br/>
	    <p id="short-keyword">단답형문제는 입력해주신 키워드중 하나라도 맞으면 정답이 됩니다.<br/>중복 답안이 있는 경우 모두 작성해주세요.</p>
	    <input type="button" class="btn btn-link" id="plus-keyword" value="키워드 추가"/>
	    
	    <div id="correct-boxes">
		    <div class="correct-box">
					<input class="form-control form-control-lg" name="correctList" type="text" id="correct-keyword" 
						name="correctList" size="5">
				</div>
			</div>
			<br/><hr><br/>
			
			<!-- 해설 -->
	    <textarea class="form-control" name="pcomment" id="pcomment" placeholder="해설을 입력해주세요" rows="4"></textarea><br/>
	    
		  
		  <input type="hidden" name="lqno" value="${lqno}"/>
	    <input type="hidden" name="pyear" value="${pyear}"/>
	    <input type="hidden" name="ptype" value="${ptype}"/><br/><br/>
	    <input type="submit" id="create-text-problem-submit" class="btn btn-primary btn-lg" value="출제하기">
	  </form>
	</div>
</div>