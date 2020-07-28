<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/license.css">

	<script>
	$(function(){
		$("#license-insert-button").click(function(){
			if($("#lname").val().length==0){
				alert("자격증 명칭을 입력하지 않았습니다.")
				$("#lname").focus();
				return false;
			}
			if($("#lorg").val().length==0){
				alert("자격증 발급기관명칭을 입력하지 않았습니다.")
				$("#lorg").focus();
				return false;
			}
			if($("#lfee").val().length==0){
				alert("자격증 응시료를 입력하지 않았습니다.")
				$("#lfee").focus();
				return false;
			}
			if($("#lclass").val().length==0){
				alert("자격증 분류를 입력하지 않았습니다.")
				$("#lclass").focus();
				return false;
			}
			if($("#la").val().length==0){
				alert("자격증 시험일정을 입력하지 않았습니다.")
				$("#la").focus();
				return false;
			}
			if($("#lreq").val().length==0){
				alert("자격증 자격요건을 입력하지 않았습니다.")
				$("#lreq").focus();
				return false;
			}
			if($("#ldetail").val().length==0){
				alert("자격증시험 과목을 입력하지 않았습니다.")
				$("#ldetail").focus();
				return false;
			}
			if($("#lcut").val().length==0){
				alert("검정기준 및 합격기준을 입력하지 않았습니다.")
				$("#lcut").focus();
				return false;
			}
			if($("#linfo").val().length==0){
				alert("자격증 소개글을 입력하지 않았습니다.")
				$("#linfo").focus();
				return false;
			}
			$("#ifrm").submit();
		});
		
		$("#license-back-button").click(function(){
			yn=confirm("입력하신 내용을 무시하고 목록으로 돌아가시겠습니까?")
			if(yn){
				$(location).attr("href","licenseList.co");
			}
			else{
				return false;
			}
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
				<td colspan="2">시험일정 보러가기</td>
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
			<tr>
				<td colspan="2" class="license-head">자격증 시험유형</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap">
						<select name="lqclass" id="lqclass" size="3">
							<option value="1">필기,실기</option>
							<option value="2">1차,2차</option>
							<option value="3">단독시험</option>
						</select>
					</div>
				</td>
			</tr>
			<tr id="license-button">
			<td colspan="2">
				<input type="button" class="btn btn-info" id="license-insert-button" value="등록">
				<input type="button" class="btn btn-secondary" id="license-back-button" value="취소">
			</td>
			</tr>
		</table>
	</form>
</div>