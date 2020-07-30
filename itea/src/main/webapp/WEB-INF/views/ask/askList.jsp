<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	$(function(){
		$("#wBtn").click(function(){
				if(${mnick==null}){
					answer=confirm("회원인 경우만 글을 입력하실 수 있습니다. \n로그인 페이지로 이동하시겠습니까?");
					if (answer==true){
						location.href="../member/loginFrm.co";
					}else{
						return false;
					}

				}else{
					location.href="../ask/aWriteFrm.co";
				}
		});
	});
</script>
<div class="container" style="margin-top:100px">
	<form action="../ask/askSearch.co" style="text-align:right">
		<input type="text" id="asearch" name="asearch"/>
		<input type="submit" id="sBtn" value="검색"/>
	</form>
	<br>
	<table class="table" style="text-align:center">
		<tr>
			<th width="60">번호</th>
			<th width="280">제목</th>
			<th width="100">문제번호</th>
			<th width="150">자격증</th>
			<th width="90">작성자</th>
			<th width="100">등록일</th>
			<th width="70">조회수</th>
		</tr>
		<c:forEach var="ask" items="${list}">
		<tr>
			<td>${ask.ano}</td>
			<td><a href="../ask/askCnt.co?ano=${ask.ano}&nowPage=${pInfo.nowPage}" style="color:black;">${ask.atitle}</a></td>
			<td>${ask.pno}</td>
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