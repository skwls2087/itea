<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/qa.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/qa.css">

<div class="container" id="qa-container">
    <div class="panel-group" id="faqAccordion">
        <div class="panel panel-default">
        <h2 class="qa-heading">Q&A 게시판</h2>
        
		<div class="form-group">

			<!-- 질문 유형으로 필터링 -->
			<form action="qaFrm.co" method="post" name="fieldForm" onChange="javascript:fieldForm.submit();">
				
		    <select class="custom-select" id="qa-select" name="field" onChange="javascript:fieldForm.submit();">
		      <option value="all" <c:if test="${field == 'all'}">selected='selected'</c:if>>전체보기</option>
		      <c:if test="${MNO!=null}">
		      	<option value="my" <c:if test="${field == 'my'}">selected='selected'</c:if>>내질문</option>
		      </c:if>
		      <option value="1" <c:if test="${field == '1'}">selected='selected'</c:if>>회원서비스</option>
		      <option value="2" <c:if test="${field == '2'}">selected='selected'</c:if>>캘린더</option>
		      <option value="3" <c:if test="${field == '3'}">selected='selected'</c:if>>자격증소개</option>
		      <option value="4" <c:if test="${field == '4'}">selected='selected'</c:if>>문제풀이</option>
		      <option value="5" <c:if test="${field == '5'}">selected='selected'</c:if>>채팅</option>
		    </select>
	    </form>
		    
		    <!-- 질문등록 버튼 -->
		    	<c:if test="${MNO!=null}">
	        	<button type="button" id="q-button" class="btn btn-info" data-toggle="modal" data-target="#q-Modal">질문하기</button>
	        </c:if>
	        <c:if test="${MNO==null}">
	        	<button type="button" id="q-login" class="btn btn-info" >질문하기</button>
	        </c:if>
		  </div>
  
		<!-- Q&A 테이블 -->
    <table class="table" id="admin-table">
        <tr>
        	<th width="10%">번호</th>
        	<th width="10%">작성자</th>
        	<th width="55%">제목</th>
        	<th width="15%">질문일</th>
        	<th width="10%">상태</th>
        	<th></th>
        	<th></th>
        </tr>
        
        <!-- 질문 리스트 -->
        <c:forEach  items="${LIST}" var="qa" varStatus="status">
        <tr>
        	<td>${qa.qno}</td>
        	<td>${qa.mnick}</td>
        	<td>
        		<!-- 질문 -->
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
        	
        	<td>
        		<c:if test="${qa.mno==MNO||MNICK=='관리자'}">
        			<a href="qDelete.co?qno=${qa.qno}&nowPage=${PINFO.nowPage}" onclick="alert('해당 질문이 삭제되었습니다.')">
        			<img src="${pageContext.request.contextPath}/resources/img/trash.png" width="20"/></a>
        		</c:if>
        	</td>
        	
        	<td>
        		<c:if test="${MNICK=='관리자'}">
        			<a class="q-edit" id="${qa.qno}" href="#" data-toggle="modal" data-target="#a-Modal">
        			<img src="${pageContext.request.contextPath}/resources/img/edit.png" width="20"/></a>
       			</c:if>
        	</td>
        	
        </tr>
        
        </c:forEach>
        
        <!-- 페이징처리 -->
        
        <tr>
				<td colspan="7">
				<div>
  				<ul class="pagination" id="q-paging">
  				
  				<!-- 이전페이지 -->
  				<c:if test="${PINFO.nowPage ne 1}">
  				  <li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/qa/qaFrm.co?nowPage=${PINFO.nowPage-1}&field=${field}">&laquo;</a>
				    </li>
					</c:if>
					<c:if test="${PINFO.nowPage eq 1}">
  				    <li class="page-item disabled">
  				    	<a class="page-link" href="#">&laquo;</a>
				    </li>
					</c:if>
					<!-- 페이지 -->
					<c:forEach var="pg"	 begin="${PINFO.startPage}" end="${PINFO.endPage}">
						<c:if test="${PINFO.nowPage==pg}">
							<li id="q-nowpage" class="page-item active">
						</c:if>
						<c:if test="${PINFO.nowPage!=pg}">
							<li id="q-nowpage" class="page-item">
						</c:if>
				      <a class="page-link" href="<%= request.getContextPath()%>/qa/qaFrm.co?nowPage=${pg}&field=${field}">${pg}</a>
				    </li>
					</c:forEach>
					
					<!-- 다음페이지 -->
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
					<li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/qa/qaFrm.co?nowPage=${PINFO.nowPage+1}&field=${field}">&raquo;</a>
				    </li>
					</c:if>
					<c:if test="${PINFO.nowPage eq PINFO.totalPage}">
					<li class="page-item disabled">
						<a class="page-link" href="#}">&raquo;</a>
				    </li>
					</c:if>

				  </ul>
					</div>
				</td>
			</tr>
        </table>
        
        </div>
    </div>
</div>

<!-- 질문 등록하기 -->
<div class="modal fade" id="q-Modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Q&A 게시판</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
        
        <!-- 질문등록하기 -->
        <div class="question-container">

			<form id="question-form" method="post" action="qInsert.co">
					
        	<div class="form-group">
			    <select class="custom-select" id="q-select" name="qclass">
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

        <div class="modal-footer">
      		<input type="submit" class="btn btn-info" id="q-submit" value="질문하기"/>
        </div>
      </div>
      
      </form>
			</div>
        
        </div>
    </div>
  </div>
  
  <!-- 답변 등록하기 -->
	<div class="modal fade" id="a-Modal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">Q&A 게시판</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        <div class="modal-body">
	        
	        <!-- 답변등록하기 -->
	        <div class="question-container">
	
				<form id="question-form" method="post" action="aInsert.co">
				
					<input type='hidden' name='nowPage' value='${PINFO.nowPage}'/>
					<input type='hidden' id='aaa' name='qno' value=''/>
        	<div class="form-group">
			      <textarea class="form-control" placeholder="답변을 입력해주세요" id="answerTextarea" name="acont" rows="3"></textarea>
			    </div>
	
	        <div class="modal-footer">
	      		<input type="submit" class="btn btn-info" id="a-submit" value="답변하기"/>
	        </div>
	      </div>
	      
	      </form>
				</div>
	        
	        </div>
	    </div>
	  </div>
  

