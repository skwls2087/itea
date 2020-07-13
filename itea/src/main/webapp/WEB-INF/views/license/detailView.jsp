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
	<script>
	$(function(){
		$("#rBtn").click(function(){
			alert("메인화면으로 이동합니다.");
			 	$(location).attr("href","../index.jsp");
		});
		$("#mBtn").click(function(){
			alert("수정화면으로 이동합니다.");
			$(location).attr("href","../license/licenseModify.co?lno=${LDTO.lno}");
		});
	});
	</script>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>자격증</title>
</head>
<body>
	<input type="button" class="" id="mBtn" name="mBtn" value="수정하기">
	<div class="container">자격증 상세</div>
	<form id="ifrm" action="../license/insertProc.co" 
	      method="post" encType="multipart/form-data">
		<table border="1">
			<tr>
				<td>자격증명</td>
				<td>${LDTO.lname}</td>
				<td>자격발급기관</td>
				<td>${LDTO.lorg}
				<input type="hidden"  id="lno"  name="lno" value="${LDTO.lno}" ></td>
			</tr>
			<tr>
				<td>응시료</td>
				<td>${LDTO.lfee}</td>
				<td>자격증 분류기준</td>
				<td>${LDTO.lclass}</td>
			</tr>
			<tr>
				<td>검정시험 일정</td>
				<td colspan="3"><a href=${LDTO.la}>보기</a></td>
			</tr>
			<td colspan="4">자격요건<br/>
					${LDTO.lreq}
			</td>
			</tr>
			<tr>
				<td colspan="4">시험과목<br/>
					${LDTO.ldetail}
				</td>
			</tr>
			<br>
			<td colspan="4">검정기준 및 합격기준</br> 
				${LDTO.lcut}
			</td>
			</tr>
			<tr>
				<td colspan="4">자격증 관련 소개<br/>
				${LDTO.linfo} 
				</td>
			</tr>
		</table>
		<button type="button" id="rBtn" class="btn btn-secondary">메인화면으로</button>
	</form>
</body>