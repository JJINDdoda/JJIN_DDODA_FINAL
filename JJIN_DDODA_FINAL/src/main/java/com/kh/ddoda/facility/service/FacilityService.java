package com.kh.ddoda.facility.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ddoda.facility.domain.ExerciseFacility;
import com.kh.ddoda.facility.domain.FacilityPicture;
import com.kh.ddoda.facility.domain.FacilityPrice;
import com.kh.ddoda.facility.domain.InstructorInfo;
import com.kh.ddoda.facility.domain.MapLocation;

public interface FacilityService {
	
	/**
	 * 시, 구 받아오기(ok)
	 * @return
	 */
	public ArrayList<MapLocation> locationList();
	
	
	
	/**
	 * 내가 등록한 시설목록
	 * @param userId
	 * @return
	 */
	public ArrayList<ExerciseFacility> FacilityList(String userId);
	
	/**
	 * 시설 상세보기(ok)
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
	 * 구 단위 시설 출력(ok)
	 * @param facilityInfo
	 * @return
	 */
	public ArrayList<ExerciseFacility> markerCountyList(HashMap<String, String> facilityInfo);
	
	public ArrayList<String> markerPoints(HashMap<String, String> facilityInfo);
	
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
	public int facilityTerms(String termsOfUse);
	
	/**
	 * 강사정보 등록하기
	 * @return
	 */
	public int instructorRegist(InstructorInfo instructorInfo);
}
