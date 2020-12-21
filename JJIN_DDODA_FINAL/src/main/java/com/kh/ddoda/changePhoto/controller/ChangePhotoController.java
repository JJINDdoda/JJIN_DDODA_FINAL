package com.kh.ddoda.changePhoto.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.changePhoto.domain.ChangePhoto;
import com.kh.ddoda.changePhoto.service.ChangePhotoService;
import com.kh.ddoda.member.domain.Member;


@Controller
public class ChangePhotoController {

	@Autowired
	private ChangePhotoService cpService;

	// 변화사진 작성 폼
	@RequestMapping(value="previewTest.doa", method=RequestMethod.GET)
	public String previewTest() {
		return "changePhoto/previewTest";
	}
	// 변화사진 작성 폼
	@RequestMapping(value="changePhotoWriterForm.doa", method=RequestMethod.GET)
	public String changePhotoWriterForm() {
		return "changePhoto/changePhotoWriterForm";
	}
	// 파일 여러개 등록 

	@RequestMapping(value="addMultiFile.doa", method=RequestMethod.POST)
	public String addFiles(ChangePhoto changePhoto, 
			MultipartHttpServletRequest request, @RequestParam("uploadFile") MultipartFile[]file )throws Exception{

		System.out.println("addFiles() 진입");
		//파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\changePhotoUploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}

		String fileOriginName = "";
		String fileMultiName="";
		String renameMultiName="";


		for (int i=0; i<file.length; i++) {
			fileOriginName = file[i].getOriginalFilename();
			System.out.println("기존 파일명 : " + fileOriginName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss");
			String originalFileName = file[i].getOriginalFilename();
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i + "."
					+originalFileName.substring(originalFileName.lastIndexOf(".")+1);


			System.out.println("변경된 파일명: " + fileOriginName);

			File f = new File(savePath + "\\"+ fileOriginName);
			file[i].transferTo(f);

			if(i==0) {
				fileMultiName += fileOriginName;
				renameMultiName += renameFileName;

			}else {
				fileMultiName += "," + fileOriginName;
				renameMultiName += "," + renameFileName;
			}
			System.out.println("*"+fileMultiName);
			System.out.println("*"+renameMultiName);
			changePhoto.setOriginalFileName(fileMultiName);
			changePhoto.setRenameFileName(renameMultiName);
		}
		System.out.println(changePhoto.toString());
		cpService.registerChangePhoto(changePhoto);
		ChangePhoto photoOne = cpService.selectChangePhoto(changePhoto);
		System.out.println(photoOne);
		return "redirect:changePhotoDetail.doa?myChangeNo=" + photoOne.getMyChangeNo();
	}


	@RequestMapping(value="changePhotoList.doa", method=RequestMethod.GET)
	public ModelAndView changePhotoList(ModelAndView mv, HttpSession session) {
		//		int currentPage=(page!=null)? page:1;
		//		int listCount = cpService.getListCount();
		//		
		//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		Member member = (Member)session.getAttribute("loginUser");
		String userId = member.getUserId();

		ArrayList<ChangePhoto> cList = cpService.selectList(userId);
		System.out.println(cList.toString());

		if(!cList.isEmpty()) {
			mv.addObject("cList", cList);
			//mv.addObject("pi", pi);
			mv.setViewName("changePhoto/changePhotoListView");
		}else {
			mv.addObject("msg", "게시글 전체 조회 실패!");
			mv.setViewName("common/errorPage");
		}

		return mv;

	}
	// 변화사진 상세보기
	@RequestMapping(value="changePhotoDetail.doa", method=RequestMethod.GET)
	public ModelAndView changePhotoDetail(ModelAndView mv, int myChangeNo, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String userId = member.getUserId();



		ChangePhoto changePhoto = cpService.selectChangePhoto(myChangeNo);

		System.out.println(changePhoto);

		if(changePhoto !=null && userId.equals(changePhoto.getUserId())) {

			mv.addObject("changePhoto", changePhoto).setViewName("changePhoto/changePhotoDetailView");
		}else {
			mv.addObject("msg", "변화사진 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 변화사진 업데이트 작성폼

	@RequestMapping(value="changePhotoUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView changePhotoUpdateView(ModelAndView mv, @RequestParam("myChangeNo")int myChangeNo) {

		mv.addObject("changePhoto", cpService.selectChangePhoto(myChangeNo)).setViewName("changePhoto/changePhotoUpdate");
		System.out.println(cpService.selectChangePhoto(myChangeNo));
		return mv;
	}
	// 변화사진 업데이트 전송
	@RequestMapping(value="changePhotoUpdate.doa", method=RequestMethod.POST)
	public ModelAndView changePhotoUpdate(ModelAndView mv, ChangePhoto changePhoto, HttpServletRequest request,
			@RequestParam(value="reloadFile", required=false) MultipartFile [] reloadFile) throws Exception{
		
		System.out.println("changePhotoUpdate() 진입");
		if(reloadFile != null && reloadFile.length !=0) {

			if(changePhoto.getOriginalFileName()!=null) {
				deleteFile(changePhoto.getRenameFileName(),request);
			}

			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\changePhotoUploadFiles";
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}

			//		String uploadPath=request.getRealPath("/resources/changePhotoUploadFiles");
			String fileOriginName = "";
			String fileMultiName="";
			String renameMultiName="";


			for (int i=0; i<reloadFile.length; i++) {
				fileOriginName = reloadFile[i].getOriginalFilename();
				System.out.println("기존 파일명 : " + fileOriginName);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss");
				String originalFileName = reloadFile[i].getOriginalFilename();
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
						+originalFileName.substring(originalFileName.lastIndexOf(".")+1);


				System.out.println("변경된 파일명: " + fileOriginName);

				File f = new File(savePath + "\\"+ fileOriginName);
				reloadFile[i].transferTo(f);

				if(i==0) {
					fileMultiName += fileOriginName;
					renameMultiName += renameFileName;

				}else {
					fileMultiName += "," + fileOriginName;
					renameMultiName += "," + renameFileName;
				}
				System.out.println("*"+fileMultiName);
				changePhoto.setOriginalFileName(fileMultiName);
				changePhoto.setRenameFileName(renameMultiName);


			}
		}



		int result=cpService.modifyChangePhoto(changePhoto);
		System.out.println(changePhoto.toString());
		if(result>0) {
			mv.setViewName("redirect:changePhotoList.doa");
		}else {
			mv.addObject("msg", "변화사진 수정 실패!").setViewName("common/errorPage");
		}
		return mv;
	}


	// 변화사진 수정에서 파일 비우기 버튼
	@RequestMapping(value="emptyFile.doa", method=RequestMethod.GET)
	public ModelAndView changePhotoEmpty(ModelAndView mv, ChangePhoto changePhoto, HttpServletRequest request ) {
		System.out.println("ChangePhotoController.changePhotoEmpty() param==>" + changePhoto.toString());
		//파일삭제
		ChangePhoto changePhoto2 = cpService.selectChangePhoto(changePhoto.getMyChangeNo());
		String originalList = changePhoto2.getOriginalFileName();
		System.out.println("ChangePhotoController.changePhotoEmpty() renameList==>" + originalList.toString());
		int result = cpService.emptyFile(changePhoto);

		if(result>0) {
			deleteFile(originalList ,request);
			System.out.println();
			ChangePhoto changePhotoEmpty = cpService.selectChangePhoto(changePhoto.getMyChangeNo());
			System.out.println(changePhoto.toString());
			mv.addObject("changePhoto", changePhotoEmpty).setViewName("changePhoto/changePhotoUpdate");
		}
		return mv;
	}

	// 변화사진 삭제
	@RequestMapping(value="changePhotoDelete.doa", method=RequestMethod.GET)
	public String changePhotoDelete(@RequestParam(value="myChangeNo")int myChangeNo, HttpServletRequest request, Model model) {
		//파일삭제
		ChangePhoto changePhoto = cpService.selectChangePhoto(myChangeNo);

		if(changePhoto.getOriginalFileName()!=null) {
			deleteFile(changePhoto.getOriginalFileName(), request);
		}

		//DB 삭제
		int result= cpService.deleteChangePhoto(myChangeNo);
		if(result>0) {
			model.addAttribute("msg", "삭제성공!!");
			return "redirect:changePhotoList.doa";
		}else {
			model.addAttribute("msg", "게시글 삭제 실패..");
			return "common/errorPage";
		}

	}
	// 변화사진 파일 삭제
	public void deleteFile(String allFileName, HttpServletRequest request) {

		System.out.println("allFileName==>"+allFileName);
		//"a,b,c"
		String[] fileNameArray = allFileName.split(",");
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root +"\\changePhotoUploadFiles";

		for(int i=0 ; i<fileNameArray.length ; i++) {
			// 삭제할 경로를 통한 파일 객체 생성
			String temp = savePath + "\\"+fileNameArray[i];
			System.out.println("삭제할 경로:" + temp);
			File file = new File(temp);

			// 해당 파일이 존재할 경우 삭제
			if(file.exists()) {
				System.out.println("파일이존재합니다.");
				if(file.delete()) {
					System.out.println("파일 삭제 성공.");
				}
			}
			
		}

	}
	// 공개 비공개 버튼 
	@RequestMapping(value="changePhotoPublic.doa", method=RequestMethod.GET)
	public ModelAndView changePhotoPublic(ModelAndView mv, HttpServletRequest request, ChangePhoto changePhoto) {
		int result = cpService.changePublicCode(changePhoto);

		if(result>0) {
			ChangePhoto changePhotoOne = cpService.selectChangePhoto(changePhoto.getMyChangeNo());
			System.out.println(changePhoto.toString());
			mv.addObject("changePhoto", changePhotoOne).setViewName("changePhoto/changePhotoeDetailView");
		}
		return mv;
	}


}
