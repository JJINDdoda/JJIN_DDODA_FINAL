package com.kh.ddoda.require.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.require.domain.Reply;
import com.kh.ddoda.require.domain.Require;
import com.kh.ddoda.require.service.RequireService;

@Controller
public class RequireController {
	
	@Autowired
	private RequireService rService;
	
	// 관리자 요구사항 전체목록 조회
	@RequestMapping(value="adminRequireList.doa", method=RequestMethod.GET)
	public ModelAndView adminRequireList(ModelAndView mv, Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = rService.getRequireListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Require> rList = rService.adminSelectList(pi);
		if(!rList.isEmpty()) {
			mv.addObject("rList", rList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/Admin_community_Require");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패!");
			mv.addObject("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 요구사항 상세목록 조회
	@RequestMapping(value={"adminRequireDetail.doa"}, method=RequestMethod.GET)
	public ModelAndView adminRequireDetail(int requireNo, ModelAndView mv, Integer page) {
		int currentPage = page != null ? page : 1;
		Require require = rService.adminSelectRequire(requireNo);
		Reply reply = rService.adminRequireReply(requireNo);
		if(require != null || reply != null) {
			mv.addObject("require", require).addObject("reply", reply).addObject("currentPage", currentPage).setViewName("admin/Admin_Require_Detail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 요구사항 답변 작성
	@RequestMapping(value="addReply.doa", method=RequestMethod.POST)
	public String addReply(Reply reply, Model model, int requireNo) {
		int result = rService.insertRequireReply(reply);
		String path = null;
		if(result > 0) {
			rService.adminRequireStatus(requireNo);
			path = "redirect:adminRequireList.doa";
		} else {
			model.addAttribute("msg", "답변 등록 실패!");
			path = "common/errorPage";
		}
		return path;
	}
	
	// 요구사항 수정 페이지 이동
	@RequestMapping(value="adminRequireUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView requireUpdate(ModelAndView mv, int requireNo, Integer page) {
		mv.addObject("require", rService.adminSelectRequire(requireNo)).addObject("reply", rService.adminRequireReply(requireNo)).addObject("currentPage", page).setViewName("admin/Admin_Require_UpdateView");
		return mv;
	}
	
	// 요구사항 수정
	@RequestMapping(value="adminRequireUpdate.doa", method=RequestMethod.POST)
	public ModelAndView requireUpdate(ModelAndView mv, Require require, Reply reply, Integer page) {
		int result = rService.adminModifyRequire(require);
		int result2 = rService.adminModifyRequireReply(reply);
		if(result > 0 || result2 > 0) {
			mv.addObject("page", page).setViewName("redirect:adminRequireList.doa");
		} else {
			mv.addObject("msg", "게시글 수정 실패!").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 요구사항 삭제(SQL에서 제약조건으로 요구사항 게시물 삭제시 답변 데이터도 같이 사라진다.)
	@RequestMapping(value="adminRequireDelete.doa", method=RequestMethod.GET)
	public String requireDelete(int requireNo, Model model) {
		int result = rService.adminDeleteRequire(requireNo);
		if(result > 0) {
			return "redirect:adminRequireList.doa";
		} else {
			model.addAttribute("msg", "게시글 삭제 실패!");
			return "common/errorPage";
		}
	}
}
