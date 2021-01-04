package com.kh.ddoda.facility.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.facility.domain.ExerciseFacility;
import com.kh.ddoda.facility.domain.FacilityPicture;
import com.kh.ddoda.facility.domain.FacilityPrice;
import com.kh.ddoda.facility.domain.InstructorInfo;

@Repository
public class FacilityStoreLogic implements FacilityStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FacilityStoreLogic() {
		
	}
	
//	@Override
//	public ArrayList<MapLocation> locationList() {
//		return (ArrayList)sqlSession.selectList("FacilityMapper.locationList");
//	}

//	@Override
//	public ArrayList<MapLocation> mapLocation(MapLocation mapLocation) {
//		//nope
//		return (ArrayList)sqlSession.selectList("FacilityMapper.mapLocation", mapLocation);
//	}
//	
//	@Override
//	public ArrayList<ExerciseFacility> searchCity() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public ArrayList<ExerciseFacility> searchCounty(String areaName) {
//		//nope
//		return (ArrayList)sqlSession.selectList("FacilityMapper.searchCounty", areaName);
//	}

	@Override
	public ExerciseFacility facilityInfo(int facilityNo) {
		return sqlSession.selectOne("FacilityMapper.facilityInfo", facilityNo);
	}

	@Override
	public ArrayList<FacilityPicture> facilityPicture(int facilityNo) {
		System.out.println(facilityNo);
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
	public int instructorRegist(InstructorInfo instructorInfo) {
		return sqlSession.insert("FacilityMapper.instructorRegist", instructorInfo);
	}

	@Override
	public ArrayList<ExerciseFacility> FacilityList(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("FacilityMapper.facilityList", userId, rowBounds);
	}

	@Override
	public ArrayList<FacilityPrice> facilityPriceInfo(int facilityNo) {
		return (ArrayList)sqlSession.selectList("FacilityMapper.facilityPrice", facilityNo);
	}

	@Override
	public int updateFacilityInfo(ExerciseFacility exerciseFacility) {
		return sqlSession.update("FacilityMapper.updateFacilityInfo", exerciseFacility);
	}

	@Override
	public int updateFacilityPicture(FacilityPicture facilityPicture) {
		return sqlSession.insert("FacilityMapper.updateFacilityPicture", facilityPicture);
	}

	@Override
	public int deleteFacilityPictureOne(String pictureRename) {
		return sqlSession.delete("FacilityMapper.deleteFacilityPictureOne", pictureRename);
	}

	@Override
	public ArrayList<String> contentList(HashMap<String, String> facilityInfo) {
		return (ArrayList)sqlSession.selectList("FacilityMapper.selectcontentList", facilityInfo);
	}

//	@Override
//	public int deletePriceSubmit(HashMap<String, Integer> priceHash) {
//		return sqlSession.delete("FacilityMapper.deletePriceSubmit", priceHash);
//	}

	@Override
	public int deletePrices(int facilityNo) {
		return sqlSession.delete("FacilityMapper.deletePrices", facilityNo);
	}

	@Override
	public int facilityPriceModify(FacilityPrice facilityPrice) {
		return sqlSession.insert("FacilityMapper.facilityPriceModify", facilityPrice);
	}

	@Override
	public int deleteFacilityInstructorOne(String instructorRename) {
		return sqlSession.delete("FacilityMapper.deleteFacilityInstructorOne", instructorRename);
	}

	@Override
	public int updateFacilityInstructor(InstructorInfo instructorInfo) {
		return sqlSession.insert("FacilityMapper.updateFacilityInstructor", instructorInfo);
	}

	@Override
	public int modifyFacilityInstructor(InstructorInfo instructorInfo) {
		return sqlSession.update("FacilityMapper.modifyFacilityInstructor", instructorInfo);
	}

	@Override
	public int deleteMyFacility(int facilityNo) {
		System.out.println(facilityNo);
		return sqlSession.delete("FacilityMapper.deleteMyFacility", facilityNo);
	}

	@Override
	public int getMyFacilityListCount(String userId) {
		return sqlSession.selectOne("FacilityMapper.getMyFacilityListCount", userId);
	}

	@Override
	public int getAllFacilityListCount() {
		return sqlSession.selectOne("FacilityMapper.getAllFacilityListCount");
	}

	@Override
	public ArrayList<ExerciseFacility> allFacilityList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("FacilityMapper.allFacilityList", null, rowBounds);
	}

	@Override
	public int termsYnSearchCount(HashMap<String, String> termsYnHash) {
		return sqlSession.selectOne("FacilityMapper.termsYnSearchCount", termsYnHash);
	}

	@Override
	public ArrayList<ExerciseFacility> termsYnSearch(PageInfo pi, HashMap<String, String> termsYnHash) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("FacilityMapper.termsYnSearch", termsYnHash, rowBounds);
	}

	@Override
	public int approvedClick(int facilityNo) {
		return sqlSession.update("FacilityMapper.approvedClick", facilityNo);
	}

	@Override
	public int rejectClick(int facilityNo) {
		return sqlSession.update("FacilityMapper.rejectClick", facilityNo);
	}

	@Override
	public String facilityPictureRename(int facilityNo) {
		return sqlSession.selectOne("FacilityMapper.facilityPictureRename", facilityNo);
	}

}
