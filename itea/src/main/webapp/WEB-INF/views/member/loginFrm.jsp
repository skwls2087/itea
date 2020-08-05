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
		<div id="kakao_login" align="center">
			<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
			<a id="custom-login-btn" href="javascript:loginWithKakao()">
  				<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="280" />
			</a>
			<p id="token-result"></p>
		<script type="text/javascript">
			const kakao = {
				clientID: "cbcf1139dc760ede7c25db96a9eae901",
			    clientSecret: "vz7AS4l94wIkg6WxpJ9wWi8PxXeaHkfA",
				edirectUri: "http://localhost:8080/callback"
			};
		
		  // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
		  // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
		  Kakao.init('cbcf1139dc760ede7c25db96a9eae901')
		  
		  function loginWithKakao() {
		    Kakao.Auth.authorize({
		      // 초기화한 앱의 로그인 Redirect URI에 등록된 URI여야 합니다.
		      redirectUri: 'http://localhost:8080/kakao.co'
		    })
		  }
		  
		  Kakao.Auth.createLoginButton({
			    container: '#kakao-login-btn',
			    success: function(authObj) {
			      Kakao.API.request({
			        url: '/v2/user/me',
			        success: function(res) {
			          alert(JSON.stringify(res))
			        },
			        fail: function(error) {
			          alert(JSON.stringify(error)
			          )
			        },
			      })
			    },
			    fail: function(err) {
			      alert('failed to login: ' + JSON.stringify(err))
			    },
		 })
		 
		</script>

	 	</div>
	 	
	 	
	 	<br/>
	 	
		<!-- 3.구글 -->
		<div id="google_id_login" align="center" class="g-signin2" data-width="280" data-height="60" data-theme="dark" data-longtitle="true" data-onsuccess="onSignIn" >
			<meta name="google-signin-scope" content="profile email">
			<meta name="google-signin-client_id" content="166692119557-j0tladboe2r8thciga7a5tncopudo30u.apps.googleusercontent.com">
			<script src="https://apis.google.com/js/platform.js?" async defer></script>
			<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
			<script>
		      function onSignIn(googleUser) {
		        // Useful data for your client-side scripts:
		        var profile = googleUser.getBasicProfile();
		        console.log("ID: " + profile.getId()); 		// Don't send this directly to your server!
		        console.log('Image URL: ' + profile.getImageUrl());
		        console.log("Email: " + profile.getEmail());
				
		        // The ID token you need to pass to your backend:
		        var id_token = googleUser.getAuthResponse().id_token;
		        console.log("ID Token: " + id_token);
		      }
		      function onSignIn(googleUser) {
		    	  var id_token = googleUser.getAuthResponse().id_token;
		    	  var xhr = new XMLHttpRequest();
		    	  xhr.open('POST', 'http://localhost:8080/tokensignin');
		    	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		    	  xhr.onload = function() {
		    	    console.log('Signed in as: ' + xhr.responseText);
		    	  };
		    	  xhr.send('idtoken=' + id_token);
		      }
		   </script>  
		</div>
		
		<%-- <a href="<%= request.getContextPath()%>/member/snsjoin.co">로그인테스트</a> --%>
</div>
			
			 


