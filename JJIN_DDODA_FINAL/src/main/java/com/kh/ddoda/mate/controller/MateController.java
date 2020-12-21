package com.kh.ddoda.mate.controller;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.MateComment;
import com.kh.ddoda.mate.domain.Mymate;
import com.kh.ddoda.mate.service.MateService;
import com.kh.ddoda.member.domain.Member;

@Controller
public class MateController {

	@Autowired
	private MateService mService;
	
	@RequestMapping(value="mateWriteView.doa", method=RequestMethod.GET)
	public String mateWriteView() {
		return "mate/mateInsertForm";
	}
	
	//모이트 모집 게시판
	@RequestMapping(value="mateList.doa", method=RequestMethod.GET)
	public ModelAndView mateList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = mService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Mate> mateList = mService.mateList(pi);
		System.out.println(mateList);
		if(!mateList.isEmpty()) {
//			System.out.println(currentPage+", "+listCount);
			mv.addObject("mateList", mateList);
			mv.addObject("pi", pi);
			mv.setViewName("mate/mateList");
		} else {
			mv.addObject("mateList", mateList);
			mv.addObject("pi", pi);
			mv.setViewName("mate/mateList");
		}
		return mv;
	}
	
	
	//메이트모집 글 등록
	@RequestMapping(value="mateInsert.doa", method=RequestMethod.POST)
	public String insertMate(Mate mate, HttpServletRequest request, Model model,
				@RequestParam(value="mateTitle") String mateTitle,
				@RequestParam(value="userId") String userId,
				@RequestParam(value="matePlace") String matePlace,
				@RequestParam(value="detailAddr", required=false) String detailAddr,
				@RequestParam(value="roadAddr", required=false) String roadAddr,
				@RequestParam(value="latLong", required=false) String latLong,
				@RequestParam(value="mateRequireNo", required=false) String mateRequireNo,
				@RequestParam(value="mateContents") String mateContents,
				@RequestParam(value="sido") String sido) {
		int result = 0;
		String path = null;
		result = mService.insertMate(mate);
		if(result>0) {
			path = "redirect:mateList.doa";
		} else {
			model.addAttribute("msg", "공지사항 등록 실패!");
			path = "common/errorPage";
		}
		return path;
	}
	
	//메이트 상세조회
	@RequestMapping(value="mateDetail.doa", method=RequestMethod.GET)
	public ModelAndView mateDetail(ModelAndView mv, int mateNo, Integer page) {
		int currentPage = page != null? page : 1;
		mService.addViewCount(mateNo);
		Mate mate = mService.selectOneMate(mateNo);
		if(mate != null) {
			mv.addObject("mateOne", mate)
				.addObject("currentPage", currentPage)
					.setViewName("mate/mateDetail");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//메이트 댓글 등록
	@ResponseBody
	@RequestMapping(value="addMateComments.doa", method=RequestMethod.POST)
	public String addMateComments (MateComment mateCom, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		mateCom.setUserId(userId);
		System.out.println(userId);
		int result = mService.insertMateCom(mateCom);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//메이트 댓글 리스트
	@RequestMapping(value="mateComList.doa", method=RequestMethod.GET)
	public void mateComList(HttpServletResponse response, int mateNo) throws Exception {
		ArrayList<MateComment> mateComList = mService.selectMateCom(mateNo);
		for(MateComment mateCom : mateComList) {
			mateCom.setMateComContents(URLEncoder.encode(mateCom.getMateComContents(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mateComList, response.getWriter());
		System.out.println(mateComList);
	}
	
	//메이틑 대댓글 등록
	@ResponseBody
	@RequestMapping(value="addMateComReply.doa", method=RequestMethod.POST)
	public String addMateComReply ( MateComment mateCom, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		mateCom.setUserId(userId);
		int result = mService.insertMateComReply(mateCom);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
//	//메이트 대댓글 리스트
		@RequestMapping(value="mateComReplyList.doa", method=RequestMethod.GET)
		public void mateComReply(HttpServletResponse response, @RequestParam("mateNo") int mateNo, 
							@RequestParam("mateComRefNo") int mateComRefNo) throws Exception {
			ArrayList<MateComment> mateComReplyList = mService.selectMateComReply(mateComRefNo);
			for(MateComment mateCom : mateComReplyList) {
				mateCom.setMateComContents(URLEncoder.encode(mateCom.getMateComContents(), "utf-8"));
			}
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(mateComReplyList, response.getWriter());
			System.out.println(mateComReplyList);
		}
	
	//참여
	@ResponseBody
	@RequestMapping(value="addMymate.doa", method=RequestMethod.POST)
	public String addMymate(Mymate mymate, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		mymate.setUserId(userId);
		int result = mService.insertMymate(mymate);
		if(result >0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//참여 리스트
	@RequestMapping(value="myMateList.doa", method=RequestMethod.GET)
	public void myMateList(HttpServletResponse response, int mateNo) throws Exception {
		ArrayList<Mymate> mymateList = mService.selectMymate(mateNo);
		for (Mymate mym : mymateList) {
			mym.setUserId(URLEncoder.encode(mym.getUserId(), "utf-8"));
		}
		System.out.println(mymateList);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mymateList, response.getWriter());
	}
	//메이트 모집글 수정 화면
	@RequestMapping(value="mateUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView mateUpdateView (@RequestParam("mateNo") int mateNo, 
										@RequestParam("page") Integer page, ModelAndView mv) {
		mv.addObject("mate",  mService.selectOneMate(mateNo))
			.addObject("currentPage", page)
			.setViewName("mate/mateUpdate");
		return mv;
	}
	
	//메이트 모집글 수정
	@RequestMapping(value="mateUpdate.doa", method = RequestMethod.POST)
	public ModelAndView mateUpdate(ModelAndView mv, @ModelAttribute Mate mate,
									HttpServletRequest request, @RequestParam("page") Integer page) {
		int result = mService.updateMate(mate);
//		HttpSession session = request.getSession();
//		Member sessionUser = (Member)session.getAttribute("loginUser");
		System.out.println(result);
		if(result > 0) {
			mv.addObject("page", page)
				.setViewName("redirect:mateDetail.doa?mateNo="+mate.getMateNo());
		} else {
			mv.addObject("msg", "수정 실패")
				.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//메이트 모집글 삭제
	@RequestMapping(value="mateDelete.doa", method=RequestMethod.GET)
	public String mateDelete(int mateNo,  HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		//메이트 리스트 삭제
		ArrayList<Mymate> mymateList = mService.selectMymate(mateNo);
		if( !mymateList.isEmpty()) {
			mService.deleteAllmyMate(mateNo);
		}
		//댓글 리스트 삭제
		ArrayList<MateComment> mateCommentList = mService.selectMateCom(mateNo);
		if(!mateCommentList.isEmpty()) {
			mService.deleteAllMateCom(mateNo);
		}
		int result = mService.deleteMate(mateNo);
		if(result > 0) {
			return "redirect:mateList.doa";
		} else {
			model.addAttribute("msg", "메이트 모집글 삭제 실패");
			return "common/errorPage";
		}
	}
}
