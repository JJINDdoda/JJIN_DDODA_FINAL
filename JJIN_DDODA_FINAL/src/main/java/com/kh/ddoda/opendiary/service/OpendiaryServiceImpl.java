package com.kh.ddoda.opendiary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.opendiary.domain.OpendiaryComment;
import com.kh.ddoda.opendiary.store.OpendiaryStore;
@Service
public class OpendiaryServiceImpl implements OpendiaryService{

	@Autowired
	private OpendiaryStore odStore;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return odStore.getListCount();
	}

	@Override
	public ArrayList<Opendiary> opendList(PageInfo pi) {
		// TODO Auto-generated method stub
		return odStore.opendList(pi);
	}

	@Override
	public Opendiary selectOndOpend(int opendiaryNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertOpend(Map<String, Object> parameters) {
		// TODO Auto-generated method stub
		return odStore.insertOpend(parameters);
	}

	@Override
	public int updateOpend(Opendiary opendiary) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOpend(int opendiaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertOpendCom(OpendiaryComment opendiaryCom) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOpendCom(OpendiaryComment opendiaryCom) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOpendCom(int opendiaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Opendiary> selectSearchList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}


	//다이어리에 넣어준다.
	public int insertDiary(Opendiary opendiary) {
		return odStore.insertDiary(opendiary);
	}
	//사진을 넣어준다.
	public int insertfileImg(HashMap<String, String> imgfile) {
		return odStore.insertfileImg(imgfile);
	}
}
