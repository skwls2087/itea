<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<style>
	.form-signin{
		max-width:300px;
		margin:40px auto;
		}
	.form-signin>*{margin:10px;}
	
</style>

<div class="container">

			<!-- 이메일로 로그인하기 -->
      <form class="form-signin" method="post" action="<%= request.getContextPath()%>/member/loginProc.co">
        <h2 class="form-signin-heading">Login</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="mmail" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="mpw" id="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">이메일 로그인</button>
        &nbsp &nbsp &nbsp <a href="#">아이디찾기</a>&nbsp &nbsp &nbsp &nbsp &nbsp  <a href="#">비밀번호찾기</a>
      </form>
      	<hr><br/>
      	
     	<!-- sns계정으로 로그인하기 -->
<<<<<<< Updated upstream
			<!-- 1.네이버 -->
			<%
			    String clientId = "68tNfP0GUh1VB4b0suSF";//애플리케이션 클라이언트 아이디값";
			    String redirectURI = URLEncoder.encode("http://localhost:9000/spring", "UTF-8");
			    SecureRandom random = new SecureRandom();
			    String state = new BigInteger(130, random).toString();
			    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			    apiURL += "&client_id=" + clientId;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&state=" + state;
			    session.setAttribute("state", state);
			 %>
			  <a href="<%=apiURL%>"><img height="50" src="${pageContext.request.contextPath}/resources/img/naverlogin.jpg"/></a>
			  
			<!-- 2. Kakao/Daum -->
			<a id="login-form-btn" href="javascript:loginFormWithKakao()">
  				<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
			</a>
			<script type="text/javascript">
  			// input your appkey
  				Kakao.init('cbcf1139dc760ede7c25db96a9eae901')
  				function loginFormWithKakao() {
    				Kakao.Auth.loginForm({
    					success: function(authObj) {
    						alert(JSON.stringify(authObj))},
    						fail: function(err) {
    							alert(JSON.stringify(err))},
					})
  				}
			</script>
			
			<!-- 3. Google -->
			
			
			<!-- 4. FaceBook -->  
=======

		  <!-- 1.네이버 -->
		  <a href="${naver_url}"><img height="50" src="${pageContext.request.contextPath}/resources/img/naverlogin.jpg"/></a>

		  <!-- 2.카카오 -->  
			 
		
		  <!-- 3.구글 -->
			 
			


>>>>>>> Stashed changes
