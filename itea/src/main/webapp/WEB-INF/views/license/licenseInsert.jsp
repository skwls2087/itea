<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/license.css">

	<script>
	$(function(){
		$("#license-insert-button").click(function(){
			alert("입력하신 내용을 등록합니다.");
			$("license-insert-button").submit();
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
				<td><input type="text" id="lname" name="lname" style="width:85%" placeholder="자격증 명칭을 입력하세요."></td>
				<td><input type="text"  id="lorg" name="lorg" style="width:85%" placeholder="자격증을 발급하는 기관명을 입력하세요."></td>
			</tr>
			<tr class="license-head">
				<td>응시료</td>
				<td>자격증 분류기준</td>
			</tr>
			<tr>
				<td><input type="text"  id="lfee" name="lfee" style="width:85%" placeholder="자격증 응시료를 전부 입력하세요."></td>
				<td><input type="text" id="lclass" name="lclass" style="width:85%" placeholder="공인,민간자격증을 분류하세요."></td>
			</tr>
			<tr class="license-head">
				<td colspan="2">검정시험 일정</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="la" id="la"  size="50" placeholder="시험일정을 볼 수 있는 url을 입력하세요." style="width:100%"></td>
			</tr>
			<tr>
			<td colspan="2" class="license-head">자격요건</td>
			</tr>
			<tr>	
			<td colspan="2"><div class="wrap"><textarea id="lreq" name="lreq" cols="50" rows="10" placeholder="자격증 응시를 위한 자격요건을 입력하세요."></textarea></div></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">시험과목</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap"><textarea  id="ldetail" name="ldetail" cols="50" rows="10" placeholder="시험과목에 대한 상세설명을 입력하세요."></textarea></div></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">검정기준 및 합격기준</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap"><textarea  id="lcut" name="lcut"
			placeholder="검정기준 및 합격기준을 입력하세요" cols="50" rows="10"></textarea></div></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">자격증 관련 소개</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap"><textarea id="linfo" name="linfo"
			placeholder="자격증에 대한 전반적 소개를 입력하세요" cols="50" rows="10"></textarea> </div>
				</td>
			</tr>
			<tr id="license-insert-button">
			<td colspan="2"><input type="button" class="btn btn-info" id="license-insert-button" value="등록">
			<input type="button" class="btn btn-secondary" id="license-back-button" value="취소"></td>
			</tr>
		</table>
	</form>
</div>