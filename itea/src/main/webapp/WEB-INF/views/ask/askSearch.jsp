<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ask.css">
	
<div class="container">
	<h2 class="ask-heading">질문/토론 게시판</h2>
	<form action="../ask/asksearch.co">
		<select id="category" name="category">
			<option value="title" selected>제목</option>
			<option value="ano">번호</option>
		</select>
		<input type="text" id="asearch" name="asearch" placeholder="검색어를 입력하세요"/>
		<input type="button" id="sBtn" value="검색"/>
	</form>
	<table class="table" style="text-align:center">
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
			<td><a href="../ask/askCnt.co?ano=${ask.ano}&nowPage=${pInfo.nowPage}" style="color:black;">${ask.atitle}</a></td>
			<td>${ask.pno}</td>
			<td>${ask.lname}</td>
			<td>${ask.mnick}</td>
			<td>${ask.adate}</td>
			<td>${ask.ahit}</td>
		</tr>
		</c:forEach>
	</table>
	<table class="row text-center">
		<tr>
			<td colspan="7">
				<c:if test="${pInfo.nowPage eq 1}">
					이전
				</c:if>
				<c:if test="${pInfo.nowPage ne 1}">
					<a href="../ask/askList.co?nowPage=${pInfo.nowPage-1}">이전</a>
				</c:if>
				<c:forEach var="ask" begin="${pInfo.startPage}" end="${pInfo.endPage}">
					<a href="../ask/askList.co?nowPage=${ask}">${ask}</a>
				</c:forEach>
				<c:if test="${pInfo.nowPage eq pInfo.totalPage}">
					다음
				</c:if>
				<c:if test="${pInfo.nowPage ne pInfo.totalPage}">
					<a href="../ask/askList.co?nowPage=${pInfo.nowPage+1}">다음</a>
				</c:if>	
			</td>
		</tr>
	</table>
</div>