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
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.notice.domain.Notice;
import com.kh.ddoda.notice.domain.SelectNotice;
import com.kh.ddoda.notice.service.NoticeService;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.require.domain.Require;

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
			mv.addObject("msg", "공지사항 전체조회 실패!").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공지사항 상세조회
	@RequestMapping(value="noticeRequireDetail.doa", method=RequestMethod.GET)
	public ModelAndView noticeRequireDetail(ModelAndView mv, Notice notice) {
		SelectNotice nList = nService.selectNotice(notice);
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
		return null;
	}
	
	// 공지사항 - 요청사항 등록
	@RequestMapping(value="noticeRequireInsert.doa", method=RequestMethod.POST)
	public String noticeRequireInsert(Require require, Model model, HttpServletRequest request, MultipartFile uploadFile) {
		
		return null;
	}
	
	// 공지사항 - 메이트모집 등록
	@RequestMapping(value="noticeMateInsert.doa", method=RequestMethod.POST)
	public String noticeMateInsert(Mate mate, Model model, HttpServletRequest request, MultipartFile uploadFile) {
		
		return null;
	}
	
	// 공지사항 - 식단공유 등록
	@RequestMapping(value="noticeDiaryInsert.doa", method=RequestMethod.POST)
	public String noticeDiaryInsert(Opendiary diary, Model model, HttpServletRequest request, MultipartFile uploadFile) {
		
		return null;
	}
	
	// 공지사항 - 요청사항 사진 저장
	public String rsaveFile(MultipartFile file, HttpServletRequest request) {
		
		return null;
	}
	
	// 공지사항 - 메이트모집 사진 저장
	public String msaveFile(MultipartFile file, HttpServletRequest request) {
		
		return null;
	}
	
	// 공지사항 - 식단공유 사진 저장
	public String dsaveFile(MultipartFile file, HttpServletRequest request) {
		
		return null;
	}
	
	// 공지사항 - 요청사항 게시글 수정화면 이동
	@RequestMapping(value="rUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView rUpdateView(ModelAndView mv, int requireNo) {
		
		return mv;
	}
	
	// 공지사항 - 메이트모집 게시글 수정화면 이동
	@RequestMapping(value="mUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView mUpdateView(ModelAndView mv, int mateNo) {
		
		return mv;
	}
	
	// 공지사항 - 식단공유 게시글 수정화면 이동
	@RequestMapping(value="dUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView dUpdateView(ModelAndView mv, int openDiaryNo) {
		
		return mv;
	}
	
	// 공지사항 - 요청사항 게시글 수정
	@RequestMapping(value="noticeUpdate.doa", method=RequestMethod.POST)
	public ModelAndView noticeUpdate(ModelAndView mv, Require require, HttpServletRequest request, MultipartFile uploadFile) {
		
		return mv;
	}
	
	// 공지사항 - 메이트모집 게시글 수정
	@RequestMapping(value="mateUpdate.doa", method=RequestMethod.POST)
	public ModelAndView mateUpdate(ModelAndView mv, Mate mate, HttpServletRequest request, MultipartFile uploadFile) {
		
		return mv;
	}
	
	// 공지사항 - 식단공유 게시글 수정
	@RequestMapping(value="diaryUpdate.doa", method=RequestMethod.POST)
	public ModelAndView diaryUpdate(ModelAndView mv, Opendiary diary, HttpServletRequest request, MultipartFile uploadFile) {
		
		return mv;
	}
	
	// 공지사항 - 오청사항 게시글 삭제
	@RequestMapping(value="noticeDelete.doa", method=RequestMethod.GET)
	public String noticeDelete(int requireNo, Model model, HttpServletRequest request) {
		
		return null;
	}
	
	// 공지사항 - 메이트모집 게시글 삭제
	@RequestMapping(value="mateDelete.doa", method=RequestMethod.GET)
	public String mateDelete(int mateNo, Model model, HttpServletRequest request) {
		
		return null;
	}
	
	// 공지사항 - 식단공유 게시글 삭제
	@RequestMapping(value="diaryDelete.doa", method=RequestMethod.GET)
	public String diaryDelete(int openDiaryNo, Model model, HttpServletRequest request) {
		
		return null;
	}
	
	// 공지사항 - 요청사항 파일삭제
	public void deleteRequireFile(String rfileName, HttpServletRequest request) {
		
	}
	
	// 공지사항 - 메이트모집 파일삭제
	public void deleteMateFile(String mfileName, HttpServletRequest request) {
		
	}
	
	// 공지사항 - 식단공유 파일삭제
	public void deleteDiaryFile(String dfileName, HttpServletRequest request) {
		
	}
}