package com.kh.ddoda.calendar.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
