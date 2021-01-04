package com.kh.ddoda.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.member.domain.Member;
import com.kh.ddoda.member.service.MemberService;


//유진 허락 존 
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "login.doa", method = RequestMethod.POST)
	public ModelAndView memberLogin(String userId, String passWord, ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		// Member member = new Member(userId, passWord);

		// 도메인에 에러날시 이렇게 대체
		// Member member = new Member(userId, passWord);랑 밑에 세줄이랑 같음
		Member member = new Member();
		member.setUserId(userId);
		member.setPassWord(passWord);

		Member loginUser = service.memberLogin(member);

		if (loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("../../index");

		} else {		
			 response.setCharacterEncoding("UTF-8");
			 
			 response.setContentType("text/html; charset=UTF-8");
//			 
//			 //response.setCharacterEncoding("UTF-8");// 롸 이거 아니였누
//			 
			 PrintWriter out=response.getWriter();
			 
			 out.println("<script>alert('아이디나,비밀번호가 맞지 않습니다.');location.href='LoginView.doa';</script>");
			 
			  
			 out.flush();
		 
		     out.close();
			 
			mv.addObject("msg", "로그인 실패");
			mv.setViewName("../../index");
		}
		return mv;

	}
	//로그인 뷰
	@RequestMapping(value="LoginView.doa",method = RequestMethod.GET)
	public String LoginView() {
		
		return "Member/login";
	}
	
	

	// 로그아웃

	@RequestMapping(value = "logout.doa", method = RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "../../index";

	}

	// 회원가입 페이지 뷰우
	@RequestMapping(value = "enrollView.doa", method = RequestMethod.GET)
	public String enrollView() {

		return "Member/memberJoin";

	}

	// 회원가입하기 <생년월일> 허락 존
	@RequestMapping(value = "insertMember.doa", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute Member member, Model model, HttpServletRequest request) {
		String passWord = request.getParameter("userPassword");// 괄호안에는 jsp에서 쓴 name값
		// 이메일(request로 가져오기)
		String emailId = request.getParameter("emailId");// hihi
		String emailTag = request.getParameter("emailTag");// @naver.com->선택한 값이 넘어와
		String email = emailId + emailTag;
		// 전화번호(requedst로 가자ㅕ오기)
		String firstPhone = request.getParameter("firstPhone");// 010
		String secondPhone = request.getParameter("secondPhone");// 3333
		String lastPhone = request.getParameter("lastPhone");// 4444
		String phone = firstPhone + secondPhone + lastPhone;
		member.setPassWord(passWord);
		member.setEmail(email);
		member.setPhone(phone);
		String userBirth = request.getParameter("userBirth");
		member.setUserBirth(userBirth);
		System.out.println(member.toString());
		int result = service.insertMember(member);
		if (result > 0) {
			
			return "../../index";
		} else {
			
			model.addAttribute("msg", "회원가입실패");
			return "common/errorPage";

		}
	}

	// 회원정보 수정,탈퇴기능이 있는 마이인포 뷰
	@RequestMapping(value = "myInfo.doa", method = RequestMethod.GET)
	public String myInfoView(String userId, Model model) {
		model.addAttribute("member", service.selectOne(userId));

		return "Member/myInfo";
	}

	// 회원정보 수정하기
	@RequestMapping(value = "updateMember.doa", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute Member member, Model model, HttpServletRequest request) {

		String passWord = request.getParameter("userPassword");// 괄호안에는 jsp에서 쓴 name값
		// 이메일(request로 가져오기)
		String emailId = request.getParameter("emailId");// hihi
		String emailTag = request.getParameter("emailTag");// @naver.com->선택한 값이 넘어와
		String email = emailId + emailTag;
		// 전화번호(requedst로 가자ㅕ오기)
		String firstPhone = request.getParameter("firstPhone");// 010
		String secondPhone = request.getParameter("secondPhone");// 3333
		String lastPhone = request.getParameter("lastPhone");// 4444
		String phone = firstPhone + secondPhone + lastPhone;
		member.setPassWord(passWord);
		member.setEmail(email);
		member.setPhone(phone);
		System.out.println(member.toString());

		HttpSession session = request.getSession();
		int result = service.updateMember(member);
		if (result > 0) {
			session.setAttribute("loginUser", member);
			return "../../index";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패");
			return "common/errorPage";

		}
	}

	// 회워탈퇴 페이지 뷰 12-11 하는중

	   @RequestMapping(value = "deleteMember.doa", method = RequestMethod.GET)
	   public String memberBreak() {

	      return "Member/memberbreak";

	   }

	   // 회원탈퇴 하는중 12 -11
	   @RequestMapping(value = "memberDelete.doa", method = RequestMethod.GET)
	   public String memberDelete(String userId, HttpServletRequest request, Model model) {
	      HttpSession session = request.getSession();
	      int result = service.deleteMember(userId);
	      if (result > 0) {
	         session.invalidate();
	         return "../../index";
	      } else {
	         model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
	         return "common/errorPage";
	      }

	   }
	   
	// 관리자 회원 전체조회
       @RequestMapping(value="adminMemberList.doa", method=RequestMethod.GET)
       public ModelAndView memberList(ModelAndView mv, Integer page) {
          int currentPage = (page != null) ? page : 1;
          int listCount = service.getMemberListCount();
          PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
          ArrayList<Member> mList = service.adminSelectMemberList(pi);
          System.out.println(mList);
          if(!mList.isEmpty()) {
             mv.addObject("mList", mList).addObject("pi", pi).setViewName("admin/Admin_Member_List");
          } else {
        	  mv.addObject("mList", mList).addObject("pi", pi).setViewName("admin/Admin_Member_List");
          }
          return mv;
       }

		// 관리자 회원 상세조회
		@RequestMapping(value="adminMemberDetail.doa", method=RequestMethod.GET)
		public ModelAndView adminMemberDetail(ModelAndView mv, Integer page, String userId) {
		   int currentPage = page != null ? page : 1;
		   Member member = service.adminSelectMember(userId);
		   if(member != null) {
		      mv.addObject("member", member).addObject("currentPage", currentPage).setViewName("admin/Admin_Member_Detail");
		   } else {
		      mv.addObject("msg", "게시글 상세조회 실패!");
		      mv.setViewName("common/errorPage");
		   }
		   return mv;
		}
		
		// 관리자 회원 탈퇴
		@RequestMapping(value="adminMemberDelete.doa", method=RequestMethod.GET)
		public String adminMemberDelete(String userId, Model model) {
		   int result = service.adminDeleteMember(userId);
		   if(result > 0) {
		      return "redirect:adminMemberList.doa";
		   } else {
		      model.addAttribute("msg", "회원 탈퇴시키기 실패!");
		      return "common/errorPage";
		   }
		}

	// 회원가입 아이디 중복검사 (ajax) ---------------------------깃 1215
	// -----------------------------

	@ResponseBody
	@RequestMapping(value = "dupId.doa", method = RequestMethod.GET)
	public String idCheck(String userId) {
		boolean isUsable = service.idCheck(userId) == 0 ? true : false;
		return isUsable + "";
	}

	/// 핸드폰중복검사
	@ResponseBody
	@RequestMapping(value = "dupPhone.doa", method = RequestMethod.GET)
	public int MemberPhoneCheck(String phone) {
		System.out.println(phone);
//	  		 boolean result = service.phoneCheck(phone) == 0? true : false; 
		int result = service.phoneCheck(phone);

		return result;
	}

	// 핸드폰 중복검사 뷰 페이지
	@RequestMapping(value = "memberPhoneCheckView.doa", method = RequestMethod.GET)
	public String memberPhoneCheckView() {
		return "Member/memberPhoneCheckForm";
	}

	// 이메일 중복검사 뷰 페이지
	@RequestMapping(value = "memberEmailCheckView.doa", method = RequestMethod.GET)
	public String memberEmailChcekView() {

		return "Member/memberEmailCheck";

	}

	// 이메일 중복검사
	@ResponseBody
	@RequestMapping(value = "dupEmail.doa", method = RequestMethod.GET)
	public int MemberEamilCheck(String emailId, String emailTag) {
		String email = emailId + emailTag;
		System.out.println(email);

		int result = service.emailCheck(email);

		System.out.println(result);
		return result;
	}

	// 마이페이지 뷰
	@RequestMapping(value = "myPage.doa", method = RequestMethod.GET)
	public String memberMypageView(HttpServletRequest request, Model model) {

		return "Member/myPage";

	}

	// 비밀번호찾기
	// mailSending 코드 이거도 유진 허락 존
	@RequestMapping(value = "mailSending.doa")
	public String mailSending(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Member member = new Member();
		String userId = request.getParameter("userId");// request이용해서 (request.getparameter())
		String emailId = request.getParameter("emailId");
		String emailTag = request.getParameter("emailTag");
		String email = emailId + emailTag;
		member.setUserId(userId);
		member.setEmail(email);
		/* System.out.println(member.getUserId() + ", " + member.getEmail()); */
		// ㅇ아이디나 이메일 입력받으면 그 사람 그걸로 쿼리돌려서 비밀번호를 찾아
		// 그러면 그 데이터를 가지고 저기 컨트롤러에 넣어 그럼 끝끝 ㅇㅋ
		Member memberd = service.FindPw(member);
		/*
		 * System.out.println(memberd); System.out.println("이메일이다" +
		 * memberd.getEmail());
		 */
		// 이렇게 위에처럼 하면 쿼리를 돌고 값을 가져옴
		// 가져온 값중에 이메일도 있고 패스워드도 있고 아이디도 있고 있으면
		// 아래 이메일이라고 적혀있는ㄴ부분에 가져온 이메일 넣고
		// 패스워드 는 부분에 가져온 패스워드 넣으면
		// 그이메일에 패스워드를 보내줌

		/* System.out.println(memberd.getEmail() + "," + memberd.getUserId()); */

		if (memberd != null) {
			String tomail = memberd.getEmail(); // 받는 사람 이메일
			// System.out.println(tomail);
			String title = "DDO:DA비밀번호 찾기"; // 제목
			String content = "회원님의 비밀번호는" + memberd.getPassWord() + "입니다"; // 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom("oyes1203@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용
				// System.out.println(messageHelper);
				mailSender.send(message);

				
				
				 response.setCharacterEncoding("UTF-8");
				 
				 response.setContentType("text/html; charset=UTF-8");
//				 
//				 //response.setCharacterEncoding("UTF-8");// 롸 이거 아니였누
//				 
				 PrintWriter out=response.getWriter();
				 
				 out.println("<script>alert('이메일 전송완료! 이메일을 확인해주세요');location.href='index.jsp';</script>");
				 
				  
				 out.flush();
			 
			     out.close();
				 
				/*
				 * model.addAttribute("msg","이메일 전송이 되었습니다. 이메일을 확인해주세요");
				 * model.addAttribute("url","login.jsp");
				 */

			} catch (Exception e) {
				System.out.println(e);
			}
		} 
		else {
 response.setCharacterEncoding("UTF-8");
			 
			 response.setContentType("text/html; charset=UTF-8");
//			 
//			 //response.setCharacterEncoding("UTF-8");// 롸 이거 아니였누
//			 
			 PrintWriter out=response.getWriter();
			 
			 out.println("<script>alert('잘못된 입력입니다.다시확인해주세요.');location.href='findPwdView.doa';</script>");
			 
			  
			 out.flush();
		 
		     out.close();
			
		}
		return "redirect:home.doa";
	}

	// 비밀번호 찾기 뷰
	// 유진 허락 존

	@RequestMapping(value = "findPwdView.doa", method = RequestMethod.GET)
	public String findPwdView() {

		return "Member/PwdFind";

	}

	// 유진 허락 존
	// 약간 동의 리를빗 어그릐 뷰

	@RequestMapping(value = "AgreeView.doa", method = RequestMethod.GET)
	public String littleAgreeView() {

		return "Member/agree";
	}

	// 유진 허락 존
	// 아이디찾기 뷰
	@RequestMapping(value = "findIdView.doa", method = RequestMethod.GET)
	public String findIdView() {

		return "Member/idFind";

	}

	// 유진 허락 존
	// 아이디 찾기
	// mailSending 코드 이거도 유진 허락 존
	
	@RequestMapping(value = "IdmailSending.doa")
	public String IdMailSending(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		Member member = new Member();
		String userName = request.getParameter("userName");// request이용해서 (request.getparameter())
		String emailId = request.getParameter("emailId");
		String emailTag = request.getParameter("emailTag");
		String email = emailId + emailTag;
		member.setUserName(userName);
		member.setEmail(email);
		//System.out.println(member.getUserName() + ", " + member.getEmail());
		// ㅇ아이디나 이메일 입력받으면 그 사람 그걸로 쿼리돌려서 비밀번호를 찾아
		// 그러면 그 데이터를 가지고 저기 컨트롤러에 넣어 그럼 끝끝 ㅇㅋ
		Member memberd = service.FindId(member);
		
		//System.out.println(memberd);
		//System.out.println("이메일이다" + memberd.getEmail());
		// 이렇게 위에처럼 하면 쿼리를 돌고 값을 가져옴
		// 가져온 값중에 이메일도 있고 패스워드도 있고 아이디도 있고 있으면
		// 아래 이메일이라고 적혀있는ㄴ부분에 가져온 이메일 넣고
		// 패스워드 는 부분에 가져온 패스워드 넣으면
		// 그이메일에 패스워드를 보내줌

		//System.out.println(memberd.getEmail() + "," + memberd.getUserName());
		
		/*
		 * if(memberd != null) { String tomail = memberd.getEmail(); // 받는 사람 이메일
		 * //System.out.println(tomail); String title = "DDO:DA아이디 찾기"; // 제목 String
		 * content = "회원님의 아이디는"+memberd.getUserId()+ "입니다"; // 내용
		 * 
		 * try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		 * messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		 * 
		 * messageHelper.setFrom("oyes1203@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
		 * messageHelper.setTo(tomail); // 받는사람 이메일 messageHelper.setSubject(title); //
		 * 메일제목은 생략이 가능하다 messageHelper.setText(content); // 메일 내용 //
		 * System.out.println(messageHelper); mailSender.send(message);
		 * 
		 * 
		 * } catch (Exception e) { System.out.println(e); } }
		 */
		
//		if(memberd != null) {
//			model.addAttribute("memberd", memberd);
//		} else {
//
//		}
//
//		
//		return "Member/id";
		if(memberd != null) {
			model.addAttribute("memberd", memberd);
				
		}else {
			 response.setCharacterEncoding("UTF-8");
			 
			 response.setContentType("text/html; charset=UTF-8");
//			 
//			 //response.setCharacterEncoding("UTF-8");// 롸 이거 아니였누
//			 
			 PrintWriter out=response.getWriter();
			 
			 out.println("<script>alert('잘못된 입력입니다.다시확인해주세요.');location.href='findIdView.doa';</script>");
			 
			  
			 out.flush();
		 
		     out.close();
		}
		return "Member/id";
	}
	
	//카카오오오
	@RequestMapping(value = "/memberloginform.do", method = RequestMethod.GET)
	public ModelAndView memberLoginForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String kakaoUrl = KakaoController.getAuthorizationUrl(session); 
		
		// 카카오 로그인
		mav.addObject("kakao_url", kakaoUrl); 
		return mav;
	
	}
}

	
	


