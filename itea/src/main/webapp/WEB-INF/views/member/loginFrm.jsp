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
		<a id="kakao-login-btn"></a>
		<a href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>
		Kakao.init('cbcf1139dc760ede7c25db96a9eae901'); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
		//카카오 로그인 버튼을 생성합니다. 
		Kakao.Auth.createLoginButton({ 
		    container: '#kakao-login-btn', 
		    success: function(authObj) { 
	           Kakao.API.request({
	              url: '/v1/user/me',
	              success: function(res) {
                     console.log(res.id);						  //콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)		 
                     console.log(res.kaccount_email);			  //콘솔 로그에 email 정보 출력 		 
                     console.log(authObj.access_token);			  //콘솔 로그에 토큰값 출력	          
		          var id = res.id;   							  //카카오톡 닉네임을 변수에 저장
		          var kakaoe_mail = res.kaccount_email;  		  //카카오톡 이메일을 변수에 저장함		         		       
		          window.location.replace("http://" + window.location.hostname 
		        		  + ( (location.port==""||location.port==undefined)?"":":" + location.port) 
		        		  + "/hansub_project/home?kakaonickname="+kakaonickname+"kakaotalk"+"&kakaoe_mail="+kakaoe_mail);		      
		          }
		      })
		    },
            fail: function(error) {
              alert(JSON.stringify(error));
            }
		});
		</script>
	 
	
		<!-- 3.구글 -->
		<div id="google_id_login" style="text-align:center" class="g-signin2" data-onsuccess="onSignIn">
			<script src="https://apis.google.com/js/platform.js" async defer></script>
			<meta name="google-signin-scope" content="profile email">
			<meta name="google-signin-client_id" content="166692119557-0b567megrl9q30husoocc390db33q3tk.apps.googleusercontent.com">
			<script type="text/javascript">
				function onSignIn(googleUser) {
				  var profile = googleUser.getBasicProfile();
				  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
				  console.log('Name: ' + profile.getName());
				  console.log('Image URL: ' + profile.getImageUrl());
				  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
				}
			</script>
			<a href="#" onclick="signOut();">Sign out</a>
			<script>
			  function signOut() {
			    var auth2 = gapi.auth2.getAuthInstance();
			    auth2.signOut().then(function () {
			      console.log('User signed out.');
			    });
			  }
			</script>
		</div>	 
		 
</div>
			
			 

