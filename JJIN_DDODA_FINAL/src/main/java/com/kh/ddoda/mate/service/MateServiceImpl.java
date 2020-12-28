package com.kh.ddoda.mate.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.MateComment;
import com.kh.ddoda.mate.domain.Mymate;
import com.kh.ddoda.mate.store.MateStore;

@Service
public class MateServiceImpl implements MateService{

	@Autowired
	private MateStore mStore;
	
	@Override
	public int getListCount() {
		return mStore.getListCount();
	}

	@Override
	public ArrayList<Mate> mateList(HashMap<String, String> map, PageInfo pi) {
		return mStore.mateList(map, pi);
	}

	@Override
	public Mate selectOneMate(int mateNo) {
		return mStore.selectOneMate(mateNo);
	}

	@Override
	public int addViewCount(int mateNo) {
		return mStore.addViewCount(mateNo);
	}

	@Override
	public int insertMate(Mate mate) {
		return mStore.insertMate(mate);
	}

	@Override
	public int updateMate(Mate mate) {
		return mStore.updateMate(mate);
	}

	@Override
	public int deleteMate(int mateNo) {
		return mStore.deleteMate(mateNo);
	}

	@Override
	public int finishMate(int mateNo) {
		return mStore.finishMate(mateNo);
	}

	@Override
	public int insertMymate(Mymate myMate) {
		return mStore.insertMymate(myMate);
	}

	@Override
	public int deleteMymate(String userId) {
		return 0;
	}

	@Override
	public ArrayList<Mymate> selectMymate(int mymateNo) {
		return mStore.selectMymate(mymateNo);
	}

	@Override
	public int insertMateCom(MateComment mateCom) {
		return mStore.insertMateCom(mateCom);
	}

	@Override
	public int updateMateCom(MateComment mateCom) {
		return 0;
	}

	@Override
	public int deleteMateCom(int mateComNo) {
		return mStore.deleteMateCom(mateComNo);
	}

	@Override
	public ArrayList<Mate> selectSearchList(Search search, PageInfo pi) {
		return mStore.selectSearchList(search, pi);
	}

	@Override
	public ArrayList<MateComment> selectMateCom(int mateNo, PageInfo pi) {
		return mStore.selectMateCom(mateNo, pi);
	}

	@Override
	public int deleteAllmyMate(int mateNo) {
		return mStore.deleteAllmyMate(mateNo);
	}

	@Override
	public int deleteAllMateCom(int mateNo) {
		return mStore.deleteAllMateCom(mateNo);
	}

	@Override
	public int insertMateComReply(MateComment mateCom) {
		return mStore.insertMateComReply(mateCom);
	}

	@Override
	public ArrayList<MateComment> selectMateComReply(HashMap<String, Object> map) {
		return mStore.selectMateComReply(map);
	}

	@Override
	public ArrayList<MateComment> selectMateComNo(int mateNo) {
		return mStore.selectMateComNo(mateNo);
	}

	@Override
	public int deleteMateComReply(int mateComeNo) {
		return mStore.deleteMateComReply(mateComeNo);
	}

	@Override
	public ArrayList<Mate> myMateAttendList(String userId, PageInfo pi) {
		ArrayList<Mate> myMateAttendList = mStore.myMateAttendList(userId, pi);
//		System.out.println("serviceImpl : "+myMateAttendList);
		return myMateAttendList;
	}

	@Override
	public int mymateOut(Mymate mymate) {
		return mStore.mymateOut(mymate);
	}

	@Override
	public ArrayList<Mate> myContentsList(String userId, PageInfo pi) {
		return mStore.myContentsList(userId, pi);
	}

	@Override
	public int getComListCount() {
		return mStore.getComListCount();
	}

	

}
