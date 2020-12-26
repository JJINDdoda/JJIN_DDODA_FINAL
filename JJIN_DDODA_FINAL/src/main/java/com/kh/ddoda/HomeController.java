package com.kh.ddoda;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ddoda.member.controller.KakaoController;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.doa", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv, HttpSession session) {
		/*
		 * logger.info("Welcome home! The client locale is {}.", locale);
		 * 
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		
		Gson gson = new GsonBuilder().create();
		//builder setdateformat create 로 날짜형식까지 추가 해줬음
		//detailView function(data) <객체형태로 전달해준거임
		
		
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		mv.addObject("kakao_url", kakaoUrl);
		mv.setViewName("home");
		
		return mv;
	}
	
	// 카카오 로그인 & 회원정보(이메일) 가져오기
	   @RequestMapping(value = "KaKaoLogin.doa", produces = "application/json", method = { RequestMethod.GET,
	         RequestMethod.POST })
	   public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   System.out.println("kakao code :" + code);
	      ModelAndView mav = new ModelAndView();
	      // 결과값을 node에 담아줌
	      JsonNode node = KakaoController.getAccessToken(code);
	      // accessToken에 사용자의 로그인한 모든 정보가 들어있음
	      JsonNode accessToken = node.get("access_token");
	      // 사용자의 정보
	      JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);

	      String kemail = null;
	      String kname = null;
	      String kgender = null;
	      String kbirthday = null;
	      String kage = null;
	      String kimage = null;
	      
	      
	      

	      // 유저정보 카카오에서 가져오기 Get properties
	      JsonNode properties = userInfo.path("properties");
	      JsonNode kakao_account = userInfo.path("kakao_account");

	      kemail = kakao_account.path("email").asText();
	      kname = properties.path("nickname").asText();
	      kimage = properties.path("profile_image").asText();
	      kgender = kakao_account.path("gender").asText();
	      kbirthday = kakao_account.path("birthday").asText();
	      kage = kakao_account.path("age_range").asText();
	      System.out.println("이메일이다 "+kemail);
	      System.out.println(kname);

	      session.setAttribute("kemail", kemail);
	      session.setAttribute("kname", kname);
	      session.setAttribute("kimage", kimage);
	      session.setAttribute("kgender", kgender);
	      session.setAttribute("kbirthday", kbirthday);
	      session.setAttribute("kage", kage);
           
	      System.out.println(session);
	      mav.addObject("session",session).setViewName("home");
	     
	      return mav;
	      
	      
	   }// end kakaoLogin()
	
	
	
	
}
