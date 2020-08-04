<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div id="problem-proc">
	<a href="${pageContext.request.contextPath}/ask/problemBoard.co?pno=${problem.pno}" id="problem-board" target="_blank">
	<div id="problem-pno">#<span id="problemPNO">${problem.pno}</span></div></a>
	<a id="problem-ask" data-toggle="modal" href="#ask-Modal" target="_blank">질문하기</a>

	
	<div class="processing">
		<span id="psolve">${solve+1}</span>/<span id="ptotal">${total+1}</span>
	</div>
	<div class="progress" id="processing-bar">
	  <div class="progress-bar" role="progressbar" style="width:${(solve/total*100)+1}%;background:#2E9AFE;" 
	  	aria-valuenow="10" aria-valuemin="0" aria-valuemax="${total+1}"></div>
	</div>
	<div id="problem-info">
		<br/>
		<div class="problem-nick">
		<c:if test="${problem.mnick=='관리자'}">
			기출문제
		</c:if>
		<c:if test="${problem.mnick!='관리자'}">
			출제자: ${problem.mnick}
		</c:if>
		</div>
		<div class="problem-percent">
		<c:if test="${problem.psolve!=0}">
			<fmt:parseNumber var="correct" integerOnly="true" value="${problem.pcorrect/problem.psolve*100}"/>
			정답률: ${correct}%
		</c:if>
		</div>
	</div>
	<div id="problem-question">Q. ${problem.pdetail}</div>
	<c:if test="${!empty problem.pimg}">
		<img src="${pageContext.request.contextPath}/resources/files/${problem.pimg}" id="problem-img"><br/>
	</c:if>
	
	<!-- 객관식일때 -->
	<table>
	<c:if test="${problem.ptype==1}">
		<c:forEach items="${problem.choice}" var="choice" varStatus="status">
		<tr>
			<td valign=top>${status.count}. </td>
			<td><span id="solveChoice${status.count}">${choice}
				</span></td>
		</tr>
		</c:forEach>
	</c:if>
	</table>
	<br/>
	
	<!-- 주관,서술형일때 -->
	<c:if test="${problem.ptype==2}">
		<textarea id="shortText" style="width:100%;margin-bottom:10px;"></textarea>
	</c:if>
	<c:if test="${problem.ptype==3}">
		<textarea id="essayText" style="width:100%;margin-bottom:10px;"></textarea>
	</c:if>
	
	<form id="nextProblem" action="nextProblem.co" method="post">
	
	<c:if test="${problem.ptype==1}">
		<input type="button" class="btn btn-success center" id="problemScoring" value="채점하기" >
	</c:if>
	
	<c:if test="${problem.ptype==2}">
		<input type="button" class="btn btn-success center" id="problemShortScoring" value="채점하기" >
	</c:if>
	
	<c:if test="${problem.ptype==3}">
		<input type="button" class="btn btn-success center" id="problemEssayScoring" value="채점하기" >
	</c:if>
	
		<c:forEach items="${pnoList}" var="pno">
			<input type="hidden" name="pnoList" value="${pno}"/>
		</c:forEach>
		<input type="hidden" name="total" value="${total}"/>
		<input type="submit" id="next-problem-submit" class="btn btn-outline-secondary" value="다음문제" >
	</form>
	<br/>
	<hr>
	
<div id="problem-sub">

	<!-- 문제 즐겨찾기 -->
	<div id="problem-sub-left">
	<c:if test="${interest==0}">
		<img class="problemScrap" id="problemScrap" src="${pageContext.request.contextPath}/resources/img/star.png" style="cursor:pointer" width="30"/>
	</c:if>
	<c:if test="${interest!=0}">
		<img class="problemNonScrap" id="problemNonScrap" src="${pageContext.request.contextPath}/resources/img/star-click.png" style="cursor:pointer" width="30"/>
	</c:if>
	</div>
	
	<!-- 문제 좋아요 싫어요 -->
	<div id="problem-sub-center">
		<div id="plike" class="sub-a" name="" href="#" style="cursor:pointer" >
		<img src="${pageContext.request.contextPath}/resources/img/like.png" width="25"/>
		추천해요<br/><span id="likecnt">${problem.plike}</span></div>
		<div id="phate" class="sub-a" name="" href="#" style="cursor:pointer" >
		<img src="${pageContext.request.contextPath}/resources/img/hate.png" width="25"/>
		별로에요<br/><span id="hatecnt">${problem.phate}</span></div>
	</div>
	
	<!-- 문제 신고하기 -->
	<div id="problem-sub-right">
		<a id="error-modal" data-toggle="modal" href="#e-Modal">
		<img id="error" src="${pageContext.request.contextPath}/resources/img/error.png" style="cursor:pointer" width="40"/></a>
	</div>
</div>
</div>

<div class="problemScore" id="problem-wrong" style="display:none">
		<div id="problemScore-left">
			<img src="${pageContext.request.contextPath}/resources/img/close.png" width="50"/><br/>
			틀렸습니다!
		</div>
		<div id="problemScore-right">
			<!-- 객관식 정답 표시 -->
		<c:if test="${problem.ptype==1}">
			정답:<span id="problem-choice-correct">${problem.correct}</span><br/>
			해설:${problem.pcomment}<br/>
		</c:if>
		
		<!-- 단답형 정답 표시 -->
		<c:if test="${problem.ptype==2}">
			정답:
			<c:forEach items="${problem.correctList}" var="correct" varStatus="status">
				${correct}<c:if test="${!status.last}"> || </c:if> 
				
			</c:forEach>
			<br/>해설:${problem.pcomment}<br/>
		</c:if>
		
		<!-- 서술형 정답 표시 -->
		<c:if test="${problem.ptype==3}">
			핵심 키워드:
			<c:forEach items="${problem.correctList}" var="correct" varStatus="status">
				${correct}<c:if test="${!status.last}"> && </c:if> 
			</c:forEach>
			<br/>정답:${problem.pcomment}<br/>
		</c:if>
	</div>
</div>
	
<div class="problemScore" id="problem-correct" style="display:none">
	<div id="problemScore-left">
		<img src="${pageContext.request.contextPath}/resources/img/correct.png" width="50"/><br/>
		정답입니다!
	</div>
	<div id="problemScore-right">
	
		<!-- 객관식 정답 표시 -->
		<c:if test="${problem.ptype==1}">
			정답:<span id="problem-choice-correct">${problem.correct}</span><br/>
			해설:${problem.pcomment}<br/>
		</c:if>
		
		<!-- 단답형 정답 표시 -->
		<c:if test="${problem.ptype==2}">
			정답:
			<c:forEach items="${problem.correctList}" var="correct" varStatus="status">
				${correct}<c:if test="${!status.last}"> || </c:if> 
			</c:forEach>
			<br/>해설:${problem.pcomment}<br/>
		</c:if>
		
		<!-- 서술형 정답 표시 -->
		<c:if test="${problem.ptype==3}">
			핵심 키워드:
			<c:forEach items="${problem.correctList}" var="correct" varStatus="status">
				${correct}<c:if test="${!status.last}"> && </c:if> 
			</c:forEach>
			<br/>정답:${problem.pcomment}<br/>
		</c:if>
	</div>
</div>

<!-- 신고하기 -->
	<div class="modal fade" id="e-Modal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">문제 신고하기</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        <div class="modal-body">
	        
	        <div class="problem-error-container">
	
				<form id="error-form" method="post" action="aInsert.co">
				
        	<div class="form-group">
			      <textarea class="form-control" placeholder="신고내용을 입력해주세요" id="errorTextarea" name="acont" rows="3"></textarea>
			    </div>
	
	        <div class="modal-footer">
	      		<input type="button" class="btn btn-info" id="s-submit" value="등록하기"/>
	        </div>
	      </div>
	      
	      </form>
				</div>
	        
	        </div>
	    </div>
  </div>

<!-- 질문 등록하기 -->
	<div class="modal fade" id="ask-Modal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">질문 등록하기</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        <div class="modal-body">
	        <div class="problem-ask-container">

				<form id="ask-form" method="post" action="aWriteProc.co">
				
				<table style="width:100%">
					<tr>
						<th width="10%">제목</th>
						<td><input type="text" id="atitle" name="atitle" value="${askDTO.atitle}" style="width:100%"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="acontent" name="acontent" rows="10" style="width:100%">${askDTO.acontent}</textarea></td>
					</tr>
				</table>
	
	        <div class="modal-footer">
	      		<input type="button" class="btn btn-info" id="a-submit" value="등록하기"/>
	        </div>
	      </div>
	      
	      </form>
	      
        </div>
    	</div>
   	</div>
</div>


