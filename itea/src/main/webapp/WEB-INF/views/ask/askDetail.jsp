<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	th{text-align:center}
</style>
<script>
	$(function(){
		$("#lBtn").click(function(){
			location.href="../ask/askList.co?nowPage=${askDTO.nowPage}"
		})
		
		$("#mBtn").click(function(){
			/* if(${askDTO.anick ne userNick}){
				alert("작성자만이 게시글을 수정할 수 있습니다.")
				return false;
			}  */
			location.href="../ask/askModifyFrm.co?ano=${askDTO.ano}"
		})
		
		$("#dBtn").click(function(){
			if(${askDTO.anick ne userNick}){
				alert("작성자만이 게시글을 삭제할 수 있습니다.")
				return false;
			}
			
			if(${askDTO.anick eq userNick}){
				confirm("정말로 삭제하시겠습니까?")
				return false;
			}
			
			location.href="../ask/askDelete.co?ano=${askDTO.ano}"
		})
	})
</script>

<div class="container">
	<table class="table">
		<tr>
			<th>번호</th>
			<td>${askDTO.ano}</td>
			<th>작성자</th>
			<td>${askDTO.anick}</td>
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
</div>