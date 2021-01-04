package com.kh.ddoda.calendar.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.calendar.domain.Calorie;
import com.kh.ddoda.calendar.domain.Diary;
import com.kh.ddoda.calendar.domain.MemberInfo;
import com.kh.ddoda.calendar.domain.MyCalorie;
import com.kh.ddoda.calendar.domain.MyDiet;
import com.kh.ddoda.calendar.store.CalendarStore;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarStore cStore;

	@Override
	public int insertDiary(Opendiary opendiary) {
		return cStore.insertDiary(opendiary);
	}

	@Override
	public int modifyDiary(Opendiary opendiary) {
		return cStore.modifyDiary(opendiary);
	}

	@Override
	public int deleteDiary(int opendiaryNo) {
		return cStore.deleteDiary(opendiaryNo);
	}

	@Override
	public Opendiary selectOneDiary(int opendiaryNo) {
		return cStore.selectOneDiary(opendiaryNo);
	}

	@Override
	public int insertfileImg(HashMap<String, String> parameters) {
		return cStore.insertfileImg(parameters);
	}

	@Override
	public int deleteFile(HashMap<String, Object> map) {
		return cStore.deleteFile(map);
	}

	@Override
	public ArrayList<Opendiary> mydiaryList(String userId) {
		return cStore.mydiaryList(userId);
	}

	@Override
	public ArrayList<DiaryImg> mydiaryFileList(int opendiaryNo) {
		return cStore.mydiaryFileList(opendiaryNo);
	}

	@Override
	public int updateMyDiaryImage(HashMap<String, Object> imgupdate) {
		return cStore.updateMyDiaryImage(imgupdate);
	}

	@Override
	public int updateMainImg(int opendiaryNo) {
		return cStore.updateMainImg(opendiaryNo);
	}

	@Override
	public int insertfileImgModify(HashMap<String, Object> imgfile) {
		return cStore.insertfileImgModify(imgfile);
	}

	@Override
	public int deleteAllFile(int opendiaryNo) {
		return cStore.deleteAllFile(opendiaryNo);
	}
	
	@Override
	public int memberInfoInput(MemberInfo memberInfo) {
		return cStore.memberInfoInput(memberInfo);
	}

	@Override
	public MemberInfo selectMyInfoDate(HashMap<String, String> dataHash) {
		return cStore.selectMyInfoDate(dataHash);
	}

	@Override
	public int updateChangeMyInfo(MemberInfo memberInfo) {
		return cStore.updateChangeMyInfo(memberInfo);
	}

	@Override
	public ArrayList<String> selectCalorie() {
		return cStore.selectCalorie();
	}

	@Override
	public Calorie changeBreakfastFoodName(String foodName) {
		return cStore.changeBreakfastFoodName(foodName);
	}

	@Override
	public ArrayList<Diary> getDiary(String userId) {
		return cStore.getDiary(userId);
	}

	@Override
	public ArrayList<MemberInfo> getMyInfo(String userId) {
		return cStore.getMyInfo(userId);
	}

	@Override
	public ArrayList<HashMap<String, String>> getCalorie(String userId) {
		return cStore.getCalorie(userId);
	}

	@Override
	public ArrayList<MyDiet> getMealKinds(HashMap<String, String> mealHash) {
		return cStore.getMealKinds(mealHash);
	}

	@Override
	public int inputMydiet(MyDiet mydiet) {
		return cStore.inputMydiet(mydiet);
	}

	@Override
	public int inputMyCalorie(MyCalorie mycalorie) {
		return cStore.inputMyCalorie(mycalorie);
	}
	
	@Override
	public ArrayList<MyCalorie> myCalorieGetDate(int mydietNo) {
		return cStore.myCalorieGetDate(mydietNo);
	}
	
	@Override
	public int deleteBreakfastInfo(int mydietNo) {
		return cStore.deleteBreakfastInfo(mydietNo);
	}



}
