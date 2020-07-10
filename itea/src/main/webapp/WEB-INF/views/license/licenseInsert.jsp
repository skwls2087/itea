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
			alert("소개페이지로 이동합니다.");
			 	$(location).attr("href","../license/licenseList.co");
		});
		$("#sBtn").click(function(){
			alert("입력하신 내용을 등록합니다.");
			$("#ifrm").submit();
		});
	});
	</script>
</head>	
<body>
	<div class="container">자격증 등록</div>
	<form id="ifrm" action="../license/insertProc.co" >
		<table border="1">
			<tr>
				<td>자격증명</td>
				<td><input type="text" id="lname" name="lname"></td>
				<td>자격발급기관</td>
				<td><input type="text"  id="lorg" name="lorg"></td>
			</tr>
			<tr>
				<td>응시료</td>
				<td><input type="text"  id="lfee" name="lfee"></td>
				<td>자격증 분류기준</td>
				<td><input type="text" id="lclass" name="lclass"></td>
			</tr>
			<tr>
				<td>검정시험 일정</td>
				<td colspan="3"><input type="text" name="la" id="la"  size="50" placeholder="시험일정이 있는 url을 입력하세요."></td>
			</tr>
			<td colspan="4">자격요건<br/>
					<textarea id="lreq" name="lreq"></textarea>
			</td>
			</tr>
			<tr>
				<td colspan="4">시험과목<br/>
					<textarea  id="ldetail" name="ldetail"></textarea>
				</td>
			</tr>
			<br>
			<td colspan="4">검정기준 및 합격기준</br> 
		<textarea  id="lcut" name="lcut"
			placeholder="검정기준 및 합격기준을 입력하세요" cols="50" rows="10"></textarea>
			</td>
			</tr>
			<tr>
				<td colspan="4">자격증 관련 소개<br/>
				<textarea id="linfo" name="linfo"
			placeholder="자격증에 대한 전반적 소개를 입력하세요" cols="50" rows="10"></textarea> 
				</td>
			</tr>
			<tr>
				<td colspan="4">시험 유형<br />
				<input type="hidden" id="lfreeq" name="lfreeq">			
				</td>
			</tr>
			<tr>
			<td colspan="4"><input type="button" class="" id="sBtn" name="" value="등록">
			<input type="button"class="" id="rBtn" name="" value="취소"></td>
			</tr>
		</table>
	</form>
</body>