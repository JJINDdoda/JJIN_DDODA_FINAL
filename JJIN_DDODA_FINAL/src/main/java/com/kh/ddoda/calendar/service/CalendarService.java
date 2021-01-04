package com.kh.ddoda.calendar.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ddoda.calendar.domain.Calorie;
import com.kh.ddoda.calendar.domain.Diary;
import com.kh.ddoda.calendar.domain.MemberInfo;
import com.kh.ddoda.calendar.domain.MyCalorie;
import com.kh.ddoda.calendar.domain.MyDiet;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;

public interface CalendarService {

	/**
	 * 일기 등록 
	 * @param diary
	 * @return
	 */
	public int insertDiary(Opendiary opendiary);
		
	/**
	 * 일기 수정
	 * @param diary
	 * @return
	 */
	public int modifyDiary(Opendiary opendiary);
	/**
	 * 공유일기 수정 시 파일 입력
	 * @param imgfile
	 * @return
	 */
	public int insertfileImgModify(HashMap<String, Object> parameters);
		
	/**
	 * 일기 삭제
	 * @param diaryNo
	 * @return
	 */
	public int deleteDiary(int opendiaryNo);
	
	/**
	 * 일기 상세보기
	 * @param diary
	 * @return
	 */
	public Opendiary selectOneDiary(int opendiaryNo);
	
	/**
	 * 일기 리스트
	 * @param userId
	 */
	public ArrayList<Opendiary> mydiaryList(String userId);
	
	/**
	 * 일기 파일 저장
	 * @param
	 */
	public int insertfileImg(HashMap<String, String> imgfile);
	
	/**
	 * 일기 수정 시 파일 하나씩 삭제
	 * @param map
	 * @return
	 */
	public int deleteFile(HashMap<String, Object> map);
	
	/**
	 * 파일 리스트
	 * @param opendiaryNo
	 */
	public ArrayList<DiaryImg> mydiaryFileList(int opendiaryNo);
	/**
	 * 일기 작성 시 폼 insert 하고 난 뒤 imgRenamePath update하기
	 * @param imgRenamePath
	 * @return
	 */
	public int updateMyDiaryImage(HashMap<String, Object> imgupdate);
	/**
	 * 특정 일기의 Y인 대표이미지 N으로 바꾸기
	 * @return 
	 */
	public int updateMainImg(int opendiaryNo);
	/**
	 * 일기 삭제 시 모든 파일 삭제
	 * @param opendiaryNo
	 */
	public int deleteAllFile(int opendiaryNo);
	
	/**
	 * 기본정보 입력
	 * @param memberInfo
	 * @return
	 */
	public int memberInfoInput(MemberInfo memberInfo);
	
	/**
	 * 날짜로 기본정보 받아오기
	 * @param memberInfo
	 * @return
	 */
	public MemberInfo selectMyInfoDate(HashMap<String, String> dataHash);
	
	/**
	 * 기본정보 변경
	 * @param memberInfo
	 * @return
	 */
	public int updateChangeMyInfo(MemberInfo memberInfo);
	
	/**
	 * 저장되어있는 칼로리 불러오기
	 * @return
	 */
	public ArrayList<String> selectCalorie();
	
	/**
	 * 선택한 음식의 칼로리, 기본 단위 가져오기
	 * @param foodName
	 * @return
	 */
	public Calorie changeBreakfastFoodName(String foodName);
	
	/**
	 * 다이어리 작성유무
	 * @param userId
	 * @return
	 */
	public ArrayList<Diary> getDiary(String userId);
	
	/**
	 * 기본정보 작성유무
	 * @param userId
	 * @return
	 */
	public ArrayList<MemberInfo> getMyInfo(String userId);
	
	/**
	 * 칼로리 작성유무
	 * @param userId
	 * @return
	 */
	public ArrayList<HashMap<String, String>> getCalorie(String userId);
	
	/**
	 * 날짜에 저장되어있는 식사종류와 식별번호를 가져온다.
	 * @param changeDate
	 * @return
	 */
	public ArrayList<MyDiet> getMealKinds(HashMap<String , String> mealHash);
	
	/**
	 * 나의 식단 넣기
	 * @param mydiet
	 * @return
	 */
	public int inputMydiet(MyDiet mydiet);
	
	/**
	 * 나의 칼로리 넣기
	 * @param mycalorie
	 * @return
	 */
	public int inputMyCalorie(MyCalorie mycalorie);
	
	/**
	 * dietNo에 해당하는 값 가져오기
	 * @param mydietNo
	 * @return
	 */
	public ArrayList<MyCalorie> myCalorieGetDate(int mydietNo);
	
	/**
	 * 아침 삭제
	 * @param mydietNo
	 * @return
	 */
	public int deleteBreakfastInfo(int mydietNo);
}
