package com.kh.ddoda.facility.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ddoda.facility.domain.ExerciseFacility;
import com.kh.ddoda.facility.domain.FacilityPicture;
import com.kh.ddoda.facility.domain.FacilityPrice;
import com.kh.ddoda.facility.domain.InstructorInfo;
import com.kh.ddoda.facility.domain.MapLocation;
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
	
	
	
	
	//시설 상세조회
	@RequestMapping(value = "facilityDetail.doa", method = RequestMethod.GET)
	public String facilityInfoView(int facilityNo, HttpServletRequest request, Model model) {
		
		ExerciseFacility facilityInfo = fService.facilityInfo(facilityNo);
		ArrayList<FacilityPicture> facilityPicture = fService.facilityPicture(facilityNo);
		
		model.addAttribute("facilityPicture", facilityPicture);
		model.addAttribute("facilityInfo", facilityInfo);
		return "facility/facilityInfoView";
	}
	
	@RequestMapping(value = "markerList.doa", method = RequestMethod.GET)
	public void markerList(HttpServletResponse response, String city, String county, String kinds) throws Exception{
		HashMap<String, String> facilityInfo = new HashMap<String, String>();
		//city.substring(0, 1);
		facilityInfo.put("city", city.substring(0, 1));
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
		facilityInfo.put("city", city.substring(0, 1));
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
	
	@RequestMapping(value = "markerCountList.doa", method = RequestMethod.GET)
	public String markerCountyList(String city, String kinds, String beforekinds, String county, Model model) {
		String markers = markerPoints(city, county, kinds);
		model.addAttribute("markerAllList", markers);
		model.addAttribute("city", city.substring(0, 1)); //어느시를 선택했었는지 전송
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
		String savePath = root + "\\facilityFiles\\faciltyPicture";
	
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
	@RequestMapping(value = "facilityPriceRegistView.doa", method = RequestMethod.GET)
	public String facilityPriceRegistView() {
		return "facility/facilityPriceRegist";
	}
	
	//시설가격등록 요청
	@RequestMapping(value = "facilityPriceRegist.doa", method = RequestMethod.POST)
	public String facilityPriceRegist(HttpServletRequest request, String termsOfUse) {
		String[] monthArr = request.getParameterValues("months");
		String[] priceArr = request.getParameterValues("price");	
		String[] optionsArr = request.getParameterValues("options");
		String[] benefitsArr = request.getParameterValues("benefits");
//		for (int i = 0; i < benefitsArr.length; i++) {
//			System.out.println(monthArr[i]);
//			System.out.println(priceArr[i]);
//			System.out.println(optionsArr[i]);
//			System.out.println(benefitsArr[i]);
//		}
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
	@RequestMapping(value = "facilityInstructorRegistView.doa", method = RequestMethod.GET)
	public String facilityInstructorRegistView() {
		return "facility/facilityInstructorRegist";
	}
	
	//강사등록 요청
	@RequestMapping(value = "facilityInstructorRegist.doa", method = RequestMethod.POST)
	public String facilityInstructorRegist(HttpServletRequest request, @RequestParam(name="instructorPicture", required=false) MultipartFile[] instructorPicture) {
		String[] instructorNameArr = request.getParameterValues("instructorName");
		String[] carrerArr = request.getParameterValues("carrer");
		String[] promiseArr = request.getParameterValues("promise");
		for (int i = 0; i < promiseArr.length; i++) {
			System.out.println(instructorNameArr[i]);
			System.out.println(carrerArr[i]);
			System.out.println(promiseArr[i]);
		}
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
			return "home";
		}
		else {
			return "common/errorPage";
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
	public String myFacilityListView(HttpSession session, HttpServletRequest request, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		System.out.println(userId);
		ArrayList<ExerciseFacility> exerciseFacility = fService.FacilityList(userId);
		for (int i = 0; i < exerciseFacility.size(); i++) {
			System.out.println(exerciseFacility.get(i).getTermsYn());
		}
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
	
	//시설정보 수정하기
	@RequestMapping(value = "facilityModify.doa", method = RequestMethod.POST)
	public String facilityInfoModify(HttpServletRequest request, Model model) {
		return "";
	}
	//시설 가격 수정 하기페이지
	public String facilityPriceInfoModify(int facilityNo, Model model) {
		//4. 시설 가격정보
		ArrayList<FacilityPrice> facilityPrice = fService.facilityPriceInfo(facilityNo);
		model.addAttribute("facilityPrice", facilityPrice);
		model.addAttribute("facilityNo", facilityNo);
		return "";
	}
	
	//강사 정보 수정하기 페이지
	public String instructorInfoModify(int facilityNo, Model model) {
		//3. 강사정보
		ArrayList<InstructorInfo> instructorInfo = fService.instructorInfo(facilityNo);
		model.addAttribute("instructorInfo", instructorInfo);
		return "";
	}
	
	
}
