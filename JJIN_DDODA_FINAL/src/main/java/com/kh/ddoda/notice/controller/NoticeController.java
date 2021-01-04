package com.kh.ddoda.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.notice.domain.Notice;
import com.kh.ddoda.notice.domain.SelectNotice;
import com.kh.ddoda.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	// 공지사항 - 요청사항 전체조회
	@RequestMapping(value="noticeRequireList.doa", method=RequestMethod.GET)
	public ModelAndView noticeRequireList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = nService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Notice> nList = nService.selectNoticeList(pi);
		if(!nList.isEmpty()) {
			mv.addObject("nList", nList).addObject("pi", pi).setViewName("admin/Admin_community_Notice");
		} else {
			/* mv.addObject("msg", "공지사항 전체조회 실패!").setViewName("common/errorPage"); */
			mv.addObject("nList", nList).addObject("pi", pi).setViewName("admin/Admin_community_Notice");
		}
		return mv;
	}
	
	// 공지사항 상세조회
	@RequestMapping(value="noticeRequireDetail.doa", method=RequestMethod.GET)
	public ModelAndView noticeRequireDetail(ModelAndView mv, Notice notice) {
		SelectNotice nList = nService.selectNotice(notice);
		System.out.println(nList);
		if(nList != null) {
			mv.addObject("nList", nList).setViewName("admin/Admin_Notice_Detail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공지사항 작성 페이지 이동
	@RequestMapping(value="nWriteView.doa", method=RequestMethod.GET)
	public String noticeWriteView() {
		return "admin/Admin_Notice_Write";
	}
	
	// 공지사항 등록
	@RequestMapping(value="noticeRequireInsert.doa", method=RequestMethod.POST)
	public String noticeRequireInsert(SelectNotice selectNotice, Model model, HttpServletRequest request) {
		int result = nService.registerNotice(selectNotice);
		System.out.println("result : " + result);
		String path = null;
		if(result > 0) {
			path = "redirect:noticeRequireList.doa";
		} else {
			model.addAttribute("msg", "공지사항 등록 실패!");
			path = "common/errorPage";
		}
		return path;
	}
	
	// 공지사항 - 요청사항 게시글 수정화면 이동
	@RequestMapping(value="noticeUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView noticeUpdateView(ModelAndView mv, Notice notice) {
		mv.addObject("notice", nService.selectNotice(notice)).setViewName("admin/Admin_Notice_UpdateView");
		return mv;
	}
	
	// 공지사항 게시글 수정
	@RequestMapping(value="noticeUpdate.doa", method=RequestMethod.POST)
	public String noticeUpdate(Model model, SelectNotice selectNotice, Notice notice) {
		int result = nService.modifyNotice(selectNotice);
		if(result > 0) {
			return "redirect:noticeRequireList.doa";
		} else {
			model.addAttribute("msg", "공지사항 수정 실패!");
			return "common/errorPage";
		}
	}
	
	// 공지사항 게시글 삭제
	@RequestMapping(value="noticeDelete.doa", method=RequestMethod.GET)
	public String noticeDelete(Notice notice, Model model, HttpServletRequest request) {
		int result = nService.deleteNotice(notice);
		if(result > 0) {
			return "redirect:noticeRequireList.doa";
		} else {
			model.addAttribute("msg", "공지사항 삭제 실패!");
			return "common/errorPage";
		}
	}
}