<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
th {
	text-align: center;
}
</style>
<script>
function validateForm()
{

    var z = document.forms["aWriteFrm"]["pno"].value;
    if(!z.match(/^\d+/))
        {
        alert("문제번호는 숫자만 입력이 가능합니다")
        return false;
        }
}
</script>

<div class="container">
	<form id="aWriteFrm" action="../ask/aWriteProc.co">
		<table class="table">
			<tr>
				<th>제목</th>
				<td width="200"><input type="text" id="atitle" name="atitle"
					size="50" /></td>
				<th>문제번호</th>
				<td><input type="text" id="pno" name="pno" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><textarea id="acontent" name="acontent" cols="100" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" id="sBtn" value="확인" onclick="return validateForm()"/> 
					<input type="reset" id="rBtn" value="취소" />
				</td>
			</tr>
		</table>
	</form>
</div>
