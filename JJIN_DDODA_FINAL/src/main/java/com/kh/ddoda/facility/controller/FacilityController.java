package com.kh.ddoda.facility.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.facility.domain.ExerciseFacility;
import com.kh.ddoda.facility.domain.FacilityPicture;
import com.kh.ddoda.facility.domain.FacilityPrice;
import com.kh.ddoda.facility.domain.InstructorInfo;
import com.kh.ddoda.facility.service.FacilityService;
import com.kh.ddoda.member.domain.Member;

@Controller
public class FacilityController {
	
	@Autowired
	private FacilityService fService;
	
	public FacilityController() {
		
	}
	
	//시설찾기 페이지 띄우기
	@RequestMapping(value = "facilityListView.doa", method = RequestMethod.GET)
	public String facilityListView(Model model, String city) {
		model.addAttribute("city", "null");//처음 시는 none
		model.addAttribute("kinds", "null"); //현재 선택한 시설종류 //none
		model.addAttribute("beforekinds", "none"); //선택한 시설종류 전송
		model.addAttribute("beforeCity", "none");
		model.addAttribute("county", "null");
		return "facility/facilityListView";
	}
	
	
	
//	public ArrayList<MapLocation> locationList(){
//		ArrayList<MapLocation> mapLocation = fService.locationList();
//		for (int i = 0; i < mapLocation.size(); i++) {
//			System.out.println(mapLocation.get(i).getCounty());
//		}
//		
//		return mapLocation; // city, county를 리스트로
//	}
	
	//시설 상세조회
	@RequestMapping(value = "facilityDetail.doa", method = RequestMethod.GET)
	public String facilityInfoView(int facilityNo, HttpServletRequest request, Model model) {
		
		ExerciseFacility facilityInfo = fService.facilityInfo(facilityNo);
		ArrayList<FacilityPicture> facilityPicture = fService.facilityPicture(facilityNo);
		ArrayList<FacilityPrice> facilityPrice = fService.facilityPriceInfo(facilityNo);
		ArrayList<InstructorInfo> instructorInfo = fService.instructorInfo(facilityNo);
		
		model.addAttribute("facilityPicture", facilityPicture);
		model.addAttribute("facilityInfo", facilityInfo);
		model.addAttribute("facilityPrice", facilityPrice);
		model.addAttribute("instructorInfo", instructorInfo);
		return "facility/facilityInfoView";
	}
	
	@RequestMapping(value = "markerList.doa", method = RequestMethod.GET)
	public void markerList(HttpServletResponse response, String city, String county, String kinds) throws Exception{
		HashMap<String, String> facilityInfo = new HashMap<String, String>();
		//city.substring(0, 1);
		//System.out.println(city.substring(0, 2));
		System.out.println(city);
		facilityInfo.put("city", city.substring(0, 2));
		facilityInfo.put("kinds", kinds);
		facilityInfo.put("county", county);
		ArrayList<ExerciseFacility> fList = fService.markerCountyList(facilityInfo);
		System.out.println("CCC"+city + ", " + kinds + ", " + county);
		Gson gson = new GsonBuilder().create();
		gson.toJson(fList, response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping(value = "markerPoints.doa", method = RequestMethod.GET)
	public String markerPoints(String city, String county, String kinds) { // HttpServletResponse response,
		HashMap<String, String> facilityInfo = new HashMap<String, String>();
		//System.out.println(city);
		facilityInfo.put("city", city.substring(0, 2));
		facilityInfo.put("kinds", kinds);
		facilityInfo.put("county", county);
		String markers = "";
		System.out.println(city + ", " + kinds + ", " + county);
		ArrayList<String> markerList = fService.markerPoints(facilityInfo);
		for(int i = 0; i < markerList.size(); i++) {
			if(i == (markerList.size()-1)) {
				markers += "new kakao.maps.LatLng(" + markerList.get(i) + ")";
			}
			else {
				markers += "new kakao.maps.LatLng(" + markerList.get(i) + "),";
			}
		}
		System.out.println(markers);
		return markers;
	}
	
	@ResponseBody
	@RequestMapping(value = "contentList.doa", method = RequestMethod.GET)
	public String contentList(String city, String county, String kinds) {
		HashMap<String, String> facilityInfo = new HashMap<String, String>();
		//System.out.println(city);
		facilityInfo.put("city", city.substring(0, 2));
		facilityInfo.put("kinds", kinds);
		facilityInfo.put("county", county);
		String content = "";
		System.out.println(city + ", " + kinds + ", " + county);
		//{content: '<div>카카오</div>'}
		//ArrayList<String> contentList = fService.contentList(facilityInfo);
		ArrayList<ExerciseFacility> contentList = fService.markerCountyList(facilityInfo);
		ArrayList<String> facilityPictures = new ArrayList<String>();
		for (int i = 0; i < contentList.size(); i++) {
			System.out.println(contentList.get(i).getFacilityNo());
			String firstPicture = fService.facilityPictureRename(contentList.get(i).getFacilityNo());
			facilityPictures.add(firstPicture);
		}
		
		for (int i = 0; i < contentList.size(); i++) {
			System.out.println(facilityPictures.get(i));
		}
		
		//"<a href='facilityDetail.doa?facilityNo=" + data[i].facilityNo+"'>홈페이지</a>"
		for (int i = 0; i < contentList.size(); i++) {
			if(i == (contentList.size()-1)) {
//				content += "{content: '<div" + " class = \"contents\"" + ">" 
//						+ contentList.get(i).getFacilityName() 
//						+"<br><a href=\"facilityDetail.doa?facilityNo=" + contentList.get(i).getFacilityNo()+"\">홈페이지</a>"
//						+ "</div>'}";
				content += "{content: '<div class=\"contents\">" + 
						"<div class=\"info\">" + 
						"<div class=\"title\">" + 
						contentList.get(i).getFacilityName() + 
						"<div class=\"close\" onclick=\"closeOverlay()\" title=\"닫기\"></div>" + 
						"</div>" + 
						"<div class=\"body\">" + 
						"<div class=\"img\">" + 
						"<img src=" + "\"resources/facilityFiles/facilityPicture/" + facilityPictures.get(i) + "\"width=\"73\" height=\"70\">" + 
						"</div>" + 
						"<div class=\"desc\">" + 
						"<div class=\"ellipsis\">" + contentList.get(i).getFacilityAddr() + "</div>" + 
						"<div><a href=\"facilityDetail.doa?facilityNo=" + contentList.get(i).getFacilityNo()+"\">홈페이지</a></div>" + 
						"</div>" + 
						"</div>" + 
						"</div>" + 
						"</div>'}";
			}
			else {
//				content += "{content: '<div" + " class = \"contents\"" + ">" 
//						+ contentList.get(i).getFacilityName() 
//						+"<br><a href=\"facilityDetail.doa?facilityNo=" + contentList.get(i).getFacilityNo()+"\">홈페이지</a>"
//						+ "</div>'},";
				content += "{content: '<div class=\"contents\">" + 
						"<div class=\"info\">" + 
						"<div class=\"title\">" + 
						contentList.get(i).getFacilityName() + 
						"<div class=\"close\" onclick=\"closeOverlay()\" title=\"닫기\"></div>" + 
						"</div>" + 
						"<div class=\"body\">" + 
						"<div class=\"img\">" + 
						"<img src=" + "\"resources/facilityFiles/facilityPicture/" + facilityPictures.get(i) + "\"width=\"73\" height=\"70\">" + 
						"</div>" + 
						"<div class=\"desc\">" + 
						"<div class=\"ellipsis\">" + contentList.get(i).getFacilityAddr() + "</div>" + 
						"<div><a href=\"facilityDetail.doa?facilityNo=" + contentList.get(i).getFacilityNo()+"\">홈페이지</a></div>" + 
						"</div>" + 
						"</div>" + 
						"</div>" + 
						"</div>'},";
			}
		}
		System.out.println(content);
		
		return content;
	}
	
	@RequestMapping(value = "markerCountList.doa", method = RequestMethod.GET)
	public String markerCountyList(String city, String kinds, String beforekinds, String county, Model model) {
		String markers = markerPoints(city, county, kinds);
		String content = contentList(city, county, kinds);
		model.addAttribute("content", content);
		model.addAttribute("markerAllList", markers);
		model.addAttribute("city", city.substring(0, 2)); //어느시를 선택했었는지 전송
		model.addAttribute("beforekinds", kinds); // 선택한 시설종류 전송
		model.addAttribute("beforeCity", city);
		model.addAttribute("county", county);
		model.addAttribute("kinds", kinds);
		System.out.println(markers);
		return "facility/facilityListView";
	}
	
	
	//시설등록하기 페이지
	@RequestMapping(value = "facilityInfoRegistView.doa", method = RequestMethod.GET)
	public String facilityInfoRegistView() {
		return "facility/facilityInfoRegist";
	}
	
	//시설등록요청
	@RequestMapping(value = "facilityRegistration.doa", method = RequestMethod.POST)
	public String facilityRegistration(HttpServletRequest request, @RequestParam(name="picturePath", required=false) MultipartFile[] picturePath, ExerciseFacility facility, HttpSession session, @RequestParam(name="addr") String addr, @RequestParam(name="detailAddr") String detailAddr) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//사진테이블 정보를 Array에다가 넣는다.
		ArrayList<FacilityPicture> facilityPictures = new ArrayList<FacilityPicture>();
		FacilityPicture facilityPicture = null;
		String[] renamePathName = new String[picturePath.length];
		saveFacilityFile(picturePath, request);
		for (int i = 0; i < picturePath.length; i++) {
			if(!picturePath[i].getOriginalFilename().equals("")) {
				facilityPicture = new FacilityPicture();
				renamePathName[i] = saveFacilityFile(picturePath, request)[i];
				facilityPicture.setPicturePath(picturePath[i].getOriginalFilename());
				facilityPicture.setPictureRename(renamePathName[i]);
				facilityPictures.add(facilityPicture);
			}
		}
		
		for (int i = 0; i < facilityPictures.size(); i++) {
			System.out.println(facilityPictures.get(i).toString());
		}
		
//		System.out.println(picture);
//		System.out.println(pictureRename);
		//적은 내용은 시설정보테이블
		int facilityResult = 0;
		int pictureResult = 0;
		String path = null;
		String userId = loginUser.getUserId(); // 로그인한 사용자 아이디 받아오기
		String facilityAddr = addr + ", " + detailAddr;
		facility.setFacilityAddr(facilityAddr);
		facility.setUserId(userId);
		System.out.println(userId);
		System.out.println(facility.toString());
		facilityResult = fService.facilityRegistration(facility);
		
		for (int i = 0; i < facilityPictures.size(); i++) {
			//리스트에 담긴 정보를 가지고온다.
			FacilityPicture fpicture = facilityPictures.get(i);
			//hashMap을 만들어
			HashMap<String, String> fHash = new HashMap<String, String>();
			fHash.put("picturePath", fpicture.getPicturePath());
			fHash.put("pictureRename", fpicture.getPictureRename());
			pictureResult = fService.facilityPictureRegist(fHash);
		}
		if(facilityResult > 0 && pictureResult > 0) {
			path = "facility/facilityPriceRegist";
		}
		else {
			
		}
		

		return path;
	}
	
	public String[] saveFacilityFile(@RequestParam(name="picturePath", required=false) MultipartFile[] picturePath, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\facilityFiles\\facilityPicture";
	
		File folder = new File(savePath);
	
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		//이름 재설정
		String[] pictureRename = new String[picturePath.length];
		String[] filePath = new String[picturePath.length];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		for (int i = 0; i < picturePath.length; i++) {
			//원래 파일이름
			String originPath = picturePath[i].getOriginalFilename();
			pictureRename[i] = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "_" + i + "." + originPath.substring(originPath.lastIndexOf(".")+1);
			filePath[i] = folder + "\\" + pictureRename[i];
		}
		for (int j = 0; j < pictureRename.length; j++) {
			try {
				picturePath[j].transferTo(new File(filePath[j]));
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return pictureRename;
	}
	
	//시설가격등록 페이지 -> 지우기
//	@RequestMapping(value = "facilityPriceRegistView.doa", method = RequestMethod.GET)
//	public String facilityPriceRegistView() {
//		return "facility/facilityPriceRegist";
//	}
	
	//시설가격등록 요청
	@RequestMapping(value = "facilityPriceRegist.doa", method = RequestMethod.POST)
	public String facilityPriceRegist(HttpServletRequest request, String termsOfUse) {
		String[] monthArr = request.getParameterValues("months");
		String[] priceArr = request.getParameterValues("price");	
		String[] optionsArr = request.getParameterValues("options");
		String[] benefitsArr = request.getParameterValues("benefits");

		int resultPrice = 0;
		//int resultTerms = 0;
		for (int i = 0; i < benefitsArr.length; i++) {
			FacilityPrice facilityPrice = new FacilityPrice();
			facilityPrice.setMonths(Integer.parseInt(monthArr[i]));
			facilityPrice.setPrice(Integer.parseInt(priceArr[i]));
			facilityPrice.setOptions(optionsArr[i]);
			facilityPrice.setBenefits(benefitsArr[i]);
			resultPrice = fService.facilityPriceRegist(facilityPrice);
		}
		//resultTerms = fService.facilityTerms(termsOfUse);
		if(resultPrice > 0) {
			return "facility/facilityInstructorRegist";
		}
		else {
			return "facility/facilityInstructorRegist";
		}
	}
	
	//강사등록페이지 -> 지우기
//	@RequestMapping(value = "facilityInstructorRegistView.doa", method = RequestMethod.GET)
//	public String facilityInstructorRegistView() {
//		return "facility/facilityInstructorRegist";
//	}
	
	//강사등록 요청
	@RequestMapping(value = "facilityInstructorRegist.doa", method = RequestMethod.POST)
	public String facilityInstructorRegist(HttpServletRequest request, @RequestParam(name="instructorPicture", required=false) MultipartFile[] instructorPicture) {
		String[] instructorNameArr = request.getParameterValues("instructorName");
		String[] carrerArr = request.getParameterValues("carrer");
		String[] promiseArr = request.getParameterValues("promise");
//		for (int i = 0; i < promiseArr.length; i++) {
//			System.out.println(instructorNameArr[i]);
//			System.out.println(carrerArr[i]);
//			System.out.println(promiseArr[i]);
//		}
		String[] instructorRename = new String[instructorPicture.length];
		saveInstructorFile(instructorPicture, request);
		int result = 0;
		System.out.println(instructorPicture.length);
		InstructorInfo instructorInfo = null;
		for (int i = 0; i < instructorPicture.length; i++) {
			if(!instructorPicture[i].getOriginalFilename().equals("")) {
				instructorInfo = new InstructorInfo();
				instructorRename[i] = saveInstructorFile(instructorPicture, request)[i];
				instructorInfo.setInstructorName(instructorNameArr[i]);
				instructorInfo.setCarrer(carrerArr[i]);
				instructorInfo.setPromise(promiseArr[i]);
				instructorInfo.setInstructorPicture(instructorPicture[i].getOriginalFilename());
				instructorInfo.setInstructorRename(instructorRename[i]);
				System.out.println(instructorInfo.toString());
				result = fService.instructorRegist(instructorInfo);
				
			}
		}
		//result = fService.instructorRegist(instructorInfo);
		if(result > 0) {
			return "redirect:myfacilityList.doa";
		}
		else {
			return "redirect:myfacilityList.doa";
		}
		
	}
	
	public String[] saveInstructorFile(@RequestParam(name="instructorPicture", required = false) MultipartFile[] instructorPicture, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\facilityFiles\\instructorPicture";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String[] instructorRename = new String[instructorPicture.length];
		String[] filePath = new String[instructorPicture.length];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		for (int i = 0; i < instructorPicture.length; i++) {
			String originPath = instructorPicture[i].getOriginalFilename();
			instructorRename[i] = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "_" + i + "." + originPath.substring(originPath.lastIndexOf(".")+1);
			filePath[i] = folder + "\\" + instructorRename[i];
		}
		for (int i = 0; i < instructorPicture.length; i++) {
			try {
				instructorPicture[i].transferTo(new File(filePath[i]));
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return instructorRename;
	}
	
	//내 시설정보 리스트
	@RequestMapping(value = "myfacilityList.doa", method = RequestMethod.GET)
	public String myFacilityListView(HttpSession session, HttpServletRequest request, Model model, @RequestParam(value="page", required = false) Integer page) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		System.out.println(userId);
		
		
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getMyFacilityListCount(userId);
		//int listCount = exerciseFacility.size();
		System.out.println(currentPage);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<ExerciseFacility> exerciseFacility = fService.FacilityList(pi, userId);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("exerciseFacility", exerciseFacility);
		
		return "facility/myFacilityList";
	}
	
	//시설정보 수정 페이지
	@RequestMapping(value = "facilityInfoModifyView.doa", method = RequestMethod.GET)
	public String facilityInfoModifyView(HttpServletRequest requuest, Model model, int facilityNo) {
		//정보 가져오기
		//1. 시설 정보
		ExerciseFacility exerciseFacility = fService.facilityInfo(facilityNo);
		//2. 시설 사진 정보
		ArrayList<FacilityPicture> facilityPicture = fService.facilityPicture(facilityNo);
		
		model.addAttribute("exerciseFaciliy", exerciseFacility);
		model.addAttribute("facilityPicture", facilityPicture);
		model.addAttribute("pictureNum", facilityPicture.size());
		model.addAttribute("facilityNo", facilityNo);
		return "facility/facilityInfoModify";
	}
	
	//파일 삭제 -> 삭제버튼 누른 파일들
	@RequestMapping(value = "deleteSelectFile.doa", method = RequestMethod.GET)
	public void deleteSelectFile(HttpServletRequest request) {
		String[] pictureFiles = request.getParameterValues("pictureFiles");
		
		//System.out.println(pictureFiles.length);
		File file;
		if(pictureFiles != null) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\facilityFiles\\facilityPicture";
			for (int i = 0; i < pictureFiles.length; i++) {
				file = new File(savePath + "\\" + pictureFiles[i]);
				String pictureRename = pictureFiles[i];
				if(file.exists()) {
					fService.deleteFacilityPictureOne(pictureRename);
					file.delete();
				}
			}
		}
	}
	
	//시설정보 수정하기
	@RequestMapping(value = "facilityModify.doa", method = RequestMethod.POST)
	public String facilityInfoModify(Model model, HttpServletRequest request, @RequestParam(name="picturePath", required=false) MultipartFile[] picturePath, ExerciseFacility facility, HttpSession session, @RequestParam(name="addr") String addr, @RequestParam(name="detailAddr") String detailAddr, String facilityNo) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		System.out.println("시설정보 : " + facility.toString());
		
		int facilityResult = 0;
		int pictureResult = 0;
		String path = null;
		String userId = loginUser.getUserId(); // 로그인한 사용자 아이디 받아오기
		String facilityAddr = addr + ", " + detailAddr;
		facility.setFacilityAddr(facilityAddr);
		facility.setUserId(userId);
		int facilityNumber = Integer.parseInt(facilityNo);
		
		ArrayList<FacilityPicture> facilityPictures = null;
		if(picturePath.length != 0 && picturePath != null) {
			//사진테이블 정보를 Array에다가 넣는다.
			facilityPictures = new ArrayList<FacilityPicture>();
			FacilityPicture facilityPicture = null;
			String[] renamePathName = new String[picturePath.length];
			saveFacilityFile(picturePath, request);
			for (int i = 0; i < picturePath.length; i++) {
				if(!picturePath[i].getOriginalFilename().equals("")) {
					facilityPicture = new FacilityPicture();
					renamePathName[i] = saveFacilityFile(picturePath, request)[i];
					facilityPicture.setPicturePath(picturePath[i].getOriginalFilename());
					facilityPicture.setPictureRename(renamePathName[i]);
					facilityPictures.add(facilityPicture);
				}
			}
			for (int i = 0; i < facilityPictures.size(); i++) {
				System.out.println(facilityPictures.get(i).toString());
			}
			
			for (int i = 0; i < facilityPictures.size(); i++) {
				//리스트에 담긴 정보를 가지고온다.
				FacilityPicture fpicture = facilityPictures.get(i);
				FacilityPicture facilityfile = new FacilityPicture();
				facilityfile.setFacilityNo(facilityNumber);
				facilityfile.setPicturePath(fpicture.getPicturePath());
				facilityfile.setPictureRename(fpicture.getPictureRename());
				pictureResult = fService.updateFacilityPicture(facilityfile);
			}
		}
		
		facilityResult = fService.updateFacilityInfo(facility);
		
		System.out.println(facilityResult);
		System.out.println(pictureResult);
		
		if(facilityResult > 0 || pictureResult > 0) {
			ArrayList<FacilityPrice> facilityPriceInfo = fService.facilityPriceInfo(facilityNumber);
			model.addAttribute("priceNum", facilityPriceInfo.size());
			model.addAttribute("facilityPriceInfo", facilityPriceInfo);
			model.addAttribute("facilityNo", facilityNo);
			path = "facility/facilityPriceModify";
		}
		else {
			
		}
		return path;
	}
	
	//삭제누른 가격들
//	@RequestMapping(value = "deletePriceSubmit.doa", method = RequestMethod.GET)
//	public void deletePriceSubmit(HttpServletRequest request) {
//		String[] deleteMonth = request.getParameterValues("monthArr");
//		int facilityNo = Integer.parseInt(request.getParameter("facilityNo"));
//		for (int i = 0; i < deleteMonth.length; i++) {
//			HashMap<String, Integer> priceHash = new HashMap<String, Integer>();
//			priceHash.put("months", Integer.parseInt(deleteMonth[i]));
//			priceHash.put("facilityNo", facilityNo);
//			
//			fService.deletePriceSubmit(priceHash);
//		}
//	}
	
	//시설 가격 수정 하기페이지
	//시설 가격 삭제, 수정, 추가 세가지가 있어야함
	//시설가격 삭제는 위에서 진행(deletePriceSubmit)
	//시설가격 수정(변환된 
	//시설가격 추가
	//그냥 전부 다 삭제하고 다시 insert하기
	@RequestMapping(value = "facilityPriceModify.doa", method = RequestMethod.POST)
	public String facilityPriceInfoModify(int facilityNo, Model model, HttpServletRequest request) {
		String[] monthArr = request.getParameterValues("months");
		String[] priceArr = request.getParameterValues("price");	
		String[] optionsArr = request.getParameterValues("options");
		String[] benefitsArr = request.getParameterValues("benefits");
		
		int priceresult = 0;
		int deletePrices = 0;
		//가격정보 지우기
		
		deletePrices = fService.deletePrices(facilityNo);
		System.out.println("dd"+deletePrices);
		
		if(benefitsArr.length != 0) {
			//가격정보 넣기
			for (int i = 0; i < benefitsArr.length; i++) {
				FacilityPrice facilityPrice = new FacilityPrice();
				facilityPrice.setFacilityNo(facilityNo);
				facilityPrice.setMonths(Integer.parseInt(monthArr[i]));
				facilityPrice.setPrice(Integer.parseInt(priceArr[i]));
				facilityPrice.setOptions(optionsArr[i]);
				facilityPrice.setBenefits(benefitsArr[i]);
				priceresult = fService.facilityPriceModify(facilityPrice);
			}
		}
		
		
		ArrayList<InstructorInfo> instructorInfoList = fService.instructorInfo(facilityNo);
		model.addAttribute("instuctorNum", instructorInfoList.size());
		model.addAttribute("instructorInfo", instructorInfoList);
		model.addAttribute("facilityNo", facilityNo);
		return "facility/facilityInstructorModify";
		//model.addAttribute("facilityPrice", facilityPrice);
		
		
	}
	
	//강사 정보 수정하기 페이지
	@RequestMapping(value = "facilityInstructorModify.doa", method = RequestMethod.POST)
	public String instructorInfoModify(Model model, HttpServletRequest request,@RequestParam(name="instructorPicture", required=false) MultipartFile[] instructorPicture) {
		int facilityNo = Integer.parseInt(request.getParameter("facilityNo"));
		
//		String[] RenamePictures = request.getParameterValues("instructorRename");
//		File file;
//		if(RenamePictures != null) {
//			String root = request.getSession().getServletContext().getRealPath("resources");
//			String savePath = root + "\\facilityFiles\\instructorPicture";
//			for (int i = 0; i < RenamePictures.length; i++) {
//				file = new File(savePath + "\\" + RenamePictures[i]);
//				if(file.exists()) {
//					file.delete();
//				}
//			}
//		}
//		
//		fService.deleteFacilityInstructorOne(facilityNo);
		
		String[] instructorNameArr = request.getParameterValues("instructorName");
		String[] carrerArr = request.getParameterValues("carrer");
		String[] promiseArr = request.getParameterValues("promise");
		
		String[] instructorNameDBArr = request.getParameterValues("instructorNameDB");
		String[] carrerDBArr = request.getParameterValues("carrerDB");
		String[] promiseDBArr = request.getParameterValues("promiseDB");
		InstructorInfo upInstructorInfo = null;
		for (int i = 0; i < promiseDBArr.length; i++) {
			upInstructorInfo = new InstructorInfo();
			upInstructorInfo.setInstructorName(instructorNameDBArr[i]);
			upInstructorInfo.setCarrer(carrerDBArr[i]);
			upInstructorInfo.setPromise(promiseDBArr[i]);
			upInstructorInfo.setFacilityNo(facilityNo);
			fService.modifyFacilityInstructor(upInstructorInfo);
		}
		
		String[] instructorRename = new String[instructorPicture.length];
		saveInstructorFile(instructorPicture, request);
		int result = 0;
		InstructorInfo instructorInfo = null;
		for (int i = 0; i < instructorPicture.length; i++) {
			if(!instructorPicture[i].getOriginalFilename().equals("")) {
				instructorInfo = new InstructorInfo();
				instructorRename[i] = saveInstructorFile(instructorPicture, request)[i];
				instructorInfo.setInstructorName(instructorNameArr[i]);
				instructorInfo.setCarrer(carrerArr[i]);
				instructorInfo.setPromise(promiseArr[i]);
				instructorInfo.setInstructorPicture(instructorPicture[i].getOriginalFilename());
				instructorInfo.setInstructorRename(instructorRename[i]);
				instructorInfo.setFacilityNo(facilityNo);
				System.out.println(instructorInfo.toString());
				result = fService.updateFacilityInstructor(instructorInfo);
				
			}
		}
		if(result > 0) {
			return "redirect:myfacilityList.doa";
		}
		else {
			return "redirect:myfacilityList.doa";
		}
		
	}
	
	@RequestMapping(value = "instructorDeleteSubmit.doa", method = RequestMethod.GET)
	public void instructorDeleteSubmit(HttpServletRequest request) {
		String[] RenamePictures = request.getParameterValues("instructorRenameArr");
		File file;
		if(RenamePictures != null) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\facilityFiles\\instructorPicture";
			for (int i = 0; i < RenamePictures.length; i++) {
				System.out.println(RenamePictures[i]);
				file = new File(savePath + "\\" + RenamePictures[i]);
				String instructorRename = RenamePictures[i];
				if(file.exists()) {
					System.out.println(instructorRename);
					fService.deleteFacilityInstructorOne(instructorRename);
					file.delete();
				}
			}
		}
		
		
	}
	
	//시설삭제하기
	@ResponseBody
	@RequestMapping(value = "deleteMyFacility.doa", method = RequestMethod.GET)
	public int deleteMyFacility(HttpServletRequest request) {
		int facilityNo = Integer.parseInt(request.getParameter("facilityNo"));
		System.out.println(facilityNo);
		//시설사진 삭제
		//시설번호에 해당하는 시설사진 목록 가져오기
		ArrayList<FacilityPicture> faciltiyPciture = fService.facilityPicture(facilityNo);
		
		File file;
		if(faciltiyPciture != null) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\facilityFiles\\facilityPicture";
			for (int i = 0; i < faciltiyPciture.size(); i++) {
				String pictureRename = faciltiyPciture.get(i).getPictureRename();
				file = new File(savePath + "\\" + pictureRename);
				//System.out.println(pictureRename);
				if(file.exists()) {
					System.out.println(pictureRename);
					file.delete();
				}
			}
		}
		//강사 사진 삭제
		//시설 번호에 해당하는 강사사진 목록 가져오기
		ArrayList<InstructorInfo> instructorInfo = fService.instructorInfo(facilityNo);
		if(instructorInfo != null) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\facilityFiles\\instructorPicture";
			for (int i = 0; i < instructorInfo.size(); i++) {
				String instructorRename = instructorInfo.get(i).getInstructorRename();
				file = new File(savePath + "\\" + instructorRename);
				if(file.exists()) {
					System.out.println(instructorRename);
					file.delete();
				}
			}
		}
		
		
		
		int facilityResult = fService.deleteMyFacility(facilityNo);
		return facilityResult;
	}
	
	
	
	//관리자_시설관리페이지
	@RequestMapping(value = "adminFacilityManage.doa", method = RequestMethod.GET)
	public String adminFacilityManage(Model model, @RequestParam(value="page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getAllFacilityListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<ExerciseFacility> exerciseFacility = fService.allFacilityList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("exerciseFacility", exerciseFacility);
		model.addAttribute("termsYn", "D");
		model.addAttribute("userId", null);
		return "facility/adminFacilityManage";
	}
	
	//관리자_시설검색
	@RequestMapping(value = "termsYnSearch.doa", method = RequestMethod.GET)
	public String termsYnSearch(Model model, HttpServletRequest request, @RequestParam(value="page", required = false) Integer page) {
		String userId = request.getParameter("userId");
		String[] termsYnArr = request.getParameterValues("termsYn");
		HashMap<String, String> termsYnHash = new HashMap<String, String>();
		
//		for (int i = 0; i < termsYnArr.length; i++) {
//			System.out.println(termsYnArr[i]);
//		}
		
		if(userId != "" && userId != null) {
			termsYnHash.put("userId", userId);
			System.out.println("userId : " + userId);
		}
		else {
			termsYnHash.put("userId", "none");
			System.out.println("none");
		}
		
		if(termsYnArr.length == 1) {
			termsYnHash.put("termsYn", termsYnArr[0]);
		}
		else {//두개 다 선택했을 때
			termsYnHash.put("termsYn", "dup");
			System.out.println("dup");
		}
		
		//userId갸 none이면 usrId검색없음
		//termsYn이 dup이면  termsYn검색없음
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.termsYnSearchCount(termsYnHash);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ExerciseFacility> exerciseFacility = fService.termsYnSearch(pi, termsYnHash);
		if(termsYnArr.length == 1) {
			model.addAttribute("termsYn", termsYnArr[0]);
		}
		else {
			model.addAttribute("termsYn", "D");
		}
		model.addAttribute("userId", userId);
		model.addAttribute("pi", pi);
		model.addAttribute("exerciseFacility", exerciseFacility);
		return "facility/adminFacilityManage";
	}
	
	//관리자 시설 승인
	@RequestMapping(value = "approvedClick.doa", method = RequestMethod.GET)
	public String approvedClick(HttpServletRequest request, Model model, @RequestParam(value="page", required = false) Integer page) {
		int facilityNo = Integer.parseInt(request.getParameter("facilityNo"));
		System.out.println(facilityNo);
		int result = fService.approvedClick(facilityNo); // update먼
		if(result > 0) {
			return "redirect:adminFacilityManage.doa";
		}
		else {
			return "common/errorPage";
		}
		//userId, termsYn을 받아옴
		
		/*String userId = request.getParameter("userId");
		String[] termsYnArr = request.getParameterValues("termsYn");
		HashMap<String, String> termsYnHash = new HashMap<String, String>();
		if(userId != null) {
			termsYnHash.put("userId", userId);
			System.out.println("userId : " + userId);
		}
		else {
			termsYnHash.put("userId", "none");
			System.out.println("none");
		}
		
		if(termsYnArr.length == 1) {
			termsYnHash.put("termsYn", termsYnArr[0]);
		}
		else {//두개 다 선택했을 때
			termsYnHash.put("termsYn", "dup");
			System.out.println("dup");
		}
		
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.termsYnSearchCount(termsYnHash); // 페이지 갯수 구하기
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		//리스트 가져오기
		ArrayList<ExerciseFacility> exerciseFacility = fService.termsYnSearch(pi, termsYnHash);
		
		
		if(result > 0) {
			model.addAttribute("userId", userId);
			model.addAttribute("pi", pi);
			model.addAttribute("exerciseFacility", exerciseFacility);
			return "facility/adminFacilityManage";
		}
		else {
			return "common/errorPage";
		}*/
		
	}
	
	//관리자 시설 거절
	@RequestMapping(value = "rejectClick.doa", method = RequestMethod.GET)
	public String rejectClick(HttpServletRequest request, Model model, @RequestParam(value="page", required = false) Integer page) {
		int facilityNo = Integer.parseInt(request.getParameter("facilityNo"));
		System.out.println(facilityNo);
		int result = fService.rejectClick(facilityNo); // update먼저
		if(result > 0) {
			return "redirect:adminFacilityManage.doa";
		}
		else {
			return "common/errorPage";
		}
		
		//userId, termsYn을 받아옴
		
		/*String userId = request.getParameter("userId");
		String[] termsYnArr = request.getParameterValues("termsYn");
		HashMap<String, String> termsYnHash = new HashMap<String, String>();
		if(userId != null) {
			termsYnHash.put("userId", userId);
			System.out.println("userId : " + userId);
		}
		else {
			termsYnHash.put("userId", "none");
			System.out.println("none");
		}
		
		if(termsYnArr.length == 1) {
			termsYnHash.put("termsYn", termsYnArr[0]);
		}
		else {//두개 다 선택했을 때
			termsYnHash.put("termsYn", "dup");
			System.out.println("dup");
		}
		
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.termsYnSearchCount(termsYnHash); // 페이지 갯수 구하기
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		//리스트 가져오기
		ArrayList<ExerciseFacility> exerciseFacility = fService.termsYnSearch(pi, termsYnHash);
		
		
		if(result > 0) {
			model.addAttribute("userId", userId);
			model.addAttribute("pi", pi);
			model.addAttribute("exerciseFacility", exerciseFacility);
			return "facility/adminFacilityManage";
		}
		else {
			return "common/errorPage";
		}*/
	}
	
}
