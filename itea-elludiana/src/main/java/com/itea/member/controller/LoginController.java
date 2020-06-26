package com.itea.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< Updated upstream
import org.springframework.web.bind.annotation.RequestMapping;
=======
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
>>>>>>> Stashed changes

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginSV;
	
	//로그인 폼 보여주기
	@RequestMapping("member/loginFrm")
<<<<<<< Updated upstream
	public void loginFrm() {
=======
	public void loginFrm(Model model, HttpSession session) {
		
		System.out.println("로그인 폼");
		
		/* 네이버 아이디로 로그인 url */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		model.addAttribute("naver_url", naverAuthUrl);
		
		/* 카카오 아이디로 로그인 url */
		String kakaoUrl = kakaoLogin.getAuthorizationUrl(session);

	    /* 생성한 인증 URL을 View로 전달 */
	    model.addAttribute("kakao_url", kakaoUrl);
>>>>>>> Stashed changes
	}
	
	//로그인 로직 수행
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
<<<<<<< Updated upstream
=======
	
	/**
	  * 카카오 로그인 콜백
	  *
	  * @return String
	  * @throws Exception
	  */
	@RequestMapping(value = "/kakaoOauth.do")
	public String getKakaoSignIn(ModelMap model, @RequestParam("code") String code, HttpSession session) throws Exception {

	  JsonNode userInfo = kakaoLogin.getKakaoUserInfo(code);

	  System.out.println(userInfo);

	  String id = userInfo.get("id").toString();
	  String email = userInfo.get("kaccount_email").toString();
	  String image = userInfo.get("properties").get("profile_image").toString();
	  String nickname = userInfo.get("properties").get("nickname").toString();

	  System.out.println(id + email);


	  model.addAttribute("k_userInfo", userInfo);
	  model.addAttribute("id", id);
	  model.addAttribute("email", email);
	  model.addAttribute("nickname", nickname);
	  model.addAttribute("image", image);

	  return "main/main.tiles";
	}
>>>>>>> Stashed changes
}



