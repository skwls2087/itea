<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang = "ko">
<head>
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
	 a{color:black ; text-decoration: none;}
	 a:hover{color:black ; text-decoration: none;}
		
	</style>
	<script>
	$(function(){
		
		
	});
	</script>
</head>	
<body>
<h1> it 연구소  빠밤<h1>
<hr/>
<div>
	<table class="table" >
		<tr>
				<td>내가 개발자가 된다면 행복할까?<br/>
				<a href="<%= request.getContextPath()%>/it/itTest.co"><input type="button" value="시작하기"></a></td>
		</tr>
	</table>
</div>
<table >



<p>개발자들이 사용했던, 그리고 원하는 언어</p>
<div>그래프</div>

</table>


</body>