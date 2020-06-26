<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/join.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join.css">

<div class="container">

	<form id="join" class="form-signup" method="post" action="../member/joinProc.co">
	<h2 class="form-signup-heading">회원가입</h2>
	<table id="join-table" class="table">
	
	<tr>
		<td>이메일</td>
		<td><input type="text" id="memail" name="memail" style="width:80" value="${param.memail}">&nbsp;@
				<select id="memail2" name="memail2" >
			    <option value ="">선택하세요</option>
			    <option value ="naver.com" >naver.com</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value ="hanmail.net">daum.net</option>
			    <option value ="nate.com">nate.com</option> 
			    <option value ="yahoo.com">yahoo.com</option>
		    </select>
   			<button type="button" id="mverify" onclick="sendMail()" >이메일 인증</button>
   			<input type="hidden" id="authCode" /></td>
   </tr>
   <tr>
   	<td></td>
 			<td id="auth" class="hidden">
  				<input type="text" id="authCode2" />
  				<button type="button" id="mverify2" onclick="checkAuthCode()">인증하기</button>
 					<span id="checkAuthCodeResult"></span>
 			</td>
 		</tr>
	
		<tr>
			<th><label for="mmail">이메일</label></th>
			<td>
				<input type="email" id="mmail" name="mmail"/>
					<input type="hidden" id="authCode" />
					<button id="mail-button" type="button" class="btn btn-outline-secondary"  data-toggle="modal" 
					data-target="#myModal" onclick="checkMail()">인증</button>
			</td>
		</tr>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
	        	<span id="pop-header">이메일 인증코드</span><br/>
	        	<span id="pop-main">아이티어에 오신것을 환영합니다.<br/>
	        	아래의 인증코드를 올바르게 입력하시면 가입이 정상적으로 완료됩니다.<br/></span>
	        	<input type="text" id="mname" name="mname"/><br/>
	        	<span id="pop-footer">본 메일은 발신전용이며, 문의에 대한 회신은 처리되지 않습니다. 궁금하신 사항은 Q&A 게시판으로 문의주시기 바랍니다.</span>
	      </div>
	    </div>
	  </div>
	  </div>
		
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