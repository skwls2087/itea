<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/snsjoin.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join.css">

<div class="container">

	<table class="table">

	<form id="join" class="form-signup" method="post" action="<%= request.getContextPath()%>/member/joinProcSNS.co">
		<h2 class="form-signup-heading">SNS 회원가입</h2>
		<span id="join-plus">추가정보를 입력하여 회원가입을 완료해 주세요</span><br/>
		<input type="hidden" id="mmail" name="mmail" value="${email}"/>
		<input type="hidden" id="class" name="mclass" value="2"/>
		<tr>
			<th width="30%">이메일</th>
			<td width="70%">${email}</td>
		</tr>
		<tr>
			<th><label for="mname">이름</label></th>
			<td><input type="text" id="mname" name="mname"/></td>
		</tr>
		<tr>
			<th><label for="mnick">닉네임</label></th>
			<td><input type="text" id="mnick" name="mnick"/>
			<button class="btn btn-outline-secondary" type="button" id="check_nickname">중복확인</button></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="hidden" id="mphone" name="mphone"/>
				<input type="text"  id="mphone1" name="mphone1" maxlength="3"/>
				- <input type="text"  id="mphone2" name="mphone2" maxlength="4"/> -
				<input type="text"  id="mphone3" name="mphone3" maxlength="4"/>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="date" id="mbirth" name="mbirth"/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" id="msex1" name="msex" value="남"/> 남&nbsp&nbsp
				<input type="radio" id="msex2" name="msex" value="여"/> 여
			</td>
		</tr>
		<tr>
			<th>최종학력(선택)</th>
			<td>
				<select name="mgradu">
					<option value="" selected>미공개</option>
					<option value="mschool">중학교 졸업</option>
					<option value="hschool">고등학교 졸업</option>
					<option value="tcollege">전문대 졸업</option>
					<option value="university">일반대학 졸업</option>
					<option value="graduate">대학원 졸업</option>			
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="text-center">
				<input type="submit" class="btn btn-outline-primary" id="sBtn" value="가입"/>
				<input type="button" class="btn btn-outline-primary" id="rBtn" value="취소"/>
			</td>
		</tr>
		</table>
	</form>

</div>