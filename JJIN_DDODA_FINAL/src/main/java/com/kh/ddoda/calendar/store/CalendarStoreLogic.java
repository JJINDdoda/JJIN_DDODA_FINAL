package com.kh.ddoda.calendar.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.calendar.domain.Calorie;
import com.kh.ddoda.calendar.domain.Diary;
import com.kh.ddoda.calendar.domain.MemberInfo;
import com.kh.ddoda.calendar.domain.MyCalorie;
import com.kh.ddoda.calendar.domain.MyDiet;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;

@Repository
public class CalendarStoreLogic implements CalendarStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertDiary(Opendiary opendiary) {
		return sqlSession.insert("OpendiaryMapper.insertMyDiary", opendiary);
	}

	@Override
	public int modifyDiary(Opendiary opendiary) {
		return sqlSession.update("OpendiaryMapper.modifyMyDiary", opendiary);
	}

	@Override
	public int deleteDiary(int opendiaryNo) {
		return sqlSession.delete("OpendiaryMapper.deleteMyDiary", opendiaryNo);
	}

	@Override
	public Opendiary selectOneDiary(int opendiaryNo) {
		return sqlSession.selectOne("OpendiaryMapper.selectMyDiary", opendiaryNo);
	}

	@Override
	public int insertfileImg(HashMap<String, String> parameters) {
		return sqlSession.insert("OpendiaryMapper.insertImgFile", parameters);
	}

	@Override
	public int deleteFile(HashMap<String, Object> map) {
		return sqlSession.delete("OpendiaryMapper.deleteMyFile", map);
	}

	@Override
	public ArrayList<Opendiary> mydiaryList(String userId) {
		ArrayList<Opendiary> opendList = (ArrayList)sqlSession.selectList("OpendiaryMapper.mydiaryList", userId);
		System.out.println(opendList+", "+userId);
		return opendList;
	}

	@Override
	public ArrayList<DiaryImg> mydiaryFileList(int opendiaryNo) {
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.mydiaryFileList", opendiaryNo);
	}

	@Override
	public int updateMyDiaryImage(HashMap<String, Object> imgupdate) {
		return sqlSession.update("OpendiaryMapper.updateMyDiaryImage", imgupdate);
	}

	@Override
	public int updateMainImg(int opendiaryNo) {
		return sqlSession.update("OpendiaryMapper.updateMainImg", opendiaryNo);
	}

	@Override
	public int insertfileImgModify(HashMap<String, Object> imgfile) {
		return sqlSession.update("OpendiaryMapper.insertImgFileUpdate", imgfile);
	}

	@Override
	public int deleteAllFile(int opendiaryNo) {
		return sqlSession.delete("OpendiaryMapper.deleteAllFile", opendiaryNo);
	}
	
	@Override
	public int memberInfoInput(MemberInfo memberInfo) {
		return sqlSession.insert("CalendarMapper.memberInfoInput", memberInfo);
	}

	@Override
	public MemberInfo selectMyInfoDate(HashMap<String, String> dataHash) {
		return sqlSession.selectOne("CalendarMapper.selectMyInfoDate", dataHash);
	}

	@Override
	public int updateChangeMyInfo(MemberInfo memberInfo) {
		return sqlSession.update("CalendarMapper.updateChangeMyInfo", memberInfo);
	}

	@Override
	public ArrayList<String> selectCalorie() {
		return (ArrayList)sqlSession.selectList("CalendarMapper.selectCalorie");
	}

	@Override
	public Calorie changeBreakfastFoodName(String foodName) {
		return sqlSession.selectOne("CalendarMapper.changeBreakfastFoodName", foodName);
	}

	@Override
	public ArrayList<Diary> getDiary(String userId) {
		return (ArrayList)sqlSession.selectList("CalendarMapper.getDiary", userId);
	}

	@Override
	public ArrayList<MemberInfo> getMyInfo(String userId) {
		return (ArrayList)sqlSession.selectList("CalendarMapper.getMyInfo", userId);
	}

	@Override
	public ArrayList<HashMap<String, String>> getCalorie(String userId) {
		return (ArrayList)sqlSession.selectList("CalendarMapper.getCalorie", userId);
	}

	@Override
	public ArrayList<MyDiet> getMealKinds(HashMap<String, String> mealHash) {
		return (ArrayList)sqlSession.selectList("CalendarMapper.getMealKinds", mealHash);
	}

	@Override
	public int inputMydiet(MyDiet mydiet) {
		return sqlSession.insert("CalendarMapper.inputMydiet", mydiet);
	}

	@Override
	public int inputMyCalorie(MyCalorie mycalorie) {
		return sqlSession.insert("CalendarMapper.inputMyCalorie", mycalorie);
	}

	@Override
	public ArrayList<MyCalorie> myCalorieGetDate(int mydietNo) {
		return (ArrayList)sqlSession.selectList("CalendarMapper.myCalorieGetDate", mydietNo);
	}
	
	@Override
	public int deleteBreakfastInfo(int mydietNo) {
		sqlSession.delete("CalendarMapper.deleteBreakfastMyCalorie", mydietNo);
		return sqlSession.delete("CalendarMapper.deleteBreakfastMyDiet", mydietNo);
	}



}
