package com.kh.ddoda.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.chat.service.ChatService;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.Mymate;

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
		if(!cList.isEmpty()) {
			mv.addObject("cList", cList).addObject("pi", pi).setViewName("admin/Admin_Chat_List");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패!").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 채팅요청 게시글 상세보기
	@RequestMapping(value="adminChatDetail.doa", method=RequestMethod.GET)
	public ModelAndView chatDetail(ModelAndView mv, int mateNo) {
		Mate mate = cService.adminSelectChat(mateNo);
		ArrayList<Mymate> mList = cService.adminSelectUser(mateNo);
		if(mate != null && !mList.isEmpty()) {
			mv.addObject("mate", mate).addObject("mList", mList).setViewName("admin/Admin_Chat_Detail");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패!").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="adminChatSuccess.doa", method=RequestMethod.POST)
	public ModelAndView chatSuccess(ModelAndView mv, Mymate myMate) {
		int result = cService.adminModifyChat(myMate);
		  if(result > 0) {
			  mv.setViewName("redirect:adminChatList.doa");
		  } else { 
			  mv.addObject("msg", "게시글 전체조회 실패!").setViewName("common/errorPage");
		  }
		return mv;
	}
}