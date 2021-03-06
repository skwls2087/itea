<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/find.css">

<script>
$(function(){
	$("#findBtn").click(function(){
		$.ajax({
			url : "../member/find_pw.co",
			type : "POST",
			data : {
				mname : $("#mname").val(),
				mmail : $("#mmail").val()
			},
			success : function(result) {
				alert(result);
			},
		})
	});
})
</script>
<title>비밀번호 찾기</title>
</head>
<body>
<form id="find_pw" name="find_pw" method="post" action="../member/find_pw.co">
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4"  id="find_container">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>이름</label><br/>
					<input class="w3-input-sm" type="text" id="mname" name="mname" required>
				</p>
				<p>
					<label>이메일</label><br/>
					<input class="w3-input-sm" type="text" id="mmail" name="mmail" required>
				</p>
				<p class="w3-center">
					<button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
			</div>
		</div>
	</div>
	</form>
</body>
</html>
