<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/join.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join.css">

<div class="container">

	<form id="join" class="form-signup" method="post" action="../member/joinProc.co">
		<h2 class="form-signup-heading">회원가입</h2>
	<table id="join-table" class="table">

		<!-- 이메일을 입력한다. 인증을 누르면 유효성검사&중복검사 -->
		<tr>
			<th><label for="email">이메일</label></th>
			<td>
			<input type="text" id="mmail" name="mmail" value="" style="display:none;"/>
			<div id="email-input">
				<input type="text" id="email" name="email" style="width:120px"/>&nbsp;@
					<select id="email2" name="email2"  class="form-control" >
					    <option value ="">선택하세요</option>
					    <option value ="naver.com" >naver.com</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value ="hanmail.net">daum.net</option>
					    <option value ="nate.com">nate.com</option> 
				    </select>
		   			<button type="button" class="btn btn-outline-secondary" id="check_mail">인증</button><br/>
	   			<!-- 인증코드 입력란 -->
	   			<div id="checkCODE" style="display:none;">
	   				<input type="hidden" value="" id="realcode" name="realcode"/>
	   				<input type="text" id="usercode" name="usercode" style="width:200px;" placeholder="인증번호를 입력하세요"/>
		   			<button type="button" class="btn btn-secondary" id="check_code">확인</button>
	   			</div>
   			</div>
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
			<td><input type="text" id="mnick" name="mnick" style="width:200px;"/>
			<button class="btn btn-outline-secondary" type="button" id="check_nickname">중복확인</button></td>
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