<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/chat.css">

<style>
th {
	text-align: center;
	background: gray;
}
#chBtn{
	height:85px;
	width:85px;
}
</style>
<script>
	function submitFunction(){
		var chcontent = $("#chcontent").val();
		$.ajax({
			type:"POST",
			url:"./chat/chatinsert",
			data:{
				chcontent : chcontent
			},
			success: function(result){
				if(result==1){
					alert("전송에 성공했습니다.");
				}else if(result==0){
					alert('내용을 정확히 입력하세요');
				}else{
					alert("데이터베이스 오류가 발생했습니다.");
				}
			}
		});
		$("#chatContent").val('');
	}
</script>
<div class="container">
	<table class="table">
		<tr>
			<td colspan="2">닉네임</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>시간</td>
		</tr>
	</table>
	<table>
		<tr>
			<td><textarea class="form-control" id="chcontent" rows="3" cols="150"></textarea></td>
			<td><input type="button" id="chBtn" class="form-control" value="입력" onclick="submitFunction();'"/></td>
		</tr>
	</table>
</div>
