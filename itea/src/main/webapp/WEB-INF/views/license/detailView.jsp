<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/license.css">

<script>
	$(function(){
		$("#rBtn").click(function(){
			 	$(location).attr("href","licenseList.co");
		});
		$("#mBtn").click(function(){
			$(location).attr("href","../license/licenseModify.co?lno=${LDTO.lno}");
		});
		$("#dBtn").click(function(){
			yn=confirm("해당 자격증 정보를 삭제하시겠습니까?")
			if(yn){
				$(location).attr("href","../license/licenseDelete.co?lno=${LDTO.lno}");
			}
			else{
				return false;
			}
		});
	});
	</script>
	
<div class="container" id="license-container">	
	<div class="license-heading">자격증 상세</div>
	<form id="ifrm" action="../license/insertProc.co" method="post" encType="multipart/form-data">
    <table class="table" id="license-table">
			<tr class="license-head">
				<td width="50%">자격증명</td>
				<td width="50%">자격발급기관</td>
			</tr>
			<tr>
				<td>${LDTO.lname}</td>
				<td>${LDTO.lorg}</td>
			</tr>
			<tr class="license-head">
				<td>응시료</td>
				<td>자격증 분류기준</td>
			</tr>
			<tr>
				<td>${LDTO.lfee}</td>
				<td>${LDTO.lclass}</td>
			</tr>
			<tr class="license-head">
				<td colspan="2">시험일정 보러가기</td>
			</tr>
			<tr>
				<td colspan="2"><a href="${LDTO.la}" target="_blank">${LDTO.lorg}</a></td>
			</tr>
			<tr>
			<td colspan="2" class="license-head">자격요건</td>
			</tr>
			<tr>	
			<td colspan="2">${LDTO.lreq}</td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">시험과목</td>
			</tr>
			<tr>
				<td colspan="2" style="white-space:pre-line;">${LDTO.ldetail}</td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">검정기준 및 합격기준</td>
			</tr>
			<tr>
				<td colspan="2" style="white-space:pre-line;">${LDTO.lcut}</td>
			</tr>
			<tr>
				<td colspan="2" class="license-head">자격증 관련 소개</td>
			</tr>
			<tr>
				<td colspan="2" style="white-space:pre-line;">${LDTO.linfo} </div>
				</td>
			</tr>
			
			<tr id="license-button">
				<td colspan="2">
				<input type="button" class="btn btn-secondary" id="rBtn" name="rBtn" value="뒤로가기">
				<c:if test="${MNICK=='관리자'}">
					<input type="button" class="btn btn-info" id="mBtn" name="mBtn" value="수정하기">
					<input type="button"class="btn btn-danger" id="dBtn" name="dBtn" value="삭제하기">
				</c:if>
				</td>
			</tr>
			
		</table>
		
	</form>
</div>
