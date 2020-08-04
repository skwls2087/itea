<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ask.css">

<script>
	$(function() {
		$("#askSearch").click(function() {
			$("#askSearchFrm").submit();
		})
	})
</script>

<div class="container">

	<h2 class="ask-heading">질문/토론 게시판</h2>

	<form action="../ask/askSearch.co" style="text-align: right"
		id="askSearchFrm">
		<select id="category" class="custom-select" name="category">
			<option value="title" selected>제목</option>
			<option value="pno">문제번호</option>
		</select> <input type="text" class="form-control" id="asearch" name="asearch" />
		<img src="${pageContext.request.contextPath}/resources/img/search.png"
			id="askSearch" width="20" style="cursor: pointer;">
	</form>

	<br>
	<table class="table" style="text-align: center">
		<thead class="thead-light">
			<tr>
				<th width="100">문제번호</th>
				<th width="280">제목</th>
				<th width="150">자격증</th>
				<th width="90">작성자</th>
				<th width="100">등록일</th>
				<th width="70">조회수</th>
			</tr>
		</thead>
		<c:forEach var="ask" items="${list}">
			<tr>
				<td>${ask.pno}</td>
				<td><a
					href="../ask/askCnt.co?ano=${ask.ano}&nowPage=${pInfo.nowPage}">${ask.atitle}</a></td>
				<td>${ask.lname}</td>
				<td>${ask.mnick}</td>
				<td><fmt:formatDate value="${ask.adate}" pattern="yyyy-MM-dd" /></td>
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
							<c:if test="${null eq asearch}">
								<!-- 이전페이지 -->
								<c:if test="${pInfo.nowPage ne 1}">
									<li class="page-item"><a class="page-link"
										href="<%= request.getContextPath()%>/ask/askList.co?nowPage=${pInfo.nowPage-1}">&laquo;</a>
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
										href="<%= request.getContextPath()%>/ask/askList.co?nowPage=${pg}">${pg}</a>
								</c:forEach>

								<!-- 다음페이지 -->
								<c:if test="${pInfo.nowPage ne pInfo.totalPage}">
									<li class="page-item"><a class="page-link"
										href="<%= request.getContextPath()%>/ask/askList.co?nowPage=${pInfo.nowPage+1}">&raquo;</a>
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