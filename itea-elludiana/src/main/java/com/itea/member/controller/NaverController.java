package com.itea.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itea.member.dto.MemberDTO;
import com.itea.member.service.LoginService;
import com.itea.snslogin.NaverLoginBO;

@Controller
public class NaverController {
	
	private String apiResult = null;
	
	@Autowired
	NaverLoginBO naverLoginBO;
	
	@Autowired
	LoginService loginSV;
	
	//네이버 로그인 완료시 실행
	@GetMapping(value = "/callback")
	public String callback(HttpServletRequest request,Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		System.out.println("naver 로그인 성공 - callback");
		
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

		MemberDTO mdto=new MemberDTO();

		mdto.setMclass(1);
		mdto.setMmail(email);
			
		//해당 이메일이 회원 테이블에 있는지 검색
		MemberDTO member=loginSV.snsLogin(mdto);
		
		if(member!=null) { //회원이면 로그인 처리 완료
			
			session.setAttribute("MNO", member.getMno());
			session.setAttribute("MNICK", member.getMnick());
			
			return "../../index";
			
		}else { //회원이 아니면 회원가입페이지로 이동
			System.out.println("회원아냐");
			return "/member/joinFrmSNS";
		}
		
		//model.addAttribute("result", apiResult);
		
	}
}
