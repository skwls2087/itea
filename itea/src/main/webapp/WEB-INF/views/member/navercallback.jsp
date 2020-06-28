<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


   <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
   <script>
      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "68tNfP0GUh1VB4b0suSF",
            callbackUrl: "http://localhost:9000/spring/callback.co",
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
