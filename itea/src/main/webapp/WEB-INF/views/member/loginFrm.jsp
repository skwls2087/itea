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

		  <!-- 1.네이버 -->
		  <a href="${naver_url}"><img height="50" src="${pageContext.request.contextPath}/resources/img/naverlogin.jpg"/></a>

			 <!-- 2.카카오 -->  
			 
		
			 <!-- 3.구글 -->
			 
			
			 <!-- 4.페이스북 -->

