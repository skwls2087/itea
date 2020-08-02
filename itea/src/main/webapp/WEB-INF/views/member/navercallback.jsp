<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


   <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
   <script>
      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "d2LqO26x_yJC_yXrKI3h",
            callbackUrl: "http://itealab.com/callback.co",
            isPopup: false,
            callbackHandle: true
         }
      );
      naverLogin.init();

      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {

            if (status) {
               var email = naverLogin.user.getEmail();
               if( email == undefined || email == null) {
                  alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                  naverLogin.reprompt();
                  return;
               }
               
               //이메일이 DB에 있는지 확인
          $.ajax({
       			url : 'joincheck.co?email='+ email,
       			type : 'post',
       			success : function(data) {		
       				
       				if(data==1){//이미 회원이면 -> 로그인처리
       					location.href="snslogin.co";
       					
       				}else{//회원이 아니라면 -> 회원가입 추가정보입력페이지로
       					$("#navermail").val(email);
       					$("#naverjoin").submit();
       				}
       				
       				}, error : function() {
       					alert("네이버 로그인에 실패하였습니다.");
       				}
       		})
               
               
            } else {
               alert("네이버 로그인에 실패하였습니다.")
            }
         });
      });
   </script>
   
   <form id="naverjoin" method="post" action="snsjoin.co">
   	<input type="hidden" id="navermail" name="email" value=""/>
   </form>
