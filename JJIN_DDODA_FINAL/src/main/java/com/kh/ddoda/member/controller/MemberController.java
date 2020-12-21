package com.kh.ddoda.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.member.domain.Member;
import com.kh.ddoda.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="login.doa", method=RequestMethod.POST)
	public ModelAndView memberLogin(String userId, String passWord, ModelAndView mv, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member member = new Member(userId, passWord);
		Member loginUser = service.memberLogin(member);
		
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("index");
			
		}else {
			mv.addObject("msg","로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}

	
	//로그아웃
	
	@RequestMapping(value="logout.doa", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "home";
		
		
	}
	
	//회원가입 페이지  뷰우
	@RequestMapping(value="enrollView.doa", method=RequestMethod.GET)
	public String enrollView() {
		
		return "Member/memberJoin";
		
	}
	
	//회원가입하기
	@RequestMapping(value="insertMember.doa", method=RequestMethod.POST)
	public String insertMember(@ModelAttribute Member member ,Model model ) {
		
		int result = service.insertMember(member);
		if(result>0) {
			return "redirect:home.doa";
		}else {
			model.addAttribute("msg","회원가입실패");
			return "common/errorPage";
			
		}
	}
	
	
	//회원정보 수정,탈퇴기능이 있는   마이페이지 뷰
	@RequestMapping(value="myInfo.doa", method=RequestMethod.GET)
	public String myInfoView(String userId, Model model) {
		model.addAttribute("member", service.selectOne(userId));
		
		return "Member/mypage";
		
	}
	
	//회원정보 수정하기
	@RequestMapping(value="updateMember.doa", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute Member member, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int result = service.updateMember(member);
		if(result > 0) {
			session.setAttribute("loginUser", member);
			return "redirect:home.doa";
		}else {
			model.addAttribute("msg","회원 정보 수정 실패");
			return "common/errorPage";
			
		}
	}
	
	
	//회워탈퇴 페이지 뷰
	
	/*
	 * @RequestMapping(value="deleteMember.doa",method=RequestMethod.GET) 
	 * public  String memberBreak() { 
	 * return "Member/memberbreak"; }
	 * 
	 */
	
	
	
	
	/*
	 * //회원가입 아이디 중복검사 (ajax)
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="dupId.doa", method=RequestMethod.GET) public String
	 * idDuplicateCheck(String userId) { boolean isUsable = service.idCheck(userId)
	 * == 0? true : false; return isUsable + ""; }
	 */
	
}
