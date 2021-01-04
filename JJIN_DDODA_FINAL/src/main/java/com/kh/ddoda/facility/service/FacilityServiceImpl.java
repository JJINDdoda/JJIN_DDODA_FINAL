package com.kh.ddoda.facility.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.facility.domain.ExerciseFacility;
import com.kh.ddoda.facility.domain.FacilityPicture;
import com.kh.ddoda.facility.domain.FacilityPrice;
import com.kh.ddoda.facility.domain.InstructorInfo;
import com.kh.ddoda.facility.store.FacilityStore;

@Service
public class FacilityServiceImpl implements FacilityService {
	
	@Autowired
	private FacilityStore fStore;
	
	public FacilityServiceImpl() {
		
	}
	
//	@Override
//	public ArrayList<MapLocation> locationList() {
//		return fStore.locationList();
//	}

//	@Override
//	public ArrayList<MapLocation> mapLocation(MapLocation mapLocation) {
//		return fStore.mapLocation(mapLocation);
//	}
//
//	@Override
//	public ArrayList<ExerciseFacility> searchCity() {
//		return fStore.searchCity();
//	}
//
//	@Override
//	public ArrayList<ExerciseFacility> searchCounty(String areaName) {
//		return fStore.searchCounty(areaName);
//	}

	@Override
	public ExerciseFacility facilityInfo(int facilityNo) {
		return fStore.facilityInfo(facilityNo);
	}

	@Override
	public ArrayList<FacilityPicture> facilityPicture(int facilityNo) {
		return fStore.facilityPicture(facilityNo);
	}

	@Override
	public ArrayList<InstructorInfo> instructorInfo(int facilityNo) {
		return fStore.instructorInfo(facilityNo);
	}

//	@Override
//	public ArrayList<String> markerListAll(HashMap<String, String> facilityInfo) {
//		return fStore.markerListAll(facilityInfo);
//	}

	@Override
	public ArrayList<ExerciseFacility> markerCountyList(HashMap<String, String> facilityInfo) {
		return fStore.markerCountyList(facilityInfo);
	}

	@Override
	public ArrayList<String> markerPoints(HashMap<String, String> facilityInfo) {
		return fStore.markerPoints(facilityInfo);
	}

	@Override
	@Transactional
	public int facilityRegistration(ExerciseFacility exerciseFacility) {
		return fStore.facilityRegistration(exerciseFacility);
	}

	@Override
	@Transactional
	public int facilityPictureRegist(HashMap<String, String> facilityHash) {
		System.out.println("service");
		return fStore.facilityPictureRegist(facilityHash);
	}

	@Override
	public int facilityPriceRegist(FacilityPrice facilityPrice) {
		return fStore.facilityPriceRegist(facilityPrice);
	}


	@Override
	public int instructorRegist(InstructorInfo instructorInfo) {
		return fStore.instructorRegist(instructorInfo);
	}

	@Override
	public ArrayList<ExerciseFacility> FacilityList(PageInfo pi, String userId) {
		return fStore.FacilityList(pi, userId);
	}

	@Override
	public ArrayList<FacilityPrice> facilityPriceInfo(int facilityNo) {
		return fStore.facilityPriceInfo(facilityNo);
	}

	@Override
	public int updateFacilityInfo(ExerciseFacility exerciseFacility) {
		return fStore.updateFacilityInfo(exerciseFacility);
	}

	@Override
	public int updateFacilityPicture(FacilityPicture facilityPicture) {
		return fStore.updateFacilityPicture(facilityPicture);
	}

	@Override
	public int deleteFacilityPictureOne(String pictureRename) {
		return fStore.deleteFacilityPictureOne(pictureRename);
	}

	@Override
	public ArrayList<String> contentList(HashMap<String, String> facilityInfo) {
		return fStore.contentList(facilityInfo);
	}

//	@Override
//	public int deletePriceSubmit(HashMap<String, Integer> priceHash) {
//		return fStore.deletePriceSubmit(priceHash);
//	}

	@Override
	public int deletePrices(int facilityNo) {
		return fStore.deletePrices(facilityNo);
	}

	@Override
	public int facilityPriceModify(FacilityPrice facilityPrice) {
		return fStore.facilityPriceModify(facilityPrice);
	}

	@Override
	public int deleteFacilityInstructorOne(String instructorRename) {
		return fStore.deleteFacilityInstructorOne(instructorRename);
	}

	@Override
	public int updateFacilityInstructor(InstructorInfo instructorInfo) {
		return fStore.updateFacilityInstructor(instructorInfo);
	}

	@Override
	public int modifyFacilityInstructor(InstructorInfo instructorInfo) {
		return fStore.modifyFacilityInstructor(instructorInfo);
	}

	@Override
	public int deleteMyFacility(int facilityNo) {
		return fStore.deleteMyFacility(facilityNo);
	}

	@Override
	public int getMyFacilityListCount(String userId) {
		return fStore.getMyFacilityListCount(userId);
	}

	@Override
	public int getAllFacilityListCount() {
		return fStore.getAllFacilityListCount();
	}

	@Override
	public ArrayList<ExerciseFacility> allFacilityList(PageInfo pi) {
		return fStore.allFacilityList(pi);
	}

	@Override
	public int termsYnSearchCount(HashMap<String, String> termsYnHash) {
		return fStore.termsYnSearchCount(termsYnHash);
	}

	@Override
	public ArrayList<ExerciseFacility> termsYnSearch(PageInfo pi, HashMap<String, String> termsYnHash) {
		return fStore.termsYnSearch(pi, termsYnHash);
	}

	@Override
	public int approvedClick(int facilityNo) {
		return fStore.approvedClick(facilityNo);
	}

	@Override
	public int rejectClick(int facilityNo) {
		return fStore.rejectClick(facilityNo);
	}

	@Override
	public String facilityPictureRename(int facilityNo) {
		return fStore.facilityPictureRename(facilityNo);
	}

}
