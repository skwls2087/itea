package com.itea.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itea.member.dto.MemberDTO;
import com.itea.member.service.LoginService;
import com.itea.snslogin.NaverLoginBO;

@Controller
public class LoginController {
	
	private String apiResult = null;
	
	@Autowired
	NaverLoginBO naverLoginBO;
	
	@Autowired
	LoginService loginSV;
	
	//로그인 폼 보여주기
	@RequestMapping("member/loginFrm")
	public void loginFrm(Model model, HttpSession session) {
		
		System.out.println("로그인폼보여주기");
		
		System.out.println("네아로 시작");
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("naver_url", naverAuthUrl);
		
	}
	
	//이메일 로그인 로직 수행
	@RequestMapping("member/loginProc")
	public String loginProc(MemberDTO mdto, HttpSession session,
			HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//해당 이메일과 비밀번호가 존재하는지 검색
		MemberDTO member=loginSV.login(mdto);
		
		if(member==null) { //일치하는 회원 없음 -> 로그인폼으로 다시 이동
			return "member/loginFrm";
		}else{ //일치하는 회원 존재함 -> 회원정보를 가지고 메인화면으로 이동
			session.setAttribute("MNO", member.getMno());
			session.setAttribute("MNICK", member.getMnick());
		}
		
		return "../../index";
	}
	
	//로그아웃 로직 수행
	@RequestMapping("member/logoutProc")
	public String logoutProc(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 됨");
		return "../../index";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback")
	public String callback(HttpServletRequest request,Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		System.out.println("여기는 callback");
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		System.out.println("apiresult"+apiResult);
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		System.out.println("제이슨="+response_obj);
		
		//response의 nickname값 파싱
		String email = (String)response_obj.get("email");
		System.out.println("이메일="+email);
		
		//해당 이메일이 회원 테이블에 있는지 검색
		MemberDTO member=loginSV.naverLogin(email);
		
		if(member!=null) { //회원이면 로그인 처리 완료
			return "../../index";
			
		}else { //회원이 아니면 회원가입페이지로 이동
			
			request.setAttribute("mmail",email);
			return "/member/joinFrmSNS";
		}
		
		//model.addAttribute("result", apiResult);
		
	}
	
}



