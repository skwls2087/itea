<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/license.css">

	<script>
	$(function(){
		$("#sBtn").click(function(){
			alert("입력하신 내용을 등록합니다.");
			$("#ifrm").submit();
		});
	});
	</script>
	
<div class="container" id="license-container">
	<h2 class="license-heading">자격증 등록</h2>
	<form id="ifrm" action="../license/insertProc.co" >
		<table class="table" id="license-table">
			<tr class="license-head">
				<td width="50%">자격증명</td>
				<td width="50%">자격발급기관</td>
			</tr>
			<tr>
				<td><input type="text" id="lname" name="lname" ></td>
				<td><input type="text"  id="lorg" name="lorg" ></td>
			</tr>
			<tr class="license-head">
				<td>응시료</td>
				<td>자격증 분류기준</td>
			</tr>
			<tr>
				<td><input type="text"  id="lfee" name="lfee"></td>
				<td><input type="text" id="lclass" name="lclass"></td>
			</tr>
			<tr class="license-head">
				<td colspan="2">검정시험 일정</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="la" id="la"  size="50" placeholder="시험일정이 있는 url을 입력하세요."></td>
			</tr>
			<tr>
			<td colspan="2" class="license-head">자격요건</td>
			</tr>
			<tr>	
			<td colspan="2"><textarea id="lreq" name="lreq"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">시험과목</td>
			</tr>
			<tr>
				<td colspan="2"><textarea  id="ldetail" name="ldetail"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">검정기준 및 합격기준</td>
			</tr>
			<tr>
				<td colspan="2"><textarea  id="lcut" name="lcut"
			placeholder="검정기준 및 합격기준을 입력하세요" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">자격증 관련 소개</td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="linfo" name="linfo"
			placeholder="자격증에 대한 전반적 소개를 입력하세요" cols="50" rows="10"></textarea> 
				</td>
			</tr>
			<tr id="license-insert-buttons">
			<td colspan="2"><input type="button" class="btn btn-info" id="sBtn" name="" value="등록">
			<input type="button" class="btn btn-secondary" id="rBtn" name="" value="취소"></td>
			</tr>
		</table>
	</form>
</div>