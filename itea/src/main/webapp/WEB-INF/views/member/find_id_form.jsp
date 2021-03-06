<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/find.css">

<title>아이디 찾기</title>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#findBtn").click(function(){
		var mphone1 = $("#mphone1").val();
		var mphone2 = $("#mphone2").val();
		var mphone3 = $("#mphone3").val();
		var mphone = mphone1 +"-" + mphone2 +"-" + mphone3;
		document.getElementById("mphone").value=mphone;
	});
});
</script>
</head>
<body>
	<div class="w3-content w3-margin-top">
		<div class="w3-container w3-card-4" id="find_container">
			<form action="../member/find_id.co" method="post" id="find_id">
				<div class="w3-center w3-large w3-margin-top w3-margin-bottom">
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>이름</label><br/>
						<input class="w3-input-sm" type="text" id="mname" name="mname" required>
					</p>
					<p><label>휴대폰번호</label><br/>
						<input type="hidden" id="mphone" name="mphone"/>
						<input class="w3-input-sm" type="text" id="mphone1" name="mphone1" maxlength="3" required>
						- <input class="w3-input-sm" type="text" id="mphone2" name="mphone2" maxlength="4" required>
						- <input class="w3-input-sm" type="text" id="mphone3" name="mphone3" maxlength="4" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>