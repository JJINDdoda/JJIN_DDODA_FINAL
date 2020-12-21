package com.kh.ddoda.facility.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.facility.domain.ExerciseFacility;
import com.kh.ddoda.facility.domain.FacilityPicture;
import com.kh.ddoda.facility.domain.FacilityPrice;
import com.kh.ddoda.facility.domain.InstructorInfo;
import com.kh.ddoda.facility.domain.MapLocation;

@Repository
public class FacilityStoreLogic implements FacilityStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FacilityStoreLogic() {
		
	}
	
	@Override
	public ArrayList<MapLocation> locationList() {
		return (ArrayList)sqlSession.selectList("FacilityMapper.locationList");
	}

	@Override
	public ExerciseFacility facilityInfo(int facilityNo) {
		return sqlSession.selectOne("FacilityMapper.facilityInfo", facilityNo);
	}

	@Override
	public ArrayList<FacilityPicture> facilityPicture(int facilityNo) {
		return (ArrayList)sqlSession.selectList("FacilityMapper.facilityPicture", facilityNo);
	}

	@Override
	public ArrayList<InstructorInfo> instructorInfo(int facilityNo) {
		return (ArrayList)sqlSession.selectList("FacilityMapper.instructorInfo", facilityNo);
	}

//	@Override
//	public ArrayList<String> markerListAll(HashMap<String, String> facilityInfo) {
//		//nope
//		return (ArrayList)sqlSession.selectList("FacilityMapper.markerListAll", facilityInfo);
//	}

	@Override
	public ArrayList<ExerciseFacility> markerCountyList(HashMap<String, String> facilityInfo) {
		return (ArrayList)sqlSession.selectList("FacilityMapper.markerList", facilityInfo);
		
	}

	@Override
	public ArrayList<String> markerPoints(HashMap<String, String> facilityInfo) {
		return (ArrayList)sqlSession.selectList("FacilityMapper.markerPoints", facilityInfo);
	}

	@Override
//	@Transactional
	public int facilityRegistration(ExerciseFacility exerciseFacility) {
		return sqlSession.insert("FacilityMapper.facilityRegistration", exerciseFacility);
	}

	//@Override
//	@Transactional
	public int facilityPictureRegist(HashMap<String, String> facilityHash) {
		return sqlSession.insert("FacilityMapper.facilityPictureRegist", facilityHash);
	}
	@Override
	public int facilityPriceRegist(FacilityPrice facilityPrice) {
		System.out.println("store");
		return sqlSession.insert("FacilityMapper.facilityPriceRegist", facilityPrice);
	}

	@Override
	public int facilityTerms(String termsOfUse) {
		return sqlSession.update("FacilityMapper.facilityTerms", termsOfUse);
	}

	@Override
	public int instructorRegist(InstructorInfo instructorInfo) {
		return sqlSession.insert("FacilityMapper.instructorRegist", instructorInfo);
	}

	@Override
	public ArrayList<ExerciseFacility> FacilityList(String userId) {
		return (ArrayList)sqlSession.selectList("FacilityMapper.facilityList", userId);
	}

	@Override
	public ArrayList<FacilityPrice> facilityPriceInfo(int facilityNo) {
		return (ArrayList)sqlSession.selectList("FacilityMapper.facilityPrice", facilityNo);
	}

	

}
