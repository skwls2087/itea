<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.form-signin{
		max-width:300px;
		margin:40px auto;
		}
	.form-signin>*{margin:10px;}
	#login-main{text-align:center}
	
</style>

<div class="container" id="login-main">

	  <!-- 이메일로 로그인하기 -->
      <form class="form-signin" method="post" action="<%= request.getContextPath()%>/member/loginProc.co">
        <h2 class="form-signin-heading">로그인</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="mmail" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="mpw" id="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">이메일 로그인</button>
        &nbsp &nbsp &nbsp <a href="<%= request.getContextPath()%>/member/find_id_form.co">아이디찾기</a>
        	&nbsp &nbsp &nbsp &nbsp &nbsp  <a href="<%= request.getContextPath()%>/member/find_pw_form.co">비밀번호찾기</a>
      </form>
      	<hr><br/>
      	
     	<!-- sns계정으로 로그인하기 -->

	    <!-- 1.네이버 -->
		<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
		<div id="naverIdLogin"></div>
		<script type="text/javascript">
		   var naverLogin = new naver.LoginWithNaverId(
		      {
		         clientId: "68tNfP0GUh1VB4b0suSF",
		         callbackUrl: "http://localhost:8080/spring/callback.co",
		         isPopup: false,
		         loginButton: {color: "green", type: 3, height: 60}
		      }
		   );
		   naverLogin.init();
		</script>

		<br/>
		
		
		<!-- 2.카카오 -->
		<form>
			<div id="kakao_id_login" style="text-align:center">
				<a href="<%= request.getContextPath()%>/member/snsloginFrm.co">
				<img width="280" src="https://usefulpa.s3.amazonaws.com/images/2014/kakao_account_login_btn_large_narrow_ov.png" /></a>
			</div>
		</form>
		<br/>
		
		
		<!-- 3.구글 -->
		<form>
			<script src="https://apis.google.com/js/platform.js" async defer></script>
			<meta name="google-signin-client_id" content="166692119557-0b567megrl9q30husoocc390db33q3tk.apps.googleusercontent.com">
			<div class="g-signin2" data-onsuccess="onSignIn"></div>
			<script type="text/javascript">
				function onSignIn(googleUser) {
					  var profile = googleUser.getBasicProfile();
					  console.log('ID: ' + profile.getId()); 		//백엔드로 보내지 마! 대신 ID 토큰을 사용하십시오.
					  console.log('Image URL: ' + profile.getImageUrl());
					  console.log('Email: ' + profile.getEmail());  //'Email' 범위가 없는 경우 이 값은 null입니다.
				}
			</script>	
		</form> 	

