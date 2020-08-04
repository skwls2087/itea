<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ask.css">

<div class="container">
	<h2 class="ask-heading">질문/토론 게시판</h2>
	<form action="../ask/asksearch.co">
		<select id="category" name="category">
			<option value="title" selected>제목</option>
			<option value="pno">문제번호</option>
		</select> <input type="text" id="asearch" name="asearch"
			placeholder="검색어를 입력하세요" /> <input type="button" id="sBtn"
			value="검색" />
	</form>
	<table class="table" style="text-align: center">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>문제번호</th>
			<th>자격증</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="ask" items="${list}">
			<tr>
				<td>${ask.ano}</td>
				<td><a
					href="../ask/askCnt.co?ano=${ask.ano}&nowPage=${pInfo.nowPage}"
					style="color: black;">${ask.atitle}</a></td>
				<td>${ask.pno}</td>
				<td>${ask.lname}</td>
				<td>${ask.mnick}</td>
				<td>${ask.adate}</td>
				<td>${ask.ahit}</td>
			</tr>
		</c:forEach>
	</table>
	<table style="text-align: center" width="100%">
		<c:if test="${pInfo.totalCount>0}">
			<tr>
				<td colspan="7">
					<div>
						<ul class="pagination" id="a-paging">
							<!-- 검색조건이 없을 때는 페이지넘버만 파라미터로 보내기 -->
							<c:if test="${null ne asearch}">
								<!-- 이전페이지 -->
								<c:if test="${pInfo.nowPage ne 1}">
									<li class="page-item"><a class="page-link"
										href="<%= request.getContextPath()%>/ask/askList.co?nowPage=${pInfo.nowPage-1}&asearch=${askDTO.asearch}">&laquo;</a>
									</li>
								</c:if>
								<c:if test="${pInfo.nowPage eq 1}">
									<li class="page-item disabled"><a class="page-link"
										href="#">&laquo;</a></li>
								</c:if>

								<!-- 페이지 -->
								<c:forEach var="pg" begin="${pInfo.startPage}"
									end="${pInfo.endPage}">
									<c:if test="${pInfo.nowPage==pg}">
										<li id="q-nowPage" class="page-item active"></li>
									</c:if>
									<c:if test="${pInfo.nowPage!=pg}">
										<li id="q-nowPage" class="page-item"></li>
									</c:if>
									<a class="page-link"
										href="<%= request.getContextPath()%>/ask/askList.co?nowPage=${pg}&asearch=${askDTO.asearch}">${pg}</a>
								</c:forEach>

								<!-- 다음페이지 -->
								<c:if test="${pInfo.nowPage ne pInfo.totalPage}">
									<li class="page-item"><a class="page-link"
										href="<%= request.getContextPath()%>/ask/askList.co?nowPage=${pInfo.nowPage+1}&asearch=${askDTO.asearch}">&raquo;</a>
									</li>
								</c:if>
								<c:if test="${pInfo.nowPage eq pInfo.totalPage}">
									<li class="page-item disabled"><a class="page-link"
										href="#}">&raquo;</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</td>
			</tr>
		</c:if>
	</table>
</div>