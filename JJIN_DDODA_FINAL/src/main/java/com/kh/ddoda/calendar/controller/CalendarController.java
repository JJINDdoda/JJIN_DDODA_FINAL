package com.kh.ddoda.calendar.controller;

import java.io.File;
import java.net.URLEncoder;
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
import com.kh.ddoda.calendar.domain.Calorie;
import com.kh.ddoda.calendar.domain.MemberInfo;
import com.kh.ddoda.calendar.domain.MyCalorie;
import com.kh.ddoda.calendar.domain.MyDiet;
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
	public String calendarView(Model model, HttpServletRequest request, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		String events = "";
		String infoEvents = "";
		String calorieEvents = "";
		System.out.println(userId);
		ArrayList<MemberInfo> myInfo = cService.getMyInfo(userId);
		ArrayList<HashMap<String, String>> calorie = cService.getCalorie(userId);
		for (int i = 0; i < calorie.size(); i++) {
			HashMap<String, String> val = calorie.get(i);
			if(i == calorie.size() - 1) {
				//System.out.println(String.valueOf(val.get("total")));
				calorieEvents += "{title : '" + String.valueOf(val.get("total")) + "', color : \'#AFC2C6\'" + ", start : '" + String.valueOf(val.get("mydietDate")) + "', end : '" + String.valueOf(val.get("mydietDate")) + "'}";
			}
			else {
				//System.out.println(String.valueOf(val.get("total"))+ ",");
				calorieEvents += "{title : '" + String.valueOf(val.get("total")) + "', color : \'#AFC2C6\'" + ", start : '" + String.valueOf(val.get("mydietDate")) + "', end : '" + String.valueOf(val.get("mydietDate")) + "'},";
			}
		}
		
		
		for (int i = 0; i < myInfo.size(); i++) {
			if(i == myInfo.size()) {
				infoEvents += "{title : '" + myInfo.get(i).getBmi() + "', color : \'#FF8F8F\'" + ", start : '" + myInfo.get(i).getChangeDate() + "', end : '" + myInfo.get(i).getChangeDate() + "'}";
			}
			else {
				infoEvents += "{title : '" + myInfo.get(i).getBmi() + "', color : \'#FF8F8F\'" + ", start : '" + myInfo.get(i).getChangeDate() + "', end : '" + myInfo.get(i).getChangeDate() + "'},";
			}
		}
		if(infoEvents.equals("")) {
			events = calorieEvents;
		}
		else if(calorieEvents.equals("")) {
			events = infoEvents;
		}
		else {
			events = calorieEvents + "," + infoEvents;
		}
		
		
		model.addAttribute("events", events);
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
		
		HashMap<String, Object> imgupdate = new HashMap<String, Object>();
		for(int i = 0 ; i < fileImgs.length ; i ++) {
			if ( !fileImgs[i].getOriginalFilename().equals("")) {
				dimg = new DiaryImg();
				imgRenamePath = saveFileName( request, fileImgs[i], session, i, folderNo);
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
			HttpSession session, int i, int folderNo){
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
	
	//마이일기 리스트
	@RequestMapping(value="diaryList.doa", method=RequestMethod.GET)
	public void diaryList(HttpServletResponse response, 
							@RequestParam("userId") String userId) throws Exception {
		ArrayList<Opendiary> opendiaryList = cService.mydiaryList(userId);
		for(Opendiary opendiary : opendiaryList) {
			if(opendiary.getMainImagePath() != null) {
			opendiary.setMainImagePath(URLEncoder.encode(opendiary.getMainImagePath(), "utf-8"));
			}
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(opendiaryList, response.getWriter());
		System.out.println("다이어리 리스트 : "+ opendiaryList);
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
	//마이일기 수정하기
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
//		System.out.println("숴정콘트롤러 : "+diaryresult);
		String menuName = opendiary.getOpenYn();
		System.out.println("menuName"+menuName);
		
		if(reloadFile.length > 0) {
			int folderNo  = opendiary.getOpendiaryNo();
			HashMap<String, Object> imgupdate = new HashMap<String, Object>();
			for(int i = 0 ; i < reloadFile.length ; i ++) {
				if ( !reloadFile[i].getOriginalFilename().equals("")) {
					dimg = new DiaryImg();
					imgRenamePath = saveFileName( request, reloadFile[i], session, i, folderNo);
					if(imgMainYn != null) {
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
							}
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
	
	//마이일기 수정할 때 파일 삭제 : DB데이터 삭제 -> DB 데이터 삭제 성공 시 저장된 img 파일 삭제 -> success 반
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
			String savePath = root + "//opendiaryUploadFiles//"+userId +"//"+folderNo;
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
	//마이일기 삭제하기
	@RequestMapping(value="myDiaryDelete.doa",method = RequestMethod.GET)
	public String myDiaryDelelte(@RequestParam("opendiaryNo") int opendiaryNo, 
							HttpServletRequest request, Model model) {
		ArrayList<DiaryImg> dimgs = cService.mydiaryFileList(opendiaryNo);
		if(!dimgs.isEmpty()) {
			deleteAllFile(opendiaryNo, request, model);
		}
		int fileresult = cService.deleteAllFile(opendiaryNo);
		int diaryresult = cService.deleteDiary(opendiaryNo);
		if(diaryresult > 0 || fileresult >0) {
			return "redirect:calendarView.doa";
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
	
	
	//기본정보 등록
		@RequestMapping(value = "changeMyInfo.doa", method = RequestMethod.POST)
		public String changeMyInfo(HttpSession session, HttpServletRequest request, Model model) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			System.out.println(userId);
			//String userId = "sinchan";
			int height = Integer.parseInt(request.getParameter("myHeight"));
			int weight = Integer.parseInt(request.getParameter("myWeight"));
			String bmi = request.getParameter("myBMI");
			String changeDate = request.getParameter("changeDate");
			MemberInfo memberInfo = new MemberInfo();
			memberInfo.setUserId(userId);
			memberInfo.setHeight(height);
			memberInfo.setWeight(weight);
			memberInfo.setBmi(bmi);
			memberInfo.setChangeDate(changeDate);
			System.out.println(memberInfo.toString());
			int result = cService.memberInfoInput(memberInfo);
			if(result > 0) {
//				model.addAttribute("memberInfo", memberInfo);
//				return "calendar/calendarView";
				return "redirect:calendarView.doa";
			}
			else {
				return "common/errorPage";
			}
		}
		
		//클릭한 날짜의 데이터 가져오기
		@ResponseBody
		@RequestMapping(value = "selectMyInfoDate.doa", method = RequestMethod.GET)
		public MemberInfo selectMyInfoDate(HttpServletRequest request, HttpSession session) {
			String changeDate = request.getParameter("clickDate");
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			HashMap<String, String> dataHash = new HashMap<String, String>();
			dataHash.put("changeDate", changeDate);
			dataHash.put("userId", userId);
			MemberInfo memberInfo = cService.selectMyInfoDate(dataHash);
			if(memberInfo == null) {
				System.out.println("null");
			}
			return memberInfo;
		}
		
		//클릭한 날짜의 데이터가 있을 경우 update로 값 변경해주기
		@RequestMapping(value = "updateChangeMyInfo.doa", method = RequestMethod.POST)
		public String updateChangeMyInfo(HttpServletRequest request, HttpSession session, Model model) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			System.out.println(userId);
			//String userId = "sinchan";
			int height = Integer.parseInt(request.getParameter("myHeight"));
			int weight = Integer.parseInt(request.getParameter("myWeight"));
			String bmi = request.getParameter("myBMI");
			String changeDate = request.getParameter("changeDate");
			MemberInfo memberInfo = new MemberInfo();
			memberInfo.setUserId(userId);
			memberInfo.setHeight(height);
			memberInfo.setWeight(weight);
			memberInfo.setBmi(bmi);
			memberInfo.setChangeDate(changeDate);
			System.out.println(memberInfo.toString());
			int result = cService.updateChangeMyInfo(memberInfo);
			if(result > 0) {
//				model.addAttribute("memberInfo", memberInfo);
//				return "calendar/calendarView";
				return "redirect:calendarView.doa";
			}
			else {
				return "common/errorPage";
			}
			
		}
		
		//칼로리 입력 창
		@RequestMapping(value = "calorieInput.doa", method = RequestMethod.GET)
		public String caloriInput(HttpServletRequest request, Model model, HttpSession session) {
			//사용자 아이디 가져오기
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			String changeDate = request.getParameter("clickDate");
			ArrayList<String> foodName = cService.selectCalorie(); //음식이름 입력시 사용
			// 가져온 날짜에 아침, 점심, 저녁 중 어떤것이 기록되어있는지 가져온다.(식별변호도 같이)
			HashMap<String, String> mealHash = new HashMap<String, String>();
			mealHash.put("userId", userId);
			mealHash.put("changeDate", changeDate);
			ArrayList<MyDiet> myDietKinds = cService.getMealKinds(mealHash);
			System.out.println("myDietKinds" + myDietKinds.size());
			//System.out.println(changeDate);
			ArrayList<MyCalorie> breakFastmyCalorie = new ArrayList<MyCalorie>();
			ArrayList<MyCalorie> lunchmyCalorie = new ArrayList<MyCalorie>();
			ArrayList<MyCalorie> dinnermyCalorie = new ArrayList<MyCalorie>();
			
			for (int i = 0; i < myDietKinds.size(); i++) {
				String meal = myDietKinds.get(i).getMydietmeal();
				System.out.println(myDietKinds.get(i).getMydietmeal());
				int breakfastmydietNo = 0;
				int lunchmydietNo = 0;
				int dinnermydietNo = 0;
				if(meal.equals("아침")) {
					breakfastmydietNo = myDietKinds.get(i).getMydietNo();
					System.out.println("칼로리번호 : " + breakfastmydietNo);
					System.out.println("식사종류" + meal);
					//아침
					//HashMap<String, String> myCalorieHash = new HashMap<String, String>();
					//myCalorieHash.put("userId", userId);
					//myCalorieHash.put("changeDate", changeDate);
					//myCalorieHash.put("mydietMeal", "아침");
					//myCalorieHash.put("mydietNo", mydietNo);
					breakFastmyCalorie = cService.myCalorieGetDate(breakfastmydietNo);
					int breakfastTotal = myDietKinds.get(i).getMydietConsumption();
					model.addAttribute("breakfastmydietNo", breakfastmydietNo);
					model.addAttribute("breakfastTotal", breakfastTotal);
					//model.addAttribute("breakfastMyDiet", myDietKinds);
				}
				else if(meal.equals("점심")) {
					//점심
					//model.addAttribute("lunchMyDiet", lunchMyDiet);
					lunchmydietNo = myDietKinds.get(i).getMydietNo(); // 해당 diet식별번호 가져오기
					System.out.println("칼로리번호 : " + lunchmydietNo);
					System.out.println("식사종류" + meal);
					lunchmyCalorie = cService.myCalorieGetDate(lunchmydietNo); // dietNo에 해당하는 값 가져오기
					System.out.println(lunchmyCalorie.toString());
					int lunchTotal = myDietKinds.get(i).getMydietConsumption(); // 점심 전체 칼로리 가져오기
					model.addAttribute("lunchmydietNo", lunchmydietNo);
					model.addAttribute("lunchTotal", lunchTotal);
				}
				else if(meal.equals("저녁")) {
					//저녁
					//model.addAttribute("dinnertMyDiet", dinnertMyDiet);
					dinnermydietNo = myDietKinds.get(i).getMydietNo(); // 해당 diet식별번호 가져오기
					System.out.println("칼로리번호 : " + dinnermydietNo);
					System.out.println("식사종류" + meal);
					dinnermyCalorie = cService.myCalorieGetDate(dinnermydietNo); // dietNo에 해당하는 값 가져오기
					int dinnerTotal = myDietKinds.get(i).getMydietConsumption(); // 점심 전체 칼로리 가져오기
					model.addAttribute("dinnermydietNo", dinnermydietNo);
					model.addAttribute("dinnerTotal", dinnerTotal);
				}
				else {
					System.out.println("??");
				}
				
			}
			model.addAttribute("dinnermyCalorie", dinnermyCalorie);
			model.addAttribute("lunchmyCalorie", lunchmyCalorie);
			model.addAttribute("breakFastmyCalorie", breakFastmyCalorie);
			model.addAttribute("foodName", foodName);
			model.addAttribute("changeDate", changeDate);
			return "calendar/calorieInput";
			//return "redirect:calorieInput.doa";
		}
		
		//아침음식 선택
		@ResponseBody
		@RequestMapping(value = "changeFoodName.doa", method = RequestMethod.GET)
		public Calorie changeBreakfastFoodName(HttpServletRequest request) {
			String foodName = request.getParameter("foodName");
//			System.out.println(foodName);
			Calorie Calorie = cService.changeBreakfastFoodName(foodName);
//			System.out.println(Calorie.toString());
			return Calorie;
		}
		
		//아침 input
		@RequestMapping(value = "inputBreakFastInfo.doa", method = RequestMethod.POST)
		public String inputBreakfastInfo(HttpServletRequest request, HttpSession session, Model model) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			//String mealKinds = "아침";
			String mealKinds = request.getParameter("mealKinds");
			String[] foodName = request.getParameterValues("foodName");
			String[] kcal = request.getParameterValues("kcal");
			String[] foodAmount = request.getParameterValues("foodAmount");
			String[] unit = request.getParameterValues("unit");
			//String breakfastTotalCalorie = request.getParameter("breakfastTotalCalorie");
			String changeDate = request.getParameter("changeDate");
			
			MyDiet mydiet = new MyDiet();
			MyCalorie mycalorie = new MyCalorie();
			int dietResult = 0;
			int calorieResult = 0;
			
			int mydietConsumption = 0;
			for (int i = 0; i < unit.length; i++) {
				mydietConsumption += Integer.parseInt(kcal[i]);
			}
			System.out.println(mydietConsumption);
			mydiet.setMydietmeal(mealKinds);
			mydiet.setMydietConsumption(mydietConsumption);
			mydiet.setMydietDate(changeDate);
			mydiet.setUerId(userId);
			mydiet.setMydietConsumption(mydietConsumption);
			System.out.println(mydiet.toString());
			dietResult = cService.inputMydiet(mydiet);
			
			for (int i = 0; i < foodAmount.length; i++) {
				mycalorie.setFoodName(foodName[i]);
				mycalorie.setKcal(Integer.parseInt(kcal[i]));
				mycalorie.setFoodAmount(Integer.parseInt(foodAmount[i]));
				mycalorie.setUnit(unit[i]);
				System.out.println(mycalorie.toString());
				calorieResult = cService.inputMyCalorie(mycalorie);
			}
			
			if(dietResult > 0 && calorieResult > 0) {
				//model.addAttribute("changeDate", changeDate);
				//model.addAttribute("breakFastmyCalorie", attributeValue);
				
				return "redirect:calendarView.doa";
			}
			else {
				return "common/errorPage";
			}
			
			
		}
		
		//아침 update
		@RequestMapping(value = "updateBreakFastInfo.doa", method = RequestMethod.GET)
		public String updateBreakfastInfo(HttpServletRequest request, HttpSession session, Model model) {
			int mydietNo = Integer.parseInt(request.getParameter("mydietNo"));
			System.out.println("아침업데이트 : " + mydietNo);
			cService.deleteBreakfastInfo(mydietNo);
			
			
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			String mealKinds = request.getParameter("mealKinds");
			String[] foodName = request.getParameterValues("foodName");
			String[] kcal = request.getParameterValues("kcal");
			String[] foodAmount = request.getParameterValues("foodAmount");
			String[] unit = request.getParameterValues("unit");
			//String breakfastTotalCalorie = request.getParameter("breakfastTotalCalorie");
			String changeDate = request.getParameter("changeDate");
			System.out.println("식사종류(아침이여야해) : " + mealKinds);
			
			MyDiet mydiet = new MyDiet();
			MyCalorie mycalorie = new MyCalorie();
			int dietResult = 0;
			int calorieResult = 0;
			
			int mydietConsumption = 0;
			for (int i = 0; i < unit.length; i++) {
				mydietConsumption += Integer.parseInt(kcal[i]);
			}
			System.out.println("아침총열량 : " + mydietConsumption);
			mydiet.setMydietNo(mydietNo);
			mydiet.setMydietmeal(mealKinds); //식사종류
			mydiet.setMydietConsumption(mydietConsumption); // 총 열량
			mydiet.setMydietDate(changeDate); // 날짜
			mydiet.setUerId(userId); // 사용자Id
			mydiet.setMydietConsumption(mydietConsumption);
			System.out.println(mydiet.toString());
			dietResult = cService.inputMydiet(mydiet);
			
			for (int i = 0; i < foodAmount.length; i++) {
				mycalorie.setFoodName(foodName[i]);
				mycalorie.setKcal(Integer.parseInt(kcal[i]));
				mycalorie.setFoodAmount(Integer.parseInt(foodAmount[i]));
				mycalorie.setUnit(unit[i]);
				mycalorie.setMydietNo(mydietNo);
				System.out.println(mycalorie.toString());
				calorieResult = cService.inputMyCalorie(mycalorie);
			}
			if(dietResult > 0 && calorieResult > 0) {
				return "redirect:calorieInput.doa";
			}
			else {
				return "common/errorPage";
			}
		}
		
		//아침 delete
		@RequestMapping(value = "deleteMyDietInfo.doa", method = RequestMethod.GET)
		public String deleteBreakfastInfo(HttpServletRequest request, Model model) {
			int mydietNo = Integer.parseInt(request.getParameter("breakfastmydietNo"));
			System.out.println(mydietNo);
			int result = cService.deleteBreakfastInfo(mydietNo);
			if(result > 0) {
				return "redirect:calendarView.doa";
			}
			else {
				return "common/errorPage";
			}
		}
		
		//점심 insert
		@RequestMapping(value = "inputLunchInfo.doa", method = RequestMethod.POST)
		public String inputLunchInfo(HttpServletRequest request, Model model, HttpSession session) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			//String mealKinds = "아침";
			String mealKinds = request.getParameter("mealKinds");
			String[] foodName = request.getParameterValues("lunchFoodName");
			String[] kcal = request.getParameterValues("kcal");
			String[] foodAmount = request.getParameterValues("foodAmount");
			String[] unit = request.getParameterValues("unit");
			//String breakfastTotalCalorie = request.getParameter("breakfastTotalCalorie");
			String changeDate = request.getParameter("changeDate");
			
			MyDiet mydiet = new MyDiet();
			MyCalorie mycalorie = new MyCalorie();
			int dietResult = 0;
			int calorieResult = 0;
			
			int mydietConsumption = 0;
			for (int i = 0; i < unit.length; i++) {
				mydietConsumption += Integer.parseInt(kcal[i]);
			}
			System.out.println(mydietConsumption);
			mydiet.setMydietmeal(mealKinds);
			mydiet.setMydietConsumption(mydietConsumption);
			mydiet.setMydietDate(changeDate);
			mydiet.setUerId(userId);
			mydiet.setMydietConsumption(mydietConsumption);
			System.out.println(mydiet.toString());
			dietResult = cService.inputMydiet(mydiet);
			
			for (int i = 0; i < foodAmount.length; i++) {
				mycalorie.setFoodName(foodName[i]);
				mycalorie.setKcal(Integer.parseInt(kcal[i]));
				mycalorie.setFoodAmount(Integer.parseInt(foodAmount[i]));
				mycalorie.setUnit(unit[i]);
				System.out.println(mycalorie.toString());
				calorieResult = cService.inputMyCalorie(mycalorie);
			}
			
			if(dietResult > 0 && calorieResult > 0) {
				model.addAttribute("changeDate", changeDate);
				//model.addAttribute("breakFastmyCalorie", breakFastmyCalorie);
				return "redirect:calendarView.doa";
			}
			else {
				return "common/errorPage";
			}
		}
		
		//점심 update
		@RequestMapping(value = "updateLunchInfo.doa", method = RequestMethod.GET)
		public String updateLunchInfo(HttpServletRequest request, HttpSession session) {
			int mydietNo = Integer.parseInt(request.getParameter("mydietNo"));
			System.out.println(mydietNo);
			System.out.println("점심업데이트 : " + mydietNo);
			cService.deleteBreakfastInfo(mydietNo);
			
			
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			String mealKinds = request.getParameter("mealKinds");
			String[] foodName = request.getParameterValues("lunchFoodName");
			String[] kcal = request.getParameterValues("kcal");
			String[] foodAmount = request.getParameterValues("foodAmount");
			String[] unit = request.getParameterValues("unit");
			//String breakfastTotalCalorie = request.getParameter("breakfastTotalCalorie");
			String changeDate = request.getParameter("changeDate");
			System.out.println("식사종류(점심이여야해) : " + mealKinds);
			
			MyDiet mydiet = new MyDiet();
			MyCalorie mycalorie = new MyCalorie();
			int dietResult = 0;
			int calorieResult = 0;
			
			int mydietConsumption = 0;
			for (int i = 0; i < unit.length; i++) {
				mydietConsumption += Integer.parseInt(kcal[i]);
			}
			System.out.println("점심총열량 : " + mydietConsumption);
			mydiet.setMydietNo(mydietNo);
			mydiet.setMydietmeal(mealKinds);
			mydiet.setMydietConsumption(mydietConsumption);
			mydiet.setMydietDate(changeDate);
			mydiet.setUerId(userId);
			mydiet.setMydietConsumption(mydietConsumption);
			System.out.println(mydiet.toString());
			dietResult = cService.inputMydiet(mydiet);
			
			for (int i = 0; i < foodAmount.length; i++) {
				mycalorie.setFoodName(foodName[i]);
				mycalorie.setKcal(Integer.parseInt(kcal[i]));
				mycalorie.setFoodAmount(Integer.parseInt(foodAmount[i]));
				mycalorie.setUnit(unit[i]);
				mycalorie.setMydietNo(mydietNo);
				System.out.println(mycalorie.toString());
				calorieResult = cService.inputMyCalorie(mycalorie);
			}
			if(dietResult > 0 && calorieResult > 0) {
				return "redirect:calendarView.doa";
			}
			else {
				return "common/errorPage";
			}
		}
		
		//점심 delete
			@RequestMapping(value = "deleteLunchMyDietInfo.doa", method = RequestMethod.GET)
			public String deleteLunchMyDietInfo(HttpServletRequest request, Model model) {
				int mydietNo = Integer.parseInt(request.getParameter("lunchmydietNo"));
				System.out.println(mydietNo);
				int result = cService.deleteBreakfastInfo(mydietNo);
				if(result > 0) {
					return "redirect:calendarView.doa";
				}
				else {
					return "common/errorPage";
				}
			}
		
			//저녁 insert
			@RequestMapping(value = "inputDinnerInfo.doa", method = RequestMethod.POST)
			public String inputDinnerInfo(HttpServletRequest request, Model model, HttpSession session) {
				Member loginUser = (Member) session.getAttribute("loginUser");
				String userId = loginUser.getUserId();
				String mealKinds = request.getParameter("mealKinds");
				String[] foodName = request.getParameterValues("dinnerFoodName");
				String[] kcal = request.getParameterValues("kcal");
				String[] foodAmount = request.getParameterValues("foodAmount");
				String[] unit = request.getParameterValues("unit");
				//String breakfastTotalCalorie = request.getParameter("breakfastTotalCalorie");
				String changeDate = request.getParameter("changeDate");
				
				MyDiet mydiet = new MyDiet();
				MyCalorie mycalorie = new MyCalorie();
				int dietResult = 0;
				int calorieResult = 0;
				
				int mydietConsumption = 0;
				for (int i = 0; i < unit.length; i++) {
					mydietConsumption += Integer.parseInt(kcal[i]);
				}
				System.out.println(mydietConsumption);
				mydiet.setMydietmeal(mealKinds);
				mydiet.setMydietConsumption(mydietConsumption);
				mydiet.setMydietDate(changeDate);
				mydiet.setUerId(userId);
				mydiet.setMydietConsumption(mydietConsumption);
				System.out.println(mydiet.toString());
				dietResult = cService.inputMydiet(mydiet);
				
				for (int i = 0; i < foodAmount.length; i++) {
					mycalorie.setFoodName(foodName[i]);
					mycalorie.setKcal(Integer.parseInt(kcal[i]));
					mycalorie.setFoodAmount(Integer.parseInt(foodAmount[i]));
					mycalorie.setUnit(unit[i]);
					System.out.println(mycalorie.toString());
					calorieResult = cService.inputMyCalorie(mycalorie);
				}
				
				if(dietResult > 0 && calorieResult > 0) {
					model.addAttribute("changeDate", changeDate);
					return "redirect:calendarView.doa";
				}
				else {
					return "common/errorPage";
				}
			}
			
			//저녁 update
			@RequestMapping(value = "updateDinnerInfo.doa", method = RequestMethod.GET)
			public String updateDinnerInfo(HttpServletRequest request, HttpSession session) {
				int mydietNo = Integer.parseInt(request.getParameter("mydietNo"));
				System.out.println(mydietNo);
				cService.deleteBreakfastInfo(mydietNo);
				
				
				Member loginUser = (Member) session.getAttribute("loginUser");
				String userId = loginUser.getUserId();
				String mealKinds = request.getParameter("mealKinds");
				String[] foodName = request.getParameterValues("dinnerFoodName");
				String[] kcal = request.getParameterValues("kcal");
				String[] foodAmount = request.getParameterValues("foodAmount");
				String[] unit = request.getParameterValues("unit");
				//String breakfastTotalCalorie = request.getParameter("breakfastTotalCalorie");
				String changeDate = request.getParameter("changeDate");
				
				MyDiet mydiet = new MyDiet();
				MyCalorie mycalorie = new MyCalorie();
				int dietResult = 0;
				int calorieResult = 0;
				
				int mydietConsumption = 0;
				for (int i = 0; i < unit.length; i++) {
					mydietConsumption += Integer.parseInt(kcal[i]);
				}
				System.out.println(mydietConsumption);
				mydiet.setMydietNo(mydietNo);
				mydiet.setMydietmeal(mealKinds);
				mydiet.setMydietConsumption(mydietConsumption);
				mydiet.setMydietDate(changeDate);
				mydiet.setUerId(userId);
				mydiet.setMydietConsumption(mydietConsumption);
				System.out.println(mydiet.toString());
				dietResult = cService.inputMydiet(mydiet);
				
				for (int i = 0; i < foodAmount.length; i++) {
					mycalorie.setFoodName(foodName[i]);
					mycalorie.setKcal(Integer.parseInt(kcal[i]));
					mycalorie.setFoodAmount(Integer.parseInt(foodAmount[i]));
					mycalorie.setUnit(unit[i]);
					mycalorie.setMydietNo(mydietNo);
					System.out.println(mycalorie.toString());
					calorieResult = cService.inputMyCalorie(mycalorie);
				}
				if(dietResult > 0 && calorieResult > 0) {
					return "redirect:calendarView.doa";
				}
				else {
					return "common/errorPage";
				}
			}
			
			//저녁 delete
					@RequestMapping(value = "deleteDinnerMyDietInfo.doa", method = RequestMethod.GET)
					public String deleteDinnerMyDietInfo(HttpServletRequest request, Model model) {
						int mydietNo = Integer.parseInt(request.getParameter("dinnermydietNo"));
						System.out.println(mydietNo);
						int result = cService.deleteBreakfastInfo(mydietNo);
						if(result > 0) {
							return "redirect:calendarView.doa";
						}
						else {
							return "common/errorPage";
						}
					}

		
	
}
