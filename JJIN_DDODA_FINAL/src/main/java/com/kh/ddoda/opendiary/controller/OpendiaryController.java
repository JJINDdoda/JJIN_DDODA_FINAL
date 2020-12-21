package com.kh.ddoda.opendiary.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.member.domain.Member;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.opendiary.service.OpendiaryService;

@Controller
public class OpendiaryController {

	@Autowired
	private OpendiaryService odService;
	
	//공유일기 전체리스트 조회 
	@RequestMapping("opendiaryList.doa")
	public ModelAndView openList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page: 1;
		int listCount = odService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Opendiary> opendiaryList = odService.opendList(pi);
		if( !opendiaryList.isEmpty()) {
			mv.addObject("opendiaryList", opendiaryList);
			mv.addObject("pi", pi);
			mv.setViewName("opendiary/opendiaryList");
		} else {
			mv.addObject("opendiaryList", opendiaryList);
			mv.addObject("pi", pi);
//			System.out.println(mv.toString());
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
	public String opendiaryInsert(Opendiary opendiary, Model model, HttpServletRequest request, @RequestParam(name="fileImg", required=false) MultipartFile[] fileImgs) throws Exception{
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		System.out.println(opendiary.toString());
		//사진객체를 Array에다가 넣는다.
		ArrayList<DiaryImg> dimgs = new ArrayList<DiaryImg>();
		HashMap<String, String> parameters = new HashMap<String, String>();
		DiaryImg dimg = null;
//		String [] imgRenamePath = new String[fileImgs.length];
		String imgRenamePath = null;
		String path = null;
		//int result = 0;
		for(int i = 0 ; i < fileImgs.length ; i ++) {
			if ( !fileImgs[i].getOriginalFilename().equals("")) {
				dimg = new DiaryImg();
				imgRenamePath = saveFile( request, fileImgs[i], session, i);
				dimg.setUserId(userId);
				dimg.setImgRenamePath(imgRenamePath);
				dimg.setImgPath(fileImgs[i].getOriginalFilename());
				//이미지 객체?리스트에 넣어준다.
				dimgs.add(dimg);
				//parameters.put("opendiary", opendiary);
				//parameters.put("diaryImg", dimg);
				//result = odService.insertOpend(parameters);
				
			}
		}
		//System.out.println(userId +", " + imgRenamePath);
		int diaryresult = 0;
		int pictureresult = 0;
		diaryresult = odService.insertDiary(opendiary);
		session.setAttribute("opendiaryNo", opendiary.getOpendiaryNo());
		System.out.println(opendiary.getOpendiaryNo());
		for(int i = 0; i < dimgs.size(); i++) {
			parameters.put("userId", userId);
			parameters.put("imgPath", dimg.getImgPath());
			parameters.put("imgRenamePath", dimg.getImgRenamePath());
			System.out.println(parameters);
			pictureresult = odService.insertfileImg(parameters);
			
		}
		
		if(diaryresult > 0 && pictureresult > 0) {
			path = "redirect:opendiaryList.doa";
		}else {
			model.addAttribute("msg", "공지사항 등록 실패!");
			path = "common/errorPage";
		}
		return path;
	}
	
	public String saveFile(HttpServletRequest request, @RequestParam(name="fileImg", required= false) MultipartFile fileImg, HttpSession session, int i) {
		//파일 저장 saveFile 
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
//		int opendiaryNo = opendiary.getOpendiaryNo();
		
		//폴더 경로 생성 
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//opendiaryUploadFiles//"+userId ;
		File folder = new File(savePath);
		if( ! folder.exists()) {
			folder.mkdirs();
		}
		//이미지 파일 명 생성 
		
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
}
