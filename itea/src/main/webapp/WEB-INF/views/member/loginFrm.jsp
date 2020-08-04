<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name = "viewport" content = "user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
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
		
		<!-- 네아로 버튼 -->
		<div id="naverIdLogin"></div>
		
		<!-- 네아로 설정 스크립트 -->
		<script type="text/javascript">
		   var naverLogin = new naver.LoginWithNaverId(
		      {
		         clientId: "d2LqO26x_yJC_yXrKI3h",
		         callbackUrl: "http://itealab.com/callback.co",
		         isPopup: false,
		         loginButton: {color: "green", type: 3, height: 60}
		      }
		   );
		   naverLogin.init();
		</script>

		<br/>
		<!-- 2.카카오 -->
		<!-- 카카오톡 아이디 연동해서 로그인 -->

		<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
 		<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="280" /></a>
		<p id="token-result"></p>
		<script type='text/javascript'>
		Kakao.init('cbcf1139dc760ede7c25db96a9eae901'); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
		//카카오 로그인 버튼을 생성합니다. 
		function loginWithKakao() {
		  Kakao.Auth.authorize({
		    // 초기화한 앱의 로그인 Redirect URI에 등록된 URI여야 합니다.
		    redirectUri: 'https://itealab.com/kakao.co'
		  })
		}
		getToken()
	    function getToken() {
		  const token = getCookie('authorize-access-token')
		  if(token) {
		    Kakao.Auth.setAccessToken(token)
		    document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
		  }
		}
		function getCookie(name) {
		  const value = "; " + document.cookie;
		  const parts = value.split("; " + name + "=");
		  if (parts.length === 2) return parts.pop().split(";").shift();
	 	}
		</script>
	 
	
		<!-- 3.구글 -->
		<div id="google_id_login" style="text-align:center" class="g-signin2" data-onsuccess="onSignIn">
			<meta name="google-signin-scope" content="profile email">
			<meta name="google-signin-client_id" content="166692119557-0b567megrl9q30husoocc390db33q3tk.apps.googleusercontent.com">
			<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
			<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
			<div class="g-signin2" data-width="300" data-height="200" data-longtitle="true">
			<script>
			  var googleUser = {};
			  var startApp = function() {
			    gapi.load('auth2', function(){
			      //Retrieve the singleton for the GoogleAuth library and set up the client.
			      auth2 = gapi.auth2.init({
			        client_id: '166692119557-0b567megrl9q30husoocc390db33q3tk.apps.googleusercontent.com',
			        cookiepolicy: 'single_host_origin',
			        //Request scopes in addition to 'profile' and 'email'
			        //scope: 'additional_scope'
			      });
			      attachSignin(document.getElementById('customBtn'));
			    });
			  };
			
			  function attachSignin(element) {
			    console.log(element.id);
			    auth2.attachClickHandler(element, {},
			        function(googleUser) {
			          document.getElementById('name').innerText = "Signed in: " +
			              googleUser.getBasicProfile().getName();
			        }, function(error) {
			          alert(JSON.stringify(error, undefined, 2));
			        });
			  }
			  </script>
			  <style type="text/css">
			    #customBtn {
			      display: inline-block;
			      background: white;
			      color: #444;
			      width: 190px;
			      border-radius: 5px;
			      border: thin solid #888;
			      box-shadow: 1px 1px 1px grey;
			      white-space: nowrap;
			    }
			    #customBtn:hover {
			      cursor: pointer;
			    }
			    span.label {
			      font-family: serif;
			      font-weight: normal;
			    }
			    span.icon {
			      background: url('/identity/sign-in/g-normal.png') transparent 5px 50% no-repeat;
			      display: inline-block;
			      vertical-align: middle;
			      width: 42px;
			      height: 42px;
			    }
			    span.buttonText {
			      display: inline-block;
			      vertical-align: middle;
			      padding-left: 42px;
			      padding-right: 42px;
			      font-size: 14px;
			      font-weight: bold;
			      /* Use the Roboto font that is loaded in the <head> */
			      font-family: 'Roboto', sans-serif;
			    }
			  </style>
			  <div id="gSignInWrapper">
			    <span class="label">Sign in with:</span>
			    <div id="customBtn" class="customGPlusSignIn">
			      <span class="icon"></span>
			      <span class="buttonText">Google</span>
			    </div>
			  </div>
			  <div id="name"></div>
			  <script>startApp();</script>
		</div>	 
		 
</div>
			
			 

