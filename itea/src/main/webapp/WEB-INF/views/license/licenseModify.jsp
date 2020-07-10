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
		$("#sBtn").click(function(){
			alert("수정하여 자격증 소게페이지로 이동합니다.");
			$("#mfrm").submit();
		});
		$("#rBtn").click(function(){
			alert("소개페이지로 이동합니다.");
			 	$(location).attr("href","../license/licenseList.co");
		});
		$("#dBtn").click(function(){
			alert("관련정보를 삭제합니다.");
			 $(location).attr("href","../license/licenseDelete.co?lno=${lDto.lno}");
		});
		
	});
	</script>
</head>
<body>
<body>
	<div class="container">자격증 수정 및 삭제</div>
	<form id="mfrm" action="../license/modify.co?lno=${lDto.lno}" > 
		<table border="1">
			<tr>
				<td>자격증명</td>
				<td><input type="text" id="lname" name="lname" value="${lDto.lname}"></td>
				<td>자격발급기관</td>
				<td><input type="text"  id="lorg" name="lorg" value="${lDto.lorg}">
				<input type="hidden"  id="lno"  name="lno" value="${lDto.lno}"></td>
			</tr>
			<tr>
				<td>응시료</td>
				<td><input type="text"  id="lfee" name="lfee" value="${lDto.lfee}"></td>
				<td>자격증 분류기준</td>
				<td><input type="text"id="lclass" name="lclass" value="${lDto.lclass}"></td>
			</tr>
			<tr>
				<td>검정시험 일정</td>
				<td colspan="3"><input type="text" name="la" id="la"  size="50" value="${lDto.la}"></td>
			</tr>
			<td colspan="4">자격요건<br/>
					<textarea id="lreq" name="lreq" >${lDto.lreq}</textarea>
			</td>
			</tr>
			<tr>
				<td colspan="4">시험과목<br/>
					<textarea  id="ldetail" name="ldetail" >${lDto.ldetail}</textarea>
				</td>
			</tr>
			<br>
			<td colspan="4">검정기준 및 합격기준</br> 
		<textarea  id="lcut" name="lcut"
		 cols="50" rows="10" >${lDto.lcut}</textarea>
			</td>
			</tr>
			<tr>
				<td colspan="4">자격증 관련 소개<br/>
				<textarea id="linfo" name="linfo"
			cols="50" rows="10" >${lDto.linfo}</textarea> 
				</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap">
						<select name="lqclass" id="lqclass" size="6">
							<option value="1" <c:if test="${lDto.lqclass=='필기'}"> selected='selected' </c:if>>필기,실기</option>
							<option value="2" <c:if test="${lDto.lqclass=='1차'}"> selected='selected' </c:if>>1차,2차</option>
							<option value="3" <c:if test="${lDto.lqclass=='단독'}"> selected='selected' </c:if>>단독시험</option>
						</select>
					</div>
				</td>
			</tr>
			</tr>
		</table>
		<input type="button" class="" id="sBtn" name="" value="수정">
		<input type="button"class="" id="rBtn" name="" value="취소">
		<input type="button"class="" id="dBtn" name="" value="삭제">
	</form>
</body>