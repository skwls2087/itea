<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function(){
		$("#wBtn").click(function(){
				if(${anick==null}){
					answer=confirm("회원인 경우만 글을 입력하실 수 있습니다. \n로그인 페이지로 이동하시겠습니까?")
					if (answer==true){
						$(location).href("../member/loginFrm.co")
					}else{
						return false;
					}

				}
				
		})
	})
</script>
<div class="container">
	${pInfo}
	<form action="../ask/asearch.co">
		<input type="text" id="asearch" name="asearch"/>
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
			<td>${ask.anick}</td>
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
	<table class="row text-left">
		<tr>
			<td colspan="7">
				<a href="../ask/aWriteFrm.co">
					<input type="button" id="wBtn" value="글쓰기"/>
				</a>
			</td>
		</tr>
	</table>
</div>