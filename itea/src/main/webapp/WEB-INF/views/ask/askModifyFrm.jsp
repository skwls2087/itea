<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
th {
	text-align: center;
}
</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ask.css">

<script>
$(function(){
	$("#sBtn").click(function(){
		if($("#atitle").val().length==0){
			alert("제목을 입력하세요")
			return false;
		}
		
		var z = document.forms["aWriteFrm"]["pno"].value;
	    if(!z.match(/^\d+/))
	        {
	        alert("문제번호는 숫자만 입력이 가능합니다")
	        return false;
	        }
		
		if($("#acontent").val().length==0){
			alert("내용을 입력하세요")
			return false;
		}
		

	});
	
	
});
</script>

<div class="container">
	<h2 class="ask-heading">질문/토론 게시판</h2>
	<form id="aWriteFrm" action="../ask/askModifyProc.co">
	<input type="hidden" name="nowPage" value="${askDTO.nowPage}"/>
		<table class="table">
			<tr>
				<th width="10%">제목</th>
				<td><input type="text" id="atitle" name="atitle" value="${askDTO.atitle}" style="width:100%"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="acontent" name="acontent" rows="10" style="width:100%">${askDTO.acontent}</textarea></td>
			</tr>
			<tr style="text-align:center;">
				<td colspan="2">
					<input type="submit" class="btn btn-info" id="sBtn" value="수정" onclick="return validateForm()"/> 
					<input type="reset" class="btn btn-secondary" id="rBtn" value="취소" />
				</td>
			</tr>
		</table>
		<input type="hidden" id="pno" name="pno" value="${askDTO.pno}"/>
		<input type="hidden" id="ano" name="ano" value="${askDTO.ano}"/>
	</form>
</div>
