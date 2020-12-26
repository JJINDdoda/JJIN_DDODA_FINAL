package com.kh.ddoda.calendar.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.ddoda.calendar.service.CalendarService;
import com.kh.ddoda.member.domain.Member;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;

@Controller
public class CalendarController {
	@Autowired
	private CalendarService cService;

	//캘린더 화면보기
	@RequestMapping(value="calendarView.doa", method=RequestMethod.GET)
	public String calendarView() {
		return "calendar/calendarView";
	}
	
	//마이 일기 작성하기 폼
	@RequestMapping(value="diaryView.doa", method=RequestMethod.GET)
	public ModelAndView diaryView(ModelAndView mv, Date date) {
		mv.addObject("date", date)
		 .setViewName("calendar/diary");
		return mv;
	}
	
	//마이 일기 작성하기
	@RequestMapping(value="insertMyDiary.doa", method=RequestMethod.POST)
	public String diaryInsert(Opendiary opendiary, Model model, HttpServletRequest request,
			@RequestParam(name="opendiaryDate", required=false) String opendiaryDate,
			@RequestParam(name="imgMainYn", required=false) Integer imgMainYn,
			@RequestParam(name="fileImg", required=false) MultipartFile[] fileImgs) {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		ArrayList<DiaryImg> dimgs = new ArrayList<DiaryImg>();
		HashMap<String, String> parameters = new HashMap<String, String>();
		DiaryImg dimg = null;
		String imgRenamePath = null;
		String path = null;
		int diaryresult = 0; // diary 테이블에 넣은거 성공? 
		int pictureresult = 0; // diary_img 테이블에 넣은거 성공?
		diaryresult = cService.insertDiary(opendiary); //opendiary 테이블에 form 내용 넣기
		int folderNo = opendiary.getOpendiaryNo();
		String menuName = opendiary.getOpenYn();
		System.out.println("menuName"+menuName);
		
		HashMap<String, Object> imgupdate = new HashMap<String, Object>();
		for(int i = 0 ; i < fileImgs.length ; i ++) {
			if ( !fileImgs[i].getOriginalFilename().equals("")) {
				dimg = new DiaryImg();
				imgRenamePath = saveFileName( request, fileImgs[i], session, i);
				if (imgMainYn == i) {
					dimg.setUserId(userId);
					dimg.setImgRenamePath(imgRenamePath);
					dimg.setImgMainYn("Y");
					dimg.setImgPath(fileImgs[i].getOriginalFilename());
						if(menuName.contains("Y")) {
							dimg.setMenuName("마이일기");
						}else {
							dimg.setMenuName("마이일기");
						}
					imgupdate.put("imgRenamePath", imgRenamePath);
					imgupdate.put("opendiaryNo", folderNo);
					cService.updateMyDiaryImage(imgupdate);
					System.out.println("dimg:"+dimg);
				} else {
					dimg.setUserId(userId);
					dimg.setImgRenamePath(imgRenamePath);
					dimg.setImgMainYn("N");
					dimg.setImgPath(fileImgs[i].getOriginalFilename());
						if(menuName.contains("Y")) {
							dimg.setMenuName("마이일기");
						}else {
							dimg.setMenuName("마이일기");
						}
					System.out.println("dimg:"+dimg);
				}
				//이미지 객체?리스트에 넣어준다.
				dimgs.add(dimg);
//				System.out.println(dimgs);
			}
		}
		for(int i = 0; i < dimgs.size(); i++) {
			parameters.put("userId", userId);
			parameters.put("imgMainYn", dimgs.get(i).getImgMainYn());
			parameters.put("imgPath", dimgs.get(i).getImgPath());
			parameters.put("imgRenamePath", dimgs.get(i).getImgRenamePath());
			if(menuName.contains("Y")) {
				parameters.put("menuName", dimgs.get(i).getMenuName());
				System.out.println("equals:"+parameters.get(menuName));
			}else {
				parameters.put("menuName", dimgs.get(i).getMenuName());
			}
			System.out.println("parameters :"+parameters);
			pictureresult = cService.insertfileImg(parameters); //diary_img 테이블에 img 넣기
		}
		if(diaryresult > 0 || pictureresult > 0) {
			path = "redirect:calendarView.doa";
		}else {
			model.addAttribute("msg", "일기 등록 실패!");
			path = "common/errorPage";
		}
		return path;
	}
	//파일 저장하기
	public String saveFileName(HttpServletRequest request, @RequestParam(name="fileImg", required= false) MultipartFile fileImg, 
			HttpSession session, int i){
		//파일 저장 saveFile 
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
//		int opendiaryNo = opendiary.getOpendiaryNo();
		
		//폴더 경로 생성 
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//diaryUploadFiles//"+userId ;
		
		File folder = new File(savePath); //폴더 만들기
		if( ! folder.exists()) {
			folder.mkdirs();
			System.out.println("폴더가 생성되었습니다");
		}
		System.out.println("이미 있는 폴더"+savePath);
		
		//이미지 파일 명 생성 yyyymmddhhmmss_0.jpg
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String imgOriginName = fileImg.getOriginalFilename();
		String imgRename = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"_" + i + "."
				+ imgOriginName.substring(imgOriginName.lastIndexOf(".")+1);
		
		String filePath = folder+ "//" + imgRename ;
//		System.out.println("saveFileName에서의 folderNo : "+ folderNo + "filePath : "+filePath);
		try {
			fileImg.transferTo(new File(filePath)); //try ~ catch 해줘야 함
			System.out.println("파일만들어따"+filePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imgRename;
	}
	
	//마이일기 리스트
	@RequestMapping(value="diaryList.doa", method=RequestMethod.GET)
	public void diaryList(HttpServletResponse response, 
							@RequestParam("userId") String userId) throws Exception {
		ArrayList<Opendiary> opendiaryList = cService.mydiaryList(userId);
//		for(Opendiary opendiary : opendiaryList) {
//			opendiary.set
//		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(opendiaryList, response.getWriter());
		System.out.println("다이어리 리스트 : "+ opendiaryList);
		
//		ArrayList<Opendiary> diaryList = cService.mydiaryList(userId);
//		if( !diaryList.isEmpty()) {
//			mv.addObject("diaryList", diaryList)
//				.setViewName("myPage/calendarView");
//		} else 
	}
	
	//마이 일기 오늘 이전 - 수정
//		@RequestMapping(value="diaryModifyView.doa", method=RequestMethod.GET)
//		public ModelAndView diaryModifyView(ModelAndView mv, Date date) {
//			Opendiary opendiaryOne = cService.selectOneDiary(diaryNo);
//			mv.addObject("date", date)
//			 .setViewName("calendar/diaryUpdate");
//			return mv;
//		}
	
	//마이일기 수정하기 화면
	@RequestMapping(value="myDiaryModifyView.doa", method=RequestMethod.GET)
	public ModelAndView diaryModifyView(ModelAndView mv, int opendiaryNo) {
		ArrayList<DiaryImg> dimgs = cService.mydiaryFileList(opendiaryNo);
		int dimgsCount = dimgs.size();
		Opendiary opendiary = cService.selectOneDiary(opendiaryNo);
		if(opendiary != null) {
			mv.addObject("opendiary", opendiary)
				.addObject("diaryImg", dimgs)
				.addObject("dimgsCount", dimgsCount)
				.setViewName("calendar/diaryUpdate");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패")
				.setViewName("common/errorPage");
		}
		return mv;
	}
	//공유일기 수정하기
	@RequestMapping(value="myDiaryModify.doa",method=RequestMethod.POST)
	public ModelAndView mydiaryModify(ModelAndView mv, @ModelAttribute Opendiary opendiary, 
			@RequestParam(name="imgMainYn", required=false) Integer imgMainYn,
			HttpServletRequest request, @RequestParam("page") Integer page,
			@RequestParam(value="reloadFile", required=false) MultipartFile[] reloadFile) {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		ArrayList<DiaryImg> dimgs = new ArrayList<DiaryImg>();
		HashMap<String, Object> reloadFiles = new HashMap<String, Object>();
		DiaryImg dimg = null;
		String imgRenamePath = null;
		String path = null;
		int diaryresult = 0; // opendiary 테이블에 넣은거 성공? 
		int pictureresult = 0; // diary_img 테이블에 넣은거 성공?
		diaryresult = cService.modifyDiary(opendiary);
		System.out.println("숴정콘트롤러 : "+diaryresult);
		String menuName = opendiary.getOpenYn();
		System.out.println("menuName"+menuName);
		
		if(reloadFile.length > 0) {
			int folderNo  = opendiary.getOpendiaryNo();
			HashMap<String, Object> imgupdate = new HashMap<String, Object>();
			for(int i = 0 ; i < reloadFile.length ; i ++) {
				if ( !reloadFile[i].getOriginalFilename().equals("")) {
					dimg = new DiaryImg();
					imgRenamePath = saveFileName( request, reloadFile[i], session, i);
					if (imgMainYn == i) {
						dimg.setUserId(userId);
						dimg.setImgRenamePath(imgRenamePath);
						dimg.setImgMainYn("Y");
						dimg.setImgPath( reloadFile[i].getOriginalFilename());
							if(menuName.contains("Y")) {
								dimg.setMenuName("마이일기");
							}else {
								dimg.setMenuName("마이일기");
							}
						imgupdate.put("imgRenamePath", imgRenamePath);
						imgupdate.put("opendiaryNo", folderNo);
						cService.updateMyDiaryImage(imgupdate);
					} else {
						dimg.setUserId(userId);
						dimg.setImgRenamePath(imgRenamePath);
						dimg.setImgMainYn("N");
						dimg.setImgPath(reloadFile[i].getOriginalFilename());
							if(menuName.contains("Y")) {
								dimg.setMenuName("마이일기");
							}else {
								dimg.setMenuName("마이일기");
							}
					}
					dimgs.add(dimg);
				}
			}
		}
		for(int i = 0; i < dimgs.size(); i++) {
			reloadFiles.put("userId", userId);
			reloadFiles.put("imgMainYn", dimgs.get(i).getImgMainYn());
			reloadFiles.put("opendiaryNo", opendiary.getOpendiaryNo());
			reloadFiles.put("imgPath", dimgs.get(i).getImgPath());
			reloadFiles.put("imgRenamePath", dimgs.get(i).getImgRenamePath());
			if(menuName.contains("Y")) {
				reloadFiles.put("menuName", dimgs.get(i).getMenuName());
				System.out.println("equals:"+reloadFiles.get(menuName));
			}else {
				reloadFiles.put("menuName", dimgs.get(i).getMenuName());
			}
			System.out.println("reloadFiles :"+reloadFiles);
			pictureresult = cService.insertfileImgModify(reloadFiles); //diary_img 테이블에 img 넣기
		}
		if(diaryresult > 0 || pictureresult > 0) {
			mv.setViewName("redirect:myDiaryDetail.doa?opendiaryNo="+opendiary.getOpendiaryNo());
		}else {
			mv.addObject("msg", "수정 실패");
		}
		return mv;
	}
	
	//공유일기 수정할 때 파일 삭제 : DB데이터 삭제 -> DB 데이터 삭제 성공 시 저장된 img 파일 삭제 -> success 반
		@ResponseBody
		@RequestMapping(value="deleteDiaryFile.doa", method=RequestMethod.GET)
		public String deleteFile(@RequestParam("opendiaryNo") int opendiaryNo, 
								@RequestParam("imgRenamePath") String imgRenamePath,
								HttpServletRequest request, Model model) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("opendiaryNo", opendiaryNo);
			map.put("imgRenamePath", imgRenamePath);
			
			ArrayList<DiaryImg> dimgs = cService.mydiaryFileList(opendiaryNo);
			System.out.println("수정 파일 삭제 시 dimgs : "+dimgs);
			if(!dimgs.isEmpty()) {
				deleteDiaryFile(opendiaryNo, imgRenamePath, request);
			}
			int result = cService.deleteFile(map);
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		}
		//이클립스 내 첨부파일 삭제 
		public void deleteDiaryFile(int opendiaryNo, String imgRenamePath, HttpServletRequest request) {
			//파일 저장 saveFile 
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			int folderNo = opendiaryNo;
			//폴더 경로 생성 
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "//diaryUploadFiles//"+userId ;
			File file = new File(savePath +"//"+ imgRenamePath); //폴더 만들기
			if( file.exists()) {
				file.delete();
			}
		}
		//수정 시 대표 사진 수정
		@RequestMapping("updateDiaryMainImg.doa")
		public String updateMainImg(@RequestParam("opendiaryNo") int opendiaryNo) {
			int result = cService.updateMainImg(opendiaryNo);
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		}
	
	//마이일기 상세보기
	@RequestMapping(value="myDiaryDetail.doa", method = RequestMethod.GET)
	public ModelAndView myDiaryDetail(ModelAndView mv, int opendiaryNo) {
		Opendiary opendiary = cService.selectOneDiary(opendiaryNo);
		ArrayList<DiaryImg> dimgs = cService.mydiaryFileList(opendiaryNo);
		int dimgsCount = dimgs.size();
		if(opendiary != null) {
			System.out.println("con :" + dimgs);
			mv.addObject("opendiary", opendiary)
				.addObject("diaryImg", dimgs)
				.addObject("dimgsCount", dimgsCount)
				.setViewName("calendar/diaryDetail");
			} else {
				mv.addObject("msg", "게시글 상세조회 실패");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
}
