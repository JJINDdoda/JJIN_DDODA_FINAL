package com.kh.ddoda.facility.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.facility.domain.ExerciseFacility;
import com.kh.ddoda.facility.domain.FacilityPicture;
import com.kh.ddoda.facility.domain.FacilityPrice;
import com.kh.ddoda.facility.domain.InstructorInfo;
import com.kh.ddoda.facility.domain.MapLocation;
import com.kh.ddoda.facility.store.FacilityStore;

@Service
public class FacilityServiceImpl implements FacilityService {
	
	@Autowired
	private FacilityStore fStore;
	
	public FacilityServiceImpl() {
		
	}
	
	@Override
	public ArrayList<MapLocation> locationList() {
		return fStore.locationList();
	}


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

	@Override
	public ArrayList<ExerciseFacility> markerCountyList(HashMap<String, String> facilityInfo) {
		return fStore.markerCountyList(facilityInfo);
	}

	@Override
	public ArrayList<String> markerPoints(HashMap<String, String> facilityInfo) {
		return fStore.markerPoints(facilityInfo);
	}

	@Override
	public int facilityRegistration(ExerciseFacility exerciseFacility) {
		return fStore.facilityRegistration(exerciseFacility);
	}

	@Override
	public int facilityPictureRegist(HashMap<String, String> facilityHash) {
		System.out.println("service");
		return fStore.facilityPictureRegist(facilityHash);
	}

	@Override
	public int facilityPriceRegist(FacilityPrice facilityPrice) {
		return fStore.facilityPriceRegist(facilityPrice);
	}

	@Override
	public int facilityTerms(String termsOfUse) {
		return fStore.facilityTerms(termsOfUse);
	}

	@Override
	public int instructorRegist(InstructorInfo instructorInfo) {
		return fStore.instructorRegist(instructorInfo);
	}

	@Override
	public ArrayList<ExerciseFacility> FacilityList(String userId) {
		return fStore.FacilityList(userId);
	}

	@Override
	public ArrayList<FacilityPrice> facilityPriceInfo(int facilityNo) {
		return fStore.facilityPriceInfo(facilityNo);
	}

	


}
