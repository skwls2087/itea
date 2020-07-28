<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/license.css">

	<script>
	$(function(){
		$("#sBtn").click(function(){
			$("#mfrm").submit();
		});
		$("#rBtn").click(function(){
			 	$(location).attr("href","../license/licenseList.co");
		});
		
		
	});
	</script>

<div class="container" id="license-container">	
	<div class="license-heading">자격증 수정</div>
	<form id="mfrm" method="post" action="../license/modify.co?lno=${lDto.lno}" > 
		<table class="table" id="license-table">
			<tr class="license-head">
				<td width="50%">자격증명</td>
				<td width="50%">자격발급기관</td>
			</tr>
			<tr>
				<td><input type="text" id="lname" name="lname" style="width:85%" placeholder="자격증 명칭을 입력하세요." value="${lDto.lname}"> </td>
				<td><input type="text"  id="lorg" name="lorg" style="width:85%" placeholder="자격증을 발급하는 기관명을 입력하세요." value="${lDto.lorg}"></td>
			</tr>
			<tr class="license-head">
				<td>응시료</td>
				<td>자격증 분류기준</td>
			</tr>
			<tr>
				<td><input type="text"  id="lfee" name="lfee" style="width:85%" placeholder="자격증 응시료를 전부 입력하세요." value="${lDto.lfee}"></td>
				<td><input type="text" id="lclass" name="lclass" style="width:85%" placeholder="공인,민간자격증을 분류하세요." value="${lDto.lclass}"></td>
			</tr>
			<tr class="license-head">
				<td colspan="2">시험일정 보러가기</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="la" id="la"  size="50" placeholder="시험일정을 볼 수 있는 url을 입력하세요." style="width:100%" value="${lDto.la}"></td>
			</tr>
			<tr>
			<td colspan="2" class="license-head">자격요건</td>
			</tr>
			<tr>	
			<td colspan="2"><div class="wrap"><textarea id="lreq" name="lreq" cols="50" rows="10" placeholder="자격증 응시를 위한 자격요건을 입력하세요.">${lDto.lreq}</textarea></div></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">시험과목</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap"><textarea  id="ldetail" name="ldetail" cols="50" rows="10" placeholder="시험과목에 대한 상세설명을 입력하세요.">${lDto.ldetail}</textarea></div></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">검정기준 및 합격기준</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap"><textarea  id="lcut" name="lcut"
			placeholder="검정기준 및 합격기준을 입력하세요" cols="50" rows="10">${lDto.lcut}</textarea></div></td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">자격증 관련 소개</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap"><textarea id="linfo" name="linfo"
			placeholder="자격증에 대한 전반적 소개를 입력하세요" cols="50" rows="10">${lDto.linfo}</textarea> </div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">자격증 시험유형</td>
			</tr>
			<tr>
				<td colspan="2"><div class="wrap">
						<select name="lqclass" id="lqclass" size="3">
							<option value="1" <c:if test="${lDto.lqclass=='필기'}"> selected='selected' </c:if>>필기,실기</option>
							<option value="2" <c:if test="${lDto.lqclass=='1차'}"> selected='selected' </c:if>>1차,2차</option>
							<option value="3" <c:if test="${lDto.lqclass=='단독'}"> selected='selected' </c:if>>단독시험</option>
						</select>
					</div>
				</td>
			</tr>
			<tr id="license-button">
			<td colspan="2">
				<input type="button" class="btn btn-info" id="sBtn" value="수정">
				<input type="button" class="btn btn-secondary" id="rBtn" value="취소">
			</td>
			</tr>
		</table>
	</form>
</div>
