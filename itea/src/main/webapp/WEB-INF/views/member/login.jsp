<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container">
    <div class="row">
        <div class="col-sm-3">

            <div class="login-box well">
                <form accept-charset="UTF-8" role="form" method="post" action="<%= request.getContextPath()%>/loginProc.co">
                    <legend>로그인</legend>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" name="id" value='' placeholder="E-mail을 입력하세요" class="form-control" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" name="pw" value='' placeholder="비밀번호를 입력하세요" class="form-control" />
                    </div>
                    <button type="submit" id="login-submit" class="btn btn-default btn-block"/>로그인</button>
                    
                </form>
            </div>

        </div>
    </div>
</div>
