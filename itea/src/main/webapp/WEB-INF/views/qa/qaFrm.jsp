<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/qa.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/qa.css">

<div class="container" id="qa-container">
    <div class="panel-group" id="faqAccordion">
        <div class="panel panel-default">
        <h2 class="qa-heading">Q&A 게시판</h2>
        
        <!-- 질문등록하기 -->
        <div class="question-container">
					<table id="question-table">
					<form id="question-form" method="post" action="qInsert.co">
					<tr style="height: 10px;">
		        <td width="10%">
		        	<div class="form-group">
						    <select class="custom-select" id="qa-select" name="qclass">
						      <option selected="" value="0">질문유형</option>
						      <option value="1">회원서비스</option>
						      <option value="2">캘린더</option>
						      <option value="3">자격증소개</option>
						      <option value="4">문제풀이</option>
						      <option value="5">채팅</option>
						    </select>
						  </div>
		        </td>
		        <td width="80%" rowspan="2">
		        	<div class="form-group">
					      <textarea class="form-control" placeholder="질문을 입력해주세요" id="questionTextarea" name="qcont" rows="3"></textarea>
					    </div>
	        	</td>
		        <td width="10%">
		        	<c:if test="${MNO!=null}">
		        		<input type="submit" class="btn btn-info" id="q-submit" value="질문하기"/>
		        	</c:if>
		        	<c:if test="${MNO==null}">
		        		<input type="submit" class="btn btn-info" id="q-login" value="질문하기"/>
		        	</c:if>
		        </td>
	        </tr>
	        <tr><td></td><td></td><td></td></tr>
	        </form>
        	</table>
				</div>
				
				<!-- 질문 유형으로 필터링 -->
				<div class="form-group">
				    <select class="custom-select" id="qa-select">
				      <option selected="">전체보기</option>
				      <option value="1">회원서비스</option>
				      <option value="2">캘린더</option>
				      <option value="3">자격증소개</option>
				      <option value="4">문제풀이</option>
				      <option value="5">채팅</option>
				    </select>
				  </div>
  
  			<!-- Q&A 테이블 -->
        <table class="table" id="qa-table">
        <tr>
        	<th width="5%">번호</th>
        	<th width="10%">작성자</th>
        	<th width="60%">제목</th>
        	<th width="10%">질문일</th>
        	<th width="10%">답변일</th>
        	<th width="5%">상태</th>
        </tr>
        
        <!-- 질문 리스트 -->
        <%-- <c:forEach  items="${???????}" var="qa"> --%>
        <tr>
        	<td>번호</td>
        	<td>작성자</td>
        	<td>
        		<!-- 질문 -->
        		<!-- datatarget이 바뀌어야됨!!!! -->
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 질문이 여기에 표시됩니다!</a>
              </h4>

            </div>
            <!-- 답변 -->
            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">[관리자]</span></h5>
                    <p>답변은 요기에 표시됩니다!</p>
                </div>
            </div>
          </td>
        	<td>질문일</td>
        	<td>답변일</td>
        	<td>상태</td>
        </tr>
        <%-- </c:forEach> --%>
        
        <!-- 페이징처리 -->
        <tr class="center">
				<td colspan="6">
					<c:if test="${PINFO.nowPage eq 1}">
					[prev] 
					</c:if>
				
					<c:if test="${PINFO.nowPage ne 1}">
					<a href="../fileBoard/listView.co?nowPage=${PINFO.nowPage-1}">[prev]</a> 
					</c:if>
					
					<c:forEach var="pg"	 begin="${PINFO.startPage}" end="${PINFO.endPage}">
					<a href="../fileBoard/listView.co?nowPage=${pg}">[${pg}]</a> 
					</c:forEach>
					
					<c:if test="${PINFO.nowPage eq PINFO.totalPage}">
					[next]
					</c:if>
					
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
					<a href="../fileBoard/listView.co?nowPage=${PINFO.nowPage+1}">[next]</a>
					</c:if>
				</td>
			</tr>
        </table>
        </div>
    </div>
</div>