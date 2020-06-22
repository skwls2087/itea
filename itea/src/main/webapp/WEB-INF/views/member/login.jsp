<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.form-signin{
		max-width:300px;
		margin:40px auto;
		}
	.form-signin>*{margin:10px;}
	
</style>

<div class="container">

			<!-- 이메일로 로그인하기 -->
      <form class="form-signin" method="post" action="<%= request.getContextPath()%>/loginProc.co">
        <h2 class="form-signin-heading">Login</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="mail" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="pw" id="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">이메일 로그인</button>
      </form>
      	<br/><hr><br/>
      	
     	<!-- sns계정으로 로그인하기 -->
			<a href="${url}"><img style="width:300px;" src="${pageContext.request.contextPath}/resources/img/naverlogin.jpg"/></a>
			
      
