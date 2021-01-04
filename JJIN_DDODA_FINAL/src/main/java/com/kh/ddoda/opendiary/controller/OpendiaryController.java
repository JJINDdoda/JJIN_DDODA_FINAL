package com.kh.ddoda.opendiary.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.common.ImgPagination;
import com.kh.ddoda.mate.domain.MateComment;
import com.kh.ddoda.member.domain.Member;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.opendiary.domain.OpendiaryComment;
import com.kh.ddoda.opendiary.service.OpendiaryService;
import com.kh.ddoda.opendiary.store.OpendiaryStore;

@Controller
public class OpendiaryController {

	@Autowired
	private OpendiaryService odService;
	
	
	//공유일기 전체리스트 조회 
	@RequestMapping("opendiaryList.doa")
	public ModelAndView openList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page: 1;
		int listCount = odService.getListCount();
		PageInfo pi = ImgPagination.getPageInfo(currentPage, listCount);
		ArrayList<Opendiary> opendiaryList = odService.opendList(pi);
		ArrayList<DiaryImg> diaryImgList = odService.diaryImgList();
//		if(!diaryImgList.isEmpty()) {
//			DiaryImg diaryImg = new DiaryImg();
//			diaryImg.setDiaryNo(diaryNo);
//		}
		if( !opendiaryList.isEmpty()) {
			mv.addObject("opendiaryList", opendiaryList);
			if( !diaryImgList.isEmpty()) {
				mv.addObject("diaryImgList", diaryImgList);
			}else {
				mv.addObject("diaryImgList", null);
			}
			mv.addObject("pi", pi);
			mv.setViewName("opendiary/opendiaryList");
			System.out.println(diaryImgList.toString());
		} else {
			mv.addObject("opendiaryList", opendiaryList);
			mv.addObject("pi", pi);
			mv.setViewName("opendiary/opendiaryList");
		}
		return mv;
	}
	
	//공유일기 작성폼 
	@RequestMapping(value="openInsertView.doa", method=RequestMethod.GET)
	public String openWriteView() {
		return "opendiary/openInsertForm";
	}
	
	//공유일기 작성
	@RequestMapping(value="opendiaryInsert.doa", method=RequestMethod.POST)
	public String opendiaryInsert(Opendiary opendiary, Model model, HttpServletRequest request, 
						@RequestParam(name="imgMainYn", required=false) Integer imgMainYn,
						@RequestParam(name="fileImg", required=false) MultipartFile[] fileImgs) throws Exception{
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		System.out.println(opendiary.toString());
		//사진객체를 Array에다가 넣는다.
		ArrayList<DiaryImg> dimgs = new ArrayList<DiaryImg>();
		HashMap<String, String> parameters = new HashMap<String, String>();
		DiaryImg dimg = null;
		String imgRenamePath = null;
		String path = null;
		
		int diaryresult = 0; // opendiary 테이블에 넣은거 성공? 
		int pictureresult = 0; // diary_img 테이블에 넣은거 성공?
		int imgresult = 0; //opendiary imgRenamePath 업테이트 성공?
		diaryresult = odService.insertOpend(opendiary); //opendiary 테이블에 form 내용 넣기
		int folderNo  = opendiary.getOpendiaryNo();
		HashMap<String, Object> imgupdate = new HashMap<String, Object>();
		
		for(int i = 0 ; i < fileImgs.length ; i ++) {
			if ( !fileImgs[i].getOriginalFilename().equals("")) {
				dimg = new DiaryImg();
				imgRenamePath = saveFileName( request, fileImgs[i], session, i,folderNo);
				if (imgMainYn == i) {
					dimg.setUserId(userId);
					dimg.setImgRenamePath(imgRenamePath);
					dimg.setImgMainYn("Y");
					dimg.setImgPath(fileImgs[i].getOriginalFilename());
					dimg.setMenuName("공유일기");
					imgupdate.put("imgRenamePath", imgRenamePath);
					imgupdate.put("opendiaryNo", folderNo);
					odService.updateOpendImage(imgupdate);
				} else {
					dimg.setUserId(userId);
					dimg.setImgRenamePath(imgRenamePath);
					dimg.setImgMainYn("N");
					dimg.setImgPath(fileImgs[i].getOriginalFilename());
					dimg.setMenuName("공유일기");
				}
				//이미지 객체?리스트에 넣어준다.
				dimgs.add(dimg);
			}
		}
		
		for(int i = 0; i < dimgs.size(); i++) {
			parameters.put("userId", userId);
			parameters.put("imgMainYn", dimgs.get(i).getImgMainYn());
			parameters.put("imgPath", dimgs.get(i).getImgPath());
			parameters.put("imgRenamePath", dimgs.get(i).getImgRenamePath());
			parameters.put("menuName", dimgs.get(i).getMenuName());
			pictureresult = odService.insertfileImg(parameters); //diary_img 테이블에 img 넣기
		}
		if(diaryresult > 0 || pictureresult > 0) {
			path = "redirect:opendiaryList.doa";
		}else {
			model.addAttribute("msg", "공지사항 등록 실패!");
			path = "common/errorPage";
		}
		return path;
	}
	
	public String saveFileName(HttpServletRequest request, @RequestParam(name="fileImg", required= false) MultipartFile fileImg, HttpSession session, int i, int folderNo) {
		//파일 저장 saveFile 
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		//폴더 경로 생성 
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//opendiaryUploadFiles//"+userId +"//"+folderNo;
		File folder = new File(savePath); //폴더 만들기
		if( ! folder.exists()) {
			folder.mkdirs();
		}
		//이미지 파일 명 생성 yyyymmddhhmmss_0.jpg
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String imgOriginName = fileImg.getOriginalFilename();
		String imgRename = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"_" + i + "."
				+ imgOriginName.substring(imgOriginName.lastIndexOf(".")+1);
		
		String filePath = folder+ "//" + imgRename ;
		try {
			fileImg.transferTo(new File(filePath)); //try ~ catch 해줘야 함
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imgRename;
	}
	//공유일기 상세보기
	@RequestMapping(value="opendiaryDetail.doa", method=RequestMethod.GET)
	public ModelAndView opendiaryDetail(ModelAndView mv, int opendiaryNo, Integer page) {
		int currentPage = page != null? page : 1;
		odService.addViewCount(opendiaryNo);
		Opendiary opendiary = odService.selectOneOpend(opendiaryNo);
		ArrayList<DiaryImg> dimgs = odService.selectDiaryImgList(opendiaryNo); 
		int dimgsCount = dimgs.size();
		if(opendiary != null) {
			mv.addObject("opendiaryOne", opendiary)
				.addObject("diaryImg", dimgs)
				.addObject("dimgsCount", dimgsCount)
				.addObject("currentPage", currentPage)
					.setViewName("opendiary/opendiaryDetail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//공유일기 수정하기 화면
	@RequestMapping(value="opendiaryUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView opendiaryUpdateView (@RequestParam("opendiaryNo") int opendiaryNo,
											@RequestParam("page") Integer page, ModelAndView mv) throws Exception{
		ArrayList<DiaryImg> dimgs = odService.selectDiaryImgList(opendiaryNo); 
		int dimgsCount = dimgs.size();
		//대표 이미지 아이디
		DiaryImg mainImg = odService.diaryImgListNo(opendiaryNo);
		System.out.println(mainImg);
		if(mainImg != null) {
			String mainImgPath = mainImg.getImgRenamePath();
			mv.addObject("opendiary", odService.selectOneOpend(opendiaryNo))
				.addObject("diaryImg", odService.selectDiaryImgList(opendiaryNo))
				.addObject("dimgsCount", dimgsCount)
				.addObject("mainImgPath", mainImgPath)
				.addObject("currentPage", page)
				.setViewName("opendiary/opendiaryUpdate");
			System.out.println("view단 : "+mainImgPath);
		} else {
			mv.addObject("opendiary", odService.selectOneOpend(opendiaryNo))
				.addObject("diaryImg", odService.selectDiaryImgList(opendiaryNo))
				.addObject("dimgsCount", dimgsCount)
				.addObject("currentPage", page)
				.setViewName("opendiary/opendiaryUpdate");
			System.out.println("대표이미지 없다");
		}
		return mv;
	}
	
	//공유일기 수정하기 
	@RequestMapping(value="opendiaryUpdate.doa", method=RequestMethod.POST)
	public ModelAndView opendiaryUpdate(ModelAndView mv, @ModelAttribute Opendiary opendiary, 
			@RequestParam(name="imgMainYn", required=false) Integer imgMainYn,
						HttpServletRequest request, @RequestParam("page") Integer page,
						@RequestParam(value="reloadFile", required=false) MultipartFile[] reloadFile) {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		System.out.println(opendiary.toString());
		//새로 업로드된 파일 저장
		ArrayList<DiaryImg> dimgs = new ArrayList<DiaryImg>();
		HashMap<String, Object> reloadFiles = new HashMap<String, Object>();
		DiaryImg dimg = null;
		String imgRenamePath = null;
		String path = null;
		int diaryresult = 0; // opendiary 테이블에 넣은거 성공? 
		int pictureresult = 0; // diary_img 테이블에 넣은거 성공?
		diaryresult = odService.updateOpend(opendiary);
		System.out.println(opendiary.getOpendiaryNo());
//		
//		int imgMainYn = 0;
//		if(diaryImg.getImgMainYn() != null) {
//			imgMainYn = Integer.parseInt(diaryImg.getImgMainYn());
//			System.out.println("imgMainYn : " + imgMainYn);
//		} else {
//			imgMainYn = 10;
//		}
		//새로 업로드된 파일이 있을 경우
		System.out.println(imgMainYn);
		if(reloadFile.length > 0 ) {
			int folderNo  = opendiary.getOpendiaryNo();
			for(int i = 0 ; i < reloadFile.length ; i ++) {
				if ( !reloadFile[i].getOriginalFilename().equals("")) {
					dimg = new DiaryImg();
					imgRenamePath = saveFileName( request, reloadFile[i], session, i, folderNo);
					if(imgMainYn != null) {
						if (imgMainYn == i) {
							dimg.setUserId(userId);
							dimg.setImgRenamePath(imgRenamePath);
							dimg.setImgMainYn("Y");
							dimg.setImgPath(reloadFile[i].getOriginalFilename());
							dimg.setMenuName("공유일기");
						} else {
							dimg.setUserId(userId);
							dimg.setImgRenamePath(imgRenamePath);
							dimg.setImgMainYn("N");
							dimg.setImgPath(reloadFile[i].getOriginalFilename());
							dimg.setMenuName("공유일기");
						}
					} else {
						dimg.setUserId(userId);
						dimg.setImgRenamePath(imgRenamePath);
						dimg.setImgMainYn("N");
						dimg.setImgPath(reloadFile[i].getOriginalFilename());
					}
					//이미지 객체?리스트에 넣어준다.
					dimgs.add(dimg);
					System.out.println("dimgs : "+dimgs);
				}
			}
		}
		for(int i = 0; i < dimgs.size(); i++) {
			reloadFiles.put("userId", userId);
			reloadFiles.put("imgMainYn", dimgs.get(i).getImgMainYn());
			reloadFiles.put("opendiaryNo", opendiary.getOpendiaryNo());
			reloadFiles.put("imgPath", dimgs.get(i).getImgPath());
			reloadFiles.put("imgRenamePath", dimgs.get(i).getImgRenamePath());
			reloadFiles.put("menuName", dimgs.get(i).getMenuName());
			System.out.println("새로등록되는 이미지파일들 : "+reloadFiles.toString());
			pictureresult = odService.insertfileImgUpdate(reloadFiles); //diary_img 테이블에 img 넣기
		}
		if(diaryresult > 0 || pictureresult > 0) {
			mv.setViewName("redirect:opendiaryDetail.doa?opendiaryNo="+opendiary.getOpendiaryNo());
		}else {
			mv.addObject("msg", "수정 실패");
		}
		return mv;
	}
	//공유일기 수정할 때 파일 삭제 : DB데이터 삭제 -> DB 데이터 삭제 성공 시 저장된 img 파일 삭제 -> success 반
	@ResponseBody
	@RequestMapping(value="deleteFile.doa", method=RequestMethod.GET)
	public String deleteFile(@RequestParam("opendiaryNo") int opendiaryNo, 
							@RequestParam("imgRenamePath") String imgRenamePath,
							HttpServletRequest request, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("opendiaryNo", opendiaryNo);
		map.put("imgRenamePath", imgRenamePath);
		
		ArrayList<DiaryImg> dimgs = odService.selectDiaryImgList(opendiaryNo);
		System.out.println("수정 파일 삭제 시 dimgs : "+dimgs);
		if(!dimgs.isEmpty()) {
			deleteFileOne(opendiaryNo, imgRenamePath, request);
		}
		int result = odService.deleteFile(map);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	//이클립스 내 첨부파일 삭제 
	public void deleteFileOne(int opendiaryNo, String imgRenamePath, HttpServletRequest request) {
		//파일 저장 saveFile 
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int folderNo = opendiaryNo;
		//폴더 경로 생성 
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//opendiaryUploadFiles//"+userId +"//"+folderNo;
		File file = new File(savePath +"//"+ imgRenamePath); //폴더 만들기
		if( file.exists()) {
			file.delete();
		}
	}
	//수정 시 대표 사진 수정
	@RequestMapping("updateMainImg.doa")
	public String updateMainImg(@RequestParam("opendiaryNo") int opendiaryNo) {
		int result = odService.updateMainImg(opendiaryNo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//공유일기 모집글 삭제 
	@RequestMapping(value="opendiaryDelete.doa", method = RequestMethod.GET)
	public String opendiaryDelete(@RequestParam("opendiaryNo") int opendiaryNo,  HttpServletRequest request, Model model) {
//		Opendiary opendiary = odService.selectOneOpend(opendiaryNo);
		int fileresult = odService.deleteAllFile(opendiaryNo);
		ArrayList<DiaryImg> dimgs = odService.selectDiaryImgList(opendiaryNo);
		if(!dimgs.isEmpty()) {
			deleteAllFile(opendiaryNo, request, model);
		}
		int opendresult = odService.deleteOpend(opendiaryNo);
		
		if(opendresult > 0 || fileresult > 0) {
			return "redirect:opendiaryList.doa";
		} else {
			model.addAttribute("msg", "게시글 삭제 실패...");
			return "common/errorPage";
		}
	}
	//이클립스 내 첨부파일 모두 삭제 
	public void deleteAllFile(int opendiaryNo,  HttpServletRequest request, Model model) {
		//파일 저장 saveFile 
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int folderNo = opendiaryNo;
		//폴더 경로 생성 
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//opendiaryUploadFiles//"+userId +"//"+folderNo;
		File file = new File(savePath); //폴더 만들기
		if( file.exists()) {
			//폴더 하위에 파일이 존재할 경우 지워지지 않는다. 하위파일 지우는 코드 필요! 
			File[] deleteFolderList = file.listFiles();
			System.out.println(deleteFolderList);
			for(int j = 0 ; j <deleteFolderList.length ; j++) {
				deleteFolderList[j].delete();
			}
			file.delete();
		}
	}
	
	//댓글 작성
	@ResponseBody
	@RequestMapping(value="addOpendComments.doa", method=RequestMethod.POST)
	public String addOpendComments (OpendiaryComment opendiaryComment, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String openComUser = loginUser.getUserId();
		opendiaryComment.setOpenComUser(openComUser);
		System.out.println("openComUser :" +openComUser);
		int result = odService.insertOpendCom(opendiaryComment);
		System.out.println("댓글작성 결과 : " + result);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//댓글 리스트
	@RequestMapping(value="opendiaryComList.doa", method=RequestMethod.GET)
	public void mateComList(HttpServletResponse response, int opendiaryNo,
					@RequestParam(value="page", required=false)Integer page) throws Exception {
		int currentPage = (page != null) ? page : 1;
		//댓글 갯수 받아오기
		int listCount = odService.getComReplyListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		HashMap<String, Object> map =  new HashMap<String, Object>();
//		map.put("pi", pi);
//		map.put("opendiaryNo", opendiaryNo);
		//아직 댓글 페이징 처리 안함
		ArrayList<OpendiaryComment> opendiaryComList = odService.opendiaryComList(opendiaryNo, pi);
		for(OpendiaryComment opendiaryCom : opendiaryComList) {
			opendiaryCom.setOpenComContents(URLEncoder.encode(opendiaryCom.getOpenComContents(),"utf-8"));
		}
		HashMap<String, Object> map =  new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("opendiaryComList", opendiaryComList);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(map, response.getWriter());
		System.out.println("오픈다이어리 댓글 리스트" +pi +","+currentPage);
	}
	
	//메이틑 대댓글 등록
		@ResponseBody
		@RequestMapping(value="addOpenComReply.doa", method=RequestMethod.POST)
		public String addMateComReply ( OpendiaryComment opendiaryCom, HttpSession session) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String openComUser = loginUser.getUserId();
			opendiaryCom.setOpenComUser(openComUser);
			int result = odService.insertOpenComReply(opendiaryCom);
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		}
		//메이트 대댓글 리스트
		@RequestMapping(value="openComReplyList.doa", method=RequestMethod.GET)
		public void mateComReply(HttpServletResponse response, @RequestParam("opendiaryNo") int opendiaryNo, 
							@RequestParam("refNo") int refNo) throws Exception {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("opendiaryNo", opendiaryNo);
			map.put("refNo", refNo);
			ArrayList<OpendiaryComment> mateComReplyList = odService.opendiaryComReplyList(map);
			for(OpendiaryComment opendiartCom : mateComReplyList) {
				opendiartCom.setOpenComContents(URLEncoder.encode(opendiartCom.getOpenComContents(), "utf-8"));
			}
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(mateComReplyList, response.getWriter());
			System.out.println("대댓글 리스트 " + mateComReplyList);
		}
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="deleteOpendCom.doa", method=RequestMethod.GET)
	public String deleteOpendCom (@RequestParam("openComNo")int openComNo) {
		int result = odService.deleteOpendCom(openComNo);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//공유일기 모집글 검색
	@RequestMapping(value="openDiarySearch.doa", method=RequestMethod.GET)
	public ModelAndView openDiarySearch(ModelAndView mv, Search search, Model model,
									@RequestParam(value="page", required=false) Integer page) {	
		int currentPage = (page != null) ? page : 1;
		int listCount = odService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Opendiary> searchList = odService.selectSearchList(search, pi);
		if(! searchList.isEmpty()) {
			mv.addObject("opendiaryList", searchList)
				.addObject("search", search)
				.addObject("pi", pi)
				.setViewName("opendiary/opendiaryList");
		}else {
			mv.addObject("opendiaryList", searchList)
			.addObject("search", search)
			.addObject("pi", pi)
			.setViewName("opendiary/opendiaryList");
		}
		return mv;
	}
	
	//마이페이지 공유일기 전체리스트 조회 
		@RequestMapping(value="opendiaryContentsList.doa", method=RequestMethod.GET)
		public ModelAndView opendiaryContentsList(ModelAndView mv,
							@RequestParam(value="userId", required=false)String userId,
							@RequestParam(value="page", required=false)Integer page) {
			int currentPage = (page != null) ? page: 1;
			int listCount = odService.getListCount();
			PageInfo pi = ImgPagination.getPageInfo(currentPage, listCount);
			ArrayList<Opendiary> opendiaryContents = odService.openContentsList(userId, pi);
			ArrayList<DiaryImg> diaryImgList = odService.diaryImgList();
//			if(!diaryImgList.isEmpty()) {
//				DiaryImg diaryImg = new DiaryImg();
//				diaryImg.setDiaryNo(diaryNo);
//			}
			System.out.println("opendiaryContents : "+ opendiaryContents);
			if( !opendiaryContents.isEmpty()) {
				mv.addObject("opendiaryContents", opendiaryContents);
				if( !diaryImgList.isEmpty()) {
					mv.addObject("diaryImgList", diaryImgList);
				}else {
					mv.addObject("diaryImgList", null);
				}
				mv.addObject("pi", pi);
				mv.setViewName("myPage/opendiaryContents");
				System.out.println(diaryImgList.toString());
			} else {
				mv.addObject("opendiaryContents", opendiaryContents);
				mv.addObject("pi", pi);
				mv.setViewName("myPage/opendiaryContents");
			}
			return mv;
		}
	//마이페이지 상세보기 
		//공유일기 상세보기
		@RequestMapping(value="mypageOpenDetail.doa", method=RequestMethod.GET)
		public ModelAndView mypageOpenDetail(ModelAndView mv, int opendiaryNo, Integer page) {
			int currentPage = page != null? page : 1;
			odService.addViewCount(opendiaryNo);
			Opendiary opendiary = odService.selectOneOpend(opendiaryNo);
			ArrayList<DiaryImg> dimgs = odService.selectDiaryImgList(opendiaryNo); 
			int dimgsCount = dimgs.size();
			if(opendiary != null) {
				mv.addObject("opendiaryOne", opendiary)
					.addObject("diaryImg", dimgs)
					.addObject("dimgsCount", dimgsCount)
					.addObject("currentPage", currentPage)
						.setViewName("myPage/mypageOpenDetail");
			} else {
				mv.addObject("msg", "게시글 상세조회 실패");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
}
