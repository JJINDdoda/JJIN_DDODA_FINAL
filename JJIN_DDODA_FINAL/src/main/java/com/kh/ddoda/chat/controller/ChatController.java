package com.kh.ddoda.chat.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ddoda.chat.domain.Chat;
import com.kh.ddoda.chat.service.ChatService;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.Mymate;
import com.kh.ddoda.member.domain.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@RequestMapping(value="adminChatOpen.doa", method=RequestMethod.GET)
	public String adminChatOpen(Model model) {
		return "admin/chat";
	}
	
	// 관리자 채팅요청 리스트 전체 조회
	@RequestMapping(value="adminChatList.doa", method=RequestMethod.GET)
	public ModelAndView chatList(ModelAndView mv, Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = cService.getChatListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Mate> cList = cService.adminChatList(pi);
		System.out.println(cList);
		if(!cList.isEmpty()) {
			mv.addObject("cList", cList).addObject("pi", pi).setViewName("admin/Admin_Chat_List");
		} else {
			mv.addObject("cList", cList).addObject("pi", pi).setViewName("admin/Admin_Chat_List");
		}
		return mv;
	}
	
	// 관리자 채팅요청 게시글 상세보기
	@RequestMapping(value="adminChatDetail.doa", method=RequestMethod.GET)
	public ModelAndView chatDetail(ModelAndView mv, int mateNo) {
		Mate mate = cService.adminSelectChat(mateNo);
		ArrayList<Mymate> mList = cService.adminSelectUser(mateNo);
		if(mate != null || !mList.isEmpty()) {
			mv.addObject("mate", mate).addObject("mList", mList).setViewName("admin/Admin_Chat_Detail");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패!").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 채팅방 오픈해주기
	@ResponseBody
	@RequestMapping(value="adminChatSuccess.doa", method=RequestMethod.GET)
	public String chatSuccess(Mymate myMate) {
		int result = cService.adminModifyChat(myMate);
		System.out.println(result);
		  if(result > 0) {
			  System.out.println("성공이다");
			  return "success";
		  } else {
			  System.out.println("error다");
			  return "fail";
		  }
	}
	
	// 채팅내용 저장
	@ResponseBody
	@RequestMapping(value="addChat.doa", method=RequestMethod.POST)
	public String addChat(Chat chat, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		chat.setUserId(userId);
		int result = cService.adminChatOpen(chat);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 사용자 채팅방 입장
	@RequestMapping(value="chatInsert.doa", method=RequestMethod.GET)
	public ModelAndView chatInsert(ModelAndView mv, int mateNo, String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mateNo", mateNo);
		map.put("userId", userId);
		Mymate myMate = cService.selectChatInsert(map);
		System.out.println(mateNo + ", " + userId);
		System.out.println(myMate);
		if(myMate != null) {
			mv.addObject("myMate", myMate).setViewName("admin/chat");
		} else {
			mv.addObject("msg", "채팅방 입장 실패!").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 채팅방 전체 리스트 조회
	@RequestMapping(value="chatList.doa", method=RequestMethod.GET)
	public void getChatList(HttpServletResponse response, int mateNo) throws Exception {
		ArrayList<Chat> cList = cService.selectChatList(mateNo);
		System.out.println(cList);
		for(Chat c : cList) {
			c.setMessageinput(URLEncoder.encode(c.getMessageinput(), "utf-8"));
		}
		Gson gson = new GsonBuilder().create();
		gson.toJson(cList, response.getWriter());
	}
}