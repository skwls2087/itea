<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	th{text-align:center}
	.table{margin-top:100px}
</style>
<script>
	$(function(){
		$("#lBtn").click(function(){
			location.href="../ask/askList.co?nowPage=${askDTO.nowPage}";
		});
		
		$("#mBtn").click(function(){
			 if(${askDTO.mnick ne userNick}){
				alert("작성자만이 게시글을 수정할 수 있습니다.");
				return false;
			};  
			location.href="../ask/askModifyFrm.co?ano=${askDTO.ano}";
		});
		
		$("#dBtn").click(function(){
			if(${askDTO.mnick ne userNick}){
				alert("작성자만이 게시글을 삭제할 수 있습니다.");
				return false;
			};
			
			if(${askDTO.mnick eq userNick}){
				confirm("정말로 삭제하시겠습니까?");
				return false;
			}else{
				location.href="../ask/askDelete.co?ano=${askDTO.ano}";
			};
		});	
			
		//댓글 삽입
	/* 	$("#sBtn").click(function(){
			if(${userNick==null}){
				alert("작성자만이 게시글을 수정할 수 있습니다.");
			}else if(${userNick != null}{
				var accontent = $("#accontent").val();
				var ano="${askDTO.ano}"
				var param="accontent="+accontent+"&ano="+ano;
				$.ajax({
					type="post"
					url:"${path}/ask/askReplyInsert.co"
					data:param,
					success: function(){
						alert("댓글이 등록되었습니다.");
						askReply2();
					}
				});
			});	
		});	 */
	});
	
	
	//댓글 목록 1
	/* function askReply(){
		$.ajax({
			type:"get"
			url:"${path}/ask/"
		})
	} */
	
	
</script>

<div class="container">
	<table class="table">
		<tr>
			<th>번호</th>
			<td>${askDTO.ano}</td>
			<th>작성자</th>
			<td>${askDTO.mnick}</td>
		</tr>
		<tr>
			<th>문제번호</th>
			<td>${askDTO.pno}</td>
			<th>자격증</th>
			<td>${askDTO.lname}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${askDTO.atitle}</td>
		</tr>
		<tr>
			<td colspan="4"></br>${askDTO.acontent}</td>
		</tr>
		<tr>
			<td colspan="4" class="text-right">
				<input type="button" id="lBtn" value="목록"/>
				<input type="button" id="mBtn" value="수정"/>
				<input type="button" id="dBtn" value="삭제"/>
			</td>
		</tr>
	</table>
	<form action="ask/askReplyInsert.co">
	<input type="hidden" name="ano" value="${askDTO.ano}"/>
	<table class="table">
		<tr>
			<th>댓글</th>
			<td colspan="2"><textarea name="accontent" cols="30" rows="3" class="form-control" placeholder="내용을 입력하세요"></textarea></td>
			<td><input type="submit" id="sBtn" value="등록" class="form-control"></td>
		</tr>
	</table>
	</form>
	<table>
		<c:forEach var="reply" items="${list}">
		<tr>
			<td>
				${reply.mnick}(<fmt:formatDate value="${reply.acdate}" pattern="yyyy-MM-dd a HH:mm:ss"/>)
				<br>
				${reply.accontent}
				<br>
				<a>답글쓰기</a> 
				<c:if test="${userNick eq reply.mnick }">
					<a href="ask/askReplyDelete.co?acno=${list.acno}">삭제</a>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>