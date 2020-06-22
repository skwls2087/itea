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

      <form class="form-signin" method="post" action="<%= request.getContextPath()%>/loginProc.co">
        <h2 class="form-signin-heading">Login</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">이메일 로그인</button>
      	<br/><hr><br/>
				<a href="${url}"><img style="width:300px;" src="${pageContext.request.contextPath}/resources/img/naverlogin.jpg"/></a>
				<br>
      </form>
