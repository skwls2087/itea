<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 관리자페이지에서의 모든 로직은 비밀번호를 확인한 후 실행한다. -->

<div class="title">
	<a href="<%= request.getContextPath()%>/admin.co" >관리자 페이지</a>
</div>

<a href="<%= request.getContextPath()%>/admin/memberList.co" class="user-button">회원관리</a>

<div class="admin-user">

	<div class="checkAdminPw">
		<form name="adminPwForm" method="post" action="<%= request.getContextPath()%>/admin/checkAdminPw.co">
			<p class="pwPlease">비밀번호를 입력해주세요</p>
			<p><input type="password" name="adminPw"/></p>
			
			<!-- 비밀번호가 틀렸다면 에러메시지 출력 -->
			<p class="pwError">${error}</p>
			
			<!-- 로직을 실행하는 데 필요한 파라미터들을 셋팅 -->
			<input type="hidden" name="mnick" value="${param.mnick}">
			<input type="hidden" name="service" value="${param.service}">
			
			<input type="submit" value="확인" class="pwSubmit"/>
			<input type="button" value="취소" onclick="history.back()" class="pwCancel"/>
		</form>
	</div>
</div>