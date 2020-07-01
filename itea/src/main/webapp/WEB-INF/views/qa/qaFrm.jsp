<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/qa.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/qa.css">

<div class="container" id="qa-container">
    <div class="panel-group" id="faqAccordion">
        <div class="panel panel-default">
        <h2 class="qa-heading">Q&A 게시판</h2>
        
        <div class="question-container">
					<table id="question-table">
					<form id="question-form" method="get" action="qInsert.co">
					<tr>
		        <td width="10%">
		        	<div class="form-group">
						    <select class="custom-select" id="qa-select">
						      <option selected="">질문유형</option>
						      <option value="1">회원서비스</option>
						      <option value="2">캘린더</option>
						      <option value="3">자격증소개</option>
						      <option value="4">문제풀이</option>
						      <option value="5">채팅</option>
						    </select>
						  </div>
		        </td>
		        <td width="80%">
		        	<input type="text" id="question-text" class="form-control" placeholder="질문을 입력해주세요">
		        </td>
		        <td width="10%">
		        	<input type="submit" class="btn btn-info" id="q-submit" value="질문하기"/>
		        </td>
	        </tr>
	        </form>
        	</table>
				</div>
				
				<div class="form-group">
				    <select class="custom-select" id="qa-select">
				      <option selected="">전체보기</option>
						      <option selected="">질문유형</option>
						      <option value="1">회원서비스</option>
						      <option value="2">캘린더</option>
						      <option value="3">자격증소개</option>
						      <option value="4">문제풀이</option>
						      <option value="5">채팅</option>
				    </select>
				  </div>
  
        <table class="table" id="qa-table">
        <tr>
        	<th width="5%">번호</th>
        	<th width="10%">작성자</th>
        	<th width="60%">제목</th>
        	<th width="10%">질문일</th>
        	<th width="10%">답변일</th>
        	<th width="5%">상태</th>
        </tr>
        <tr>
        	<td>번호</td>
        	<td>작성자</td>
        	<td>
        		<!-- 질문 -->
        		<!-- datatarget이 바뀌어야됨!!!! -->
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: What is Lorem Ipsum?</a>
              </h4>

            </div>
            <!-- 답변 -->
            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five <a href="http://jquery2dotnet.com/" class="label label-success">http://jquery2dotnet.com/</a> centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>
                </div>
            </div>
          </td>
        	<td>질문일</td>
        	<td>답변일</td>
        	<td>상태</td>
        </tr>
        <tr>
        	<td>번호</td>
        	<td>작성자</td>
        	<td>
        		<!-- 질문 -->
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: What is Lorem Ipsum?</a>
              </h4>

            </div>
            <!-- 답변 -->
            <div id="question1" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five <a href="http://jquery2dotnet.com/" class="label label-success">http://jquery2dotnet.com/</a> centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>
                </div>
            </div>
          </td>
        	<td>질문일</td>
        	<td>답변일</td>
        	<td>상태</td>
        </tr>
        
        </table>
        </div>
    </div>
    <!--/panel-group-->
</div>