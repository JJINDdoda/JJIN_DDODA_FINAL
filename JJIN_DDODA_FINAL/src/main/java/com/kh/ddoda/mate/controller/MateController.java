package com.kh.ddoda.mate.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.kh.ddoda.common.Search;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.MateComment;
import com.kh.ddoda.mate.domain.Mymate;
import com.kh.ddoda.mate.service.MateService;
import com.kh.ddoda.member.domain.Member;
import com.kh.ddoda.opendiary.domain.DiaryImg;

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
	public ModelAndView mateList(ModelAndView mv, String category,
							@RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = mService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		ArrayList<Mate> mateList = mService.mateList(map, pi);
//		System.out.println(mateList);
		if(!mateList.isEmpty()) {
//			System.out.println(currentPage+", "+listCount);
			mv.addObject("mateList", mateList)
				.addObject("pi", pi)
				.addObject("category", category)
				.setViewName("mate/mateList");
		} else {
			mv.addObject("mateList", mateList)
				.addObject("pi", pi)
				.addObject("category", category)
				.setViewName("mate/mateList");
		}
		return mv;
	}
	
	
	//메이트모집 글 등록
	@RequestMapping(value="mateInsert.doa", method=RequestMethod.POST)
	public String insertMate(Mate mate, HttpServletRequest request, Model model,
				@RequestParam(value="category") String category,
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
			path = "redirect:mateList.doa?category=health";
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
		public void mateComList(ModelAndView mv, HttpServletRequest request, HttpServletResponse response, int mateNo,
						@RequestParam(value="page", required=false)Integer page) throws Exception {
			int currentPage = (page != null) ? page : 1;
			int listCount = mService.getComListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			
			//아직 댓글 페이징 처리 안함
			ArrayList<MateComment> mateComList = mService.selectMateCom(mateNo, pi);
			for(MateComment mateCom : mateComList) {
				mateCom.setMateComContents(URLEncoder.encode(mateCom.getMateComContents(), "utf-8"));
			}
			
			HashMap<String, Object> map =  new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("mateComList", mateComList);
			System.out.println(mateComList);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(map, response.getWriter());
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
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mateNo", mateNo);
			map.put("mateComRefNo", mateComRefNo);
			ArrayList<MateComment> mateComReplyList = mService.selectMateComReply(map);
			for(MateComment mateCom : mateComReplyList) {
				mateCom.setMateComContents(URLEncoder.encode(mateCom.getMateComContents(), "utf-8"));
			}
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(mateComReplyList, response.getWriter());
			System.out.println("대댓글 리스트 " + mateComReplyList);
		}
		
	//댓글 삭제 
	@ResponseBody
	@RequestMapping(value="deleteMateCom.doa", method=RequestMethod.GET)
	public String deleteMateCom (@RequestParam("mateComNo") int mateComNo) {
		int result = mService.deleteMateCom(mateComNo);
		System.out.println("controller의 result : "+ result);
		if(result >0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//대댓글 삭제
	@ResponseBody
	@RequestMapping(value="deleteMateComReply.doa", method=RequestMethod.GET) 
	public String deleteMateComReply(@RequestParam("mateComNo") int mateComNo) {
		int result = mService.deleteMateComReply(mateComNo);
		System.out.println("대댓글 controller의 result : "+ result);
		if(result >0) {
			return "success";
		} else {
			return "fail";
		}
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
										@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
		mv.addObject("mate",  mService.selectOneMate(mateNo))
			.addObject("currentPage", page)
			.setViewName("mate/mateUpdate");
		return mv;
	}
	
	//메이트 모집글 수정
	@RequestMapping(value="mateUpdate.doa", method = RequestMethod.POST)
	public ModelAndView mateUpdate(ModelAndView mv, @ModelAttribute Mate mate,
									HttpServletRequest request, @RequestParam(value="page",required=false) Integer page) {
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
		ArrayList<MateComment> mateCommentList = mService.selectMateComNo(mateNo);
		if(!mateCommentList.isEmpty()) {
			mService.deleteAllMateCom(mateNo);
		}
		//모집글을 삭제해도 모집 파티는 사라지지 않음
		int result = mService.deleteMate(mateNo);
		if(result > 0) {
			return "redirect:mateList.doa";
		} else {
			model.addAttribute("msg", "메이트 모집글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	//메이트 모집글 검색
		@RequestMapping(value="mateSearch.doa", method=RequestMethod.GET)
		public ModelAndView mateSearch(ModelAndView mv, Search search, Model model
				, @RequestParam(value="page", required=false)Integer page) {
			int currentPage = (page != null) ? page : 1;
			int listCount = mService.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			ArrayList<Mate> searchList = mService.selectSearchList(search, pi);
			if(! searchList.isEmpty()) {
				mv.addObject("mateList", searchList)
					.addObject("search", search)
					.addObject("pi", pi)
					.setViewName("mate/mateList");
			}else {
				mv.addObject("mateList", searchList)
				.addObject("search", search)
				.addObject("pi", pi)
				.setViewName("mate/mateList");
			}
			return mv;
	 	}
		
	//메이트 모집완료 시 
		@ResponseBody
		@RequestMapping(value="askFinish.doa", method=RequestMethod.GET)
		public String askFinish(Mymate mymate, int mateNo, HttpSession session) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			mymate.setUserId(userId);
			int result = mService.finishMate(mateNo);
			int result2 = mService.insertMymate(mymate);
			if(result >0 && result2 > 0) {
				System.out.println("메이트 모집오나료 : "+ result);
				return "success";
			} else {
				return "fail";
			}
		}
		
	//마이페이지 메이트 리스트
		@RequestMapping(value="myMateAttendList.doa", method=RequestMethod.GET)
		public ModelAndView myMateAttendList(ModelAndView mv, 
											@RequestParam(value="userId", required=false)String userId,
											@RequestParam(value="page", required=false)Integer page) {
			System.out.println(userId);
			int currentPage = (page != null) ? page : 1;
			int listCount = mService.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Mate> mateAttendList = mService.myMateAttendList(userId, pi);
			
//			System.out.println("mateAttendList : "+ mateAttendList);
			System.out.println("controller : "+mateAttendList);
			if(!mateAttendList.isEmpty()) {
				mv.addObject("mateAttendList", mateAttendList);
				mv.addObject("pi", pi);
				mv.setViewName("myPage/myMate");
			} else {
				mv.addObject("mateAttendList", mateAttendList);
				mv.addObject("pi", pi);
				mv.setViewName("myPage/myMate");
			}
			return mv;
		}
		
		
	//마이메이트 나가기
	@ResponseBody
	@RequestMapping(value="mymateOut.doa", method=RequestMethod.POST)
	public String mymateOut( @RequestParam("mateNo") int mateNo,
							@RequestParam("userId") String userId,
							HttpSession session) {
		Mymate mymate = new Mymate();
		mymate.setMateNo(mateNo);
		mymate.setUserId(userId);
		int result = mService.mymateOut(mymate);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//마이페이지 내가쓴 글
	@RequestMapping(value="mateContentsList.doa", method=RequestMethod.GET)
	public ModelAndView myContentsList(ModelAndView mv, @RequestParam(value="userId", required=false)String userId,
							@RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = mService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Mate> myContentsList = mService.myContentsList(userId, pi);
		System.out.println("myContentsList : " + myContentsList);
		if( !myContentsList.isEmpty()) {
			mv.addObject("myContentsList", myContentsList)
				.addObject("pi", pi)
				.setViewName("myPage/myContents");
		} else {
			mv.addObject("myContentsList", myContentsList)
				.addObject("pi", pi)
				.setViewName("myPage/myContents");
		}
		return mv;
	}
	
	//마이페이지 상세보기
		//메이트 상세조회
			@RequestMapping(value="mypageMateDetail.doa", method=RequestMethod.GET)
			public ModelAndView mypageMateDetail(ModelAndView mv, int mateNo, Integer page) {
				int currentPage = page != null? page : 1;
				mService.addViewCount(mateNo);
				Mate mate = mService.selectOneMate(mateNo);
				if(mate != null) {
					mv.addObject("mateOne", mate)
						.addObject("currentPage", currentPage)
							.setViewName("myPage/mypageMateDetail");
				}else {
					mv.addObject("msg", "게시글 상세조회 실패");
					mv.setViewName("common/errorPage");
				}
				return mv;
			}
	
}
