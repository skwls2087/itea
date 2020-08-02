<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ask.css">

<script>
$(function(){
	$("#askSearch").click(function(){
		$("#askSearchFrm").submit();
	})
})
</script>

<div class="container" style="margin-top:100px">

<form action="../ask/askSearch.co" style="text-align:right" id="askSearchFrm">
	<select id="category" class="custom-select" name="category">
		<option value="title" selected>제목</option>
		<option value="ano">번호</option>
	</select>
	<input type="text" class="form-control" id="asearch" name="asearch"/>
		<img src="${pageContext.request.contextPath}/resources/img/search.png" id="askSearch" width="20" style="cursor:pointer;">
</form>
	
	<br>
	<table class="table" style="text-align:center">
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
			<td><a href="../ask/askCnt.co?ano=${ask.ano}&nowPage=${pInfo.nowPage}">${ask.atitle}</a></td>
			<td>${ask.lname}</td>
			<td>${ask.mnick}</td>
			<td><fmt:formatDate value="${ask.adate}" pattern="yyyy-MM-dd"/></td>
			<td>${ask.ahit}</td>
		</tr>
		</c:forEach>
	</table>
	<table style="text-align:center" width="100%">
		<tr>
			<td>
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