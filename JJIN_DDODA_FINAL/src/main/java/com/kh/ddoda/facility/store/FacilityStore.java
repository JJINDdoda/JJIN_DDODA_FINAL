package com.kh.ddoda.facility.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.facility.domain.ExerciseFacility;
import com.kh.ddoda.facility.domain.FacilityPicture;
import com.kh.ddoda.facility.domain.FacilityPrice;
import com.kh.ddoda.facility.domain.InstructorInfo;

public interface FacilityStore {
	
	/**
	 * 시, 구 받아오기(ok)
	 * @return
	 */
	//public ArrayList<MapLocation> locationList();
	
	
	/**
	 * 구 구역 나누기
	 * @return
	 */
	//public ArrayList<MapLocation> mapLocation(MapLocation mapLocation);
	
	/**
	 * 시로 검색
	 * @return
	 */
	//public ArrayList<ExerciseFacility> searchCity();
	
	/**
	 * 구로 검색
	 * @return
	 */
	//public ArrayList<ExerciseFacility> searchCounty(String areaName);
	
	/**
	 * 내가 등록한 시설목록
	 * @param userId
	 * @return
	 */
	public ArrayList<ExerciseFacility> FacilityList(PageInfo pi, String userId);
	
	/**
	 * 시설 상세보기
	 * @param facilityNo
	 * @return
	 */
	public ExerciseFacility facilityInfo(int facilityNo);
	
	/**
	 * 시설내 사진 가져오기
	 * @param facilityNo
	 * @return
	 */
	public ArrayList<FacilityPicture> facilityPicture(int facilityNo);
	
	/**
	 * 시설 내 사진 하나 가져오기
	 * @param facilityNo
	 * @return
	 */
	public String facilityPictureRename(int facilityNo);
	
	/**
	 * 강사정보 가져오기
	 * @param facilityNo
	 * @return
	 */
	public ArrayList<InstructorInfo> instructorInfo(int facilityNo);
	
	/**
	 * 시설가격정보 가져오기
	 * @param facilityNo
	 * @return
	 */
	public ArrayList<FacilityPrice> facilityPriceInfo(int facilityNo);

	/**
	 * 시설 위치 전체 출력
	 * @return
	 */
	//public ArrayList<String> markerListAll(HashMap<String, String> facilityInfo);
	
	/**
	 * 구 단위 시설 출력(ok)
	 * @param facilityInfo
	 * @return
	 */
	public ArrayList<ExerciseFacility> markerCountyList(HashMap<String, String> facilityInfo);
	
	public ArrayList<String> markerPoints(HashMap<String, String> facilityInfo);
	
	/**
	 * content출력
	 * @return
	 */
	public ArrayList<String> contentList(HashMap<String, String> facilityInfo);
	
	/**
	 * 시설 정보 등록
	 * @return
	 */
	public int facilityRegistration(ExerciseFacility exerciseFacility);
	
	/**
	 * 시설사진 등록
	 * @return
	 */
	public int facilityPictureRegist(HashMap<String, String> facilityHash);
	
	/**
	 * 시설가격등록
	 * @return
	 */
	public int facilityPriceRegist(FacilityPrice facilityPrice);
	
	/**
	 * 이용약관 넣기
	 * @param termsOfUse
	 * @return
	 */
	//public int facilityTerms(String termsOfUse);
	
	/**
	 * 강사정보 등록하기
	 * @return
	 */
	public int instructorRegist(InstructorInfo instructorInfo);
	
	/**
	 * 시설정보 수정
	 * @return
	 */
	public int updateFacilityInfo(ExerciseFacility exerciseFacility);
	
	/**
	 * 시설사진 수정(등록)
	 * @param facilityHash
	 * @return
	 */
	public int updateFacilityPicture(FacilityPicture facilityPicture);
	
	/**
	 * 시설사진 하나 삭제
	 * @return
	 */
	public int deleteFacilityPictureOne(String pictureRename);
	
	/**
	 * 가격 하나 삭제
	 * @param months
	 * @return
	 */
	//public int deletePriceSubmit(HashMap<String, Integer> priceHash);
	
	/**
	 * 가격지우기
	 * @param facilityNo
	 * @return
	 */
	public int deletePrices(int facilityNo);
	
	/**
	 * 시설가격 재등록
	 * @param facilityNo
	 * @return
	 */
	public int facilityPriceModify(FacilityPrice facilityPrice);
	
	/**
	 * 강사 사진 삭제
	 * @return
	 */
	public int deleteFacilityInstructorOne(String instructorRename);
	
	/**
	 * 강사 재등록(업데이트)
	 * @param instructorInfo
	 * @return
	 */
	public int updateFacilityInstructor(InstructorInfo instructorInfo);
	
	/**
	 * 강사 업데이트
	 * @param instructorInfo
	 * @return
	 */
	public int modifyFacilityInstructor(InstructorInfo instructorInfo);
	
	/**
	 * 나의 시설 삭제
	 * @param facilityNo
	 * @return
	 */
	public int deleteMyFacility(int facilityNo);
	
	/**
	 * 페이지 전체 갯수 가져오기(나의 시설)
	 * @return
	 */
	public int getMyFacilityListCount(String userId);
	
	/**
	 * 전체시설 리스트 갯수 가져오기
	 * @return
	 */
	public int getAllFacilityListCount();
	
	/**
	 * 전체시설 리스트 가져오기
	 * @param pi
	 * @return
	 */
	public ArrayList<ExerciseFacility> allFacilityList(PageInfo pi);
	
	/**
	 * 검색을 통한 리스트 갯수 가져오기
	 * @param termsYnHash
	 * @return
	 */
	public int termsYnSearchCount(HashMap<String, String> termsYnHash);

	/**
	 * 검색을 통한 리스트 가져오기
	 * @param pi
	 * @return
	 */
	public ArrayList<ExerciseFacility> termsYnSearch(PageInfo pi, HashMap<String, String> termsYnHash);
	
	/**
	 * 승인 버튼 클릭
	 * @param facilityNo
	 * @return
	 */
	public int approvedClick(int facilityNo);
	
	/**
	 * 거절버튼 클릭
	 * @param facilityNo
	 * @return
	 */
	public int rejectClick(int facilityNo);
}
