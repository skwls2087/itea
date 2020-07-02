<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/qa.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/qa.css">

<div class="container" id="qa-container">
    <div class="panel-group" id="faqAccordion">
        <div class="panel panel-default">
        <h2 class="qa-heading">Q&A 게시판</h2>
        
        
				
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
        	<th width="10%">번호</th>
        	<th width="10%">작성자</th>
        	<th width="55%">제목</th>
        	<th width="15%">질문일</th>
        	<th width="10%">상태</th>
        </tr>
        
        <!-- 질문 리스트 -->
        <c:forEach  items="${LIST}" var="qa" varStatus="status">
        <tr>
        	<td>${qa.qno}</td>
        	<td>${qa.mnick}</td>
        	<td>
        		<!-- 질문 -->
        		<!-- datatarget이 바뀌어야됨!!!! -->
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question${status.count}">
              <div class="panel-title">
              	<c:choose>
					         <c:when test = "${qa.qclass==1}">
				            	<c:set var="questionclass" value="회원서비스" />
					         </c:when>
					         <c:when test = "${qa.qclass==2}">
					           	<c:set var="questionclass" value="캘린더" />
					         </c:when>
					         <c:when test = "${qa.qclass==3}">
					           	<c:set var="questionclass" value="자격증소개" />
					         </c:when>
					         <c:when test = "${qa.qclass==4}">
					           	 <c:set var="questionclass" value="문제풀이" />
					         </c:when>
					         <c:when test = "${qa.qclass==5}">
					           	<c:set var="questionclass" value="채팅" />
					         </c:when>
					      </c:choose>
                 <a href="#" class="ing" id="question">[${questionclass}] ${qa.qcont}</a>
              </div>

            </div>
            <!-- 답변 -->
            <c:if test="${qa.acont !=null }">
            <div id="question${status.count}" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary" id="admin-answer">
                     		[답변] 관리자  ${qa.adate}</span></h5>
                    <p>${qa.acont}</p>
                </div>
            </div>
            </c:if>
          </td>
        	<td>${qa.qdate}</td>
        	<td>
        	<c:if test="${qa.acont==null}"><div id="answerYET">대기</div></c:if>
        	<c:if test="${qa.acont!=null}"><div id="answerOK">완료</div></c:if>
        	</td>
        </tr>
        </c:forEach>
        
        <!-- 페이징처리 -->
        
        <tr class="center">
				<td colspan="5">
				<div>
  				<ul class="pagination">
  				
  				<!-- 이전페이지 -->
  				<c:if test="${PINFO.nowPage ne 1}">
  				    <li class="page-item disabled">
					      <a class="page-link" href="<%= request.getContextPath()%>/qa/qaFrm.co?nowPage=${PINFO.nowPage-1}">&laquo;</a>
					    </li>
					</c:if>
					<c:if test="${PINFO.nowPage eq 1}">
  				    <li class="page-item disabled">
					      <a class="page-link" href="#">&laquo;</a>
					    </li>
					</c:if>
					<!-- 페이지 -->
					<c:forEach var="pg"	 begin="${PINFO.startPage}" end="${PINFO.endPage}">
						<li id="q-nowpage" class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/qa/qaFrm.co?nowPage=${pg}">${pg}</a>
				    </li>
					</c:forEach>
					
					<!-- 다음페이지 -->
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
						<li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/qa/qaFrm.co?nowPage=${PINFO.nowPage+1}">&raquo;</a>
				    </li>
					</c:if>
					<c:if test="${PINFO.nowPage eq PINFO.totalPage}">
						<li class="page-item">
				      <a class="page-link" href="#">&raquo;</a>
				    </li>
					</c:if>

				  </ul>
					</div>
				</td>
			</tr>
        </table>
        
        <!-- 질문등록하기 -->
        <div class="question-container">

					<form id="question-form" method="post" action="qInsert.co">


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

		        	<div class="form-group">
					      <textarea class="form-control" placeholder="질문을 입력해주세요" id="questionTextarea" name="qcont" rows="3"></textarea>
					    </div>

		        	<c:if test="${MNO!=null}">
		        		<input type="submit" class="btn btn-info" id="q-submit" value="질문하기"/>
		        	</c:if>
		        	<c:if test="${MNO==null}">
		        		<input type="submit" class="btn btn-info" id="q-login" value="질문하기"/>
		        	</c:if>

	        </form>

				</div>
				
        </div>
    </div>
</div>