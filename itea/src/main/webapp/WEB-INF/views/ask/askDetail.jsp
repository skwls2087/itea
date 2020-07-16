<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	th{text-align:center}
	.table{margin-top:100px}
	.hide{display:none;}
	#sBtn{height:85px;width:120px;}
	#sBtn1{height:85px;width:120px;}
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
			location.href="../ask/askModifyFrm.co?ano=${askDTO.ano}&nowPage=${askDTO.nowPage}";
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
			
		$("#sBtn").click(function(){
			if(${userNick==null}){
				alert("회원만이 댓글을 등록할 수 있습니다.");
				return false;
			}
			if($("#accontent").val().length==0){
				alert("내용을 입력해주세요.")
				return false;
			}
		});

		$("#sBtn1").click(function(){
			if(${userNick==null}){
				alert("회원만이 댓글을 등록할 수 있습니다.");
				return false;
			}
			if($("#accontent1").val().length==0){
				alert("내용을 입력해주세요.")
				return false;
			}
		});
		
		$(".tog").click(function(){
			$(".hide").toggle();
		});	

			
		
	});	
	
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
	<form action="askReplyInsert.co">
	<input type="hidden" name="ano" value="${askDTO.ano}"/>
	<input type="hidden" name="nowPage" value="${askDTO.nowPage}"/>
	<table class="table">
		<tr>
			<td colspan="2"><textarea name="accontent" id="accontent" cols="70" rows="3" class="form-control" placeholder="댓글 내용을 입력하세요"></textarea></td>
			<td><input type="submit" id="sBtn" value="등록" class="form-control"></td>
		</tr>
	</table>
	</form>
	<c:forEach var="reply" items="${list}">
	<c:if test="${reply.acdepth==0}">
	<form id="coReplyInsert" action="askcoReplyInsert.co">
	<table class="table" style="margin-top:0px;">
		<tr>
			<td>
				${reply.mnick}(<fmt:formatDate value="${reply.acdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
				<br>
				${reply.accontent}
				<br>
				<div class="tog">답글쓰기
				<c:if test="${userNick eq reply.mnick}">
					<a href="askReplyDelete.co?acdepth=${reply.acdepth}&acno=${reply.acno}&nowPage=${askDTO.nowPage}&ano=${askDTO.ano}">삭제</a>
				</c:if>
				</div>
			</td>
		</tr>
		<tr class="hide">
			<td>
				<input type="hidden" name="ano" value="${askDTO.ano}"/>
				<input type="hidden" name="nowPage" value="${askDTO.nowPage}"/>
				<input type="hidden" name="acno" value="${reply.acno}"/>
				<textarea name="accontent" id="accontent1" cols="70" rows="3" class="form-control" placeholder="답글 내용을 입력하세요"></textarea>
			</td>
			<td>
				<input type="submit" id="sBtn1" value="등록" class="form-control">
			</td>
		</tr>
	</table>	
	</form>
	</c:if>
	<c:if test="${reply.acdepth==1}">
	<table style="margin:0px 0px 30px 50px;">
		<tr>
			<td>
				${reply.mnick}(<fmt:formatDate value="${reply.acdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
				<br>
				${reply.accontent}
				<br>
				<c:if test="${userNick eq reply.mnick}">
					<a href="askReplyDelete.co?acdepth=${reply.acdepth}&acno=${reply.acno}&nowPage=${askDTO.nowPage}&ano=${askDTO.ano}">삭제</a>
				</c:if>
			</td>
		</tr>
	</table>	
	</c:if>
	</c:forEach>
</div>




