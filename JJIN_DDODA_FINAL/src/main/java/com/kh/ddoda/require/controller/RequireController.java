package com.kh.ddoda.require.controller;

import java.util.ArrayList;
import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.require.domain.Reply;
import com.kh.ddoda.require.domain.Require;
import com.kh.ddoda.require.service.RequireService;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.member.domain.Member;

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
	
	//문의사항 전체리스트 조회
	@RequestMapping(value="requireList.doa", method=RequestMethod.GET)
	public ModelAndView requireList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = rService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Require> requireList = rService.requireList(pi);
		System.out.println(requireList+", "+page +","+currentPage +","+listCount);
		if(!requireList.isEmpty()) {
			mv.addObject("requireList", requireList);
			mv.addObject("pi", pi);
			mv.setViewName("require/requireList");
		} else {
			mv.addObject("requireList", requireList);
			mv.addObject("pi", pi);
			mv.setViewName("require/requireList");
		}
		return mv;
	}
	

	//문의사항 글쓰기 화면
	@RequestMapping(value="requireInsertView.doa", method = RequestMethod.GET)
	public String requireWriteView() {
		return "require/requireInsertForm";
	}
	
	//문의사항 등록
	@RequestMapping(value="requireInsert.doa", method=RequestMethod.POST)
	public String requireInsert(Require require, Model model, HttpServletRequest request, HttpSession session,
					@RequestParam(name="uploadFile", required=false) MultipartFile uploadFile) {
		//파일 서버에 저장 
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile, request, session);
			System.out.println(renameFileName +", "+uploadFile);
			if(renameFileName != null) {
				require.setOriginalFilename(uploadFile.getOriginalFilename());
				require.setRenameFilename(renameFileName);
			}
		}
		//데이터를 디비에 저장하는 작업 
		int result = 0; //result 는 성공여부 파악 
		String path = null;
		result = rService.insertRequire(require);
		if(result >0) {
			path = "redirect:requireList.doa";
		} else {
			model.addAttribute("msg", "공지사항 등록 실패!");
			path = "common/errorPage";
		}
		return path;
	}
	//파일저장
	public String saveFile(MultipartFile file, HttpServletRequest request, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//requireUploadFiles//"+userId;
		File folder = new File(savePath);
		//폴더 없을 경우
		if(!folder.exists()) {
			folder.mkdirs(); //상위 폴더 생성 
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
						+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String filePath = folder+ "//" +renameFileName;
//		System.out.println(folder +","+ userId +","+ folder +","+ filePath);
		//파일 저장
		try {
			file.transferTo(new File(filePath)); //try ~ catch 해줘야 함
		} catch (Exception e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	//문의사항 상세조회
	@RequestMapping(value="requireDetail.doa", method=RequestMethod.GET)
	public ModelAndView requireDetail(ModelAndView mv, int requireNo, Integer page, HttpServletRequest request) {
		int currentPage = page != null? page : 1;
		rService.addReadCount(requireNo);
		Require require = rService.selectOneRequire(requireNo);
		if(require != null) {
			mv.addObject("require", require)
			.addObject("currentPage", currentPage)
			.setViewName("require/requireDetail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//문의사항 검색
	@RequestMapping(value="requireSearch.doa", method=RequestMethod.GET)
	public ModelAndView requireSearch(ModelAndView mv, Search search, Model model
			, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = rService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Require> searchList = rService.selectSearchList(search, pi);
		if(! searchList.isEmpty()) {
			mv.addObject("requireList", searchList)
				.addObject("search", search)
				.addObject("pi", pi)
				.setViewName("require/requireList");
		}else {
			mv.addObject("requireList", searchList)
			.addObject("search", search)
			.addObject("pi", pi)
			.setViewName("require/requireList");
		}
		return mv;
 	}
	//문의사항 수정화면 보기
	@RequestMapping(value="requireUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView requireUpdateView(@RequestParam("requireNo") int requireNo,@RequestParam("page") Integer page, ModelAndView mv ) {
		mv.addObject("require", rService.selectOneRequire(requireNo))
		.addObject("currentPage", page)
		.setViewName("require/requireUpdate");
		return mv;
	}
	
	//문의사항 수정
	@RequestMapping(value="requireUpdate.doa", method=RequestMethod.POST)
	public ModelAndView requireUpdate(ModelAndView mv, @ModelAttribute Require require,
					HttpServletRequest request, @RequestParam("page") Integer page,
					@RequestParam(value="reloadFile",required=false) MultipartFile reloadFile, HttpSession session) {
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(require.getOriginalFilename() != null) {
				deleteFile(require.getRenameFilename(), request, session);
			}
			String renameFileName = saveFile(reloadFile, request, session);
			if(renameFileName != null) {
				require.setOriginalFilename(reloadFile.getOriginalFilename());
				require.setRenameFilename(renameFileName);
			}
		}
		int result = rService.updateRequire(require);
		if(result >0) {
			mv.addObject("page", page)
			.setViewName("redirect:requireList.doa");
			return mv;
		} else {
			mv.addObject("msg", "수정 실패");
			return mv;
		}
	}
	//문의사항 첨부파일 삭제
		public void deleteFile(String fileName, HttpServletRequest request, HttpSession session) {
			//파일 저장 경로 설정
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "//requireUploadFiles//"+userId;
			// 삭제할 파일 경로를 통한 파일 객체 생성
			String deletePath = savePath + "//" + fileName;
			System.out.println(deletePath);
			File file = new File(deletePath);
			if(file.exists()) { //만일 실제로 파일이 존재하면 삭제하기
				System.out.println("존재");
				file.delete();
			}
		}

	//문의사항 삭제 
		
	@RequestMapping(value="requireDelete.doa", method=RequestMethod.GET)
	public String requireDelete(int requireNo, HttpServletRequest request, Model model, 
					HttpSession session, @RequestParam("page") Integer page) {
		Require require = rService.selectOneRequire(requireNo);
		if(require.getOriginalFilename() != null) {
			deleteFile(require.getRenameFilename(), request, session);
		}
		int result = rService.deleteRequire(requireNo);
		if(result > 0) {
			model.addAttribute("page",page);
			return "redirect:requireList.doa";
		} else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
}
