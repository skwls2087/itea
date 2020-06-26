<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<script src="${pageContext.request.contextPath}/resources/js/join.js" type="text/javascript"></script>

<style>
	.form-signup-heading{margin: 31px 0px;}
	th{font-family: 'Noto Sans KR', sans-serif;}
	#join-table{max-width:540px;}
	#mail-button{height:30px;width:50px;padding:0px;font-family: 'Noto Sans KR', sans-serif;}
</style>

<div class="container">

	<form id="join" class="form-signup" method="post" action="../member/joinProc.co">
	<h2 class="form-signup-heading">회원가입</h2>
	<table id="join-table" class="table">
		<tr>
			<th><label for="mmail">이메일</label></th>
			<td><input type="email" id="mmail" name="mmail"/>
					<input type="hidden" id="authCode" /></td>
			<!-- <button id="mail-button" type="button" class="btn btn-outline-secondary" 
					onclick="window.open('address','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">인증</button> -->
					<button id="mail-button" type="button" class="btn btn-outline-secondary" 
					onclick="checkMail()">인증</button>
			</td>
		</tr>
		<tr id="joincode">
			<th>인증번호</th>
			<td>
				<input type='number' name="inputCode" id="inputCode" class="form-control"
							placeholder="코드를 입력하세요"/>
				<input type="button" value="확인" class="btn btn-primary btn-sm" onclick="checkJoinCode()">
			</td>
		</tr>
		<tr>
			<th><label for="mpw">비밀번호</label></th>
			<td><input type="password" id="mpw" name="mpw"/></td>
		</tr>
		<tr>
			<th><label for="mpw1">비밀번호확인</label></th>
			<td><input type="password" id="mpw1" name="mpw1"/></td>
		</tr>
		<tr>
			<th><label for="mname">이름</label></th>
			<td><input type="text" id="mname" name="mname"/></td>
		</tr>
		<tr>
			<th><label for="mnick">닉네임</label></th>
			<td><input type="text" id="mnick" name="mnick"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="hidden" id="mphone" name="mphone"/>
				<input type="text" style="width:80px;" id="mphone1" name="mphone1" maxlength="3"/>
				- <input type="text" style="width:80px;" id="mphone2" name="mphone2" maxlength="4"/> -
				<input type="text" style="width:80px;" id="mphone3" name="mphone3" maxlength="4"/>
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
					<option value="" selected>선택</option>
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