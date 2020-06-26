package com.itea.snslogin;

//Google 로그인 연동 클라이언트 ID : 584214475923-h11r93ahrdof9blc3oseuljnjn8uhso6.apps.googleusercontent.com 
//Google API의 Client Id와 Secret Key를 담는 VO객체
public class GoogleLoginVO {

	public class AuthInfo {
		
		private String clientId;
		private String clientPassword;
		
		public AuthInfo(String clientId, String clientPassword)  {
			this.clientId 		= clientId;
			this.clientPassword = clientPassword;			
		}

		public String getClientId() {
			return clientId;
		}

		public String getClientPassword() {
			return clientPassword;
		}
		
	}
}
