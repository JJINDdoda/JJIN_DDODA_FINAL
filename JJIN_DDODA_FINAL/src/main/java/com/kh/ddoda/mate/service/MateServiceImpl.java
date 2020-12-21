package com.kh.ddoda.mate.service;

import java.util.ArrayList;

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
		// TODO Auto-generated method stub
		return mStore.getListCount();
	}

	@Override
	public ArrayList<Mate> mateList(PageInfo pi) {
		// TODO Auto-generated method stub
		return mStore.mateList(pi);
	}

	@Override
	public Mate selectOneMate(int mateNo) {
		// TODO Auto-generated method stub
		return mStore.selectOneMate(mateNo);
	}

	@Override
	public int addViewCount(int mateNo) {
		// TODO Auto-generated method stub
		return mStore.addViewCount(mateNo);
	}

	@Override
	public int insertMate(Mate mate) {
		// TODO Auto-generated method stub
		return mStore.insertMate(mate);
	}

	@Override
	public int updateMate(Mate mate) {
		// TODO Auto-generated method stub
		return mStore.updateMate(mate);
	}

	@Override
	public int deleteMate(int mateNo) {
		// TODO Auto-generated method stub
		return mStore.deleteMate(mateNo);
	}

	@Override
	public int finishMate(int mateNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMymate(Mymate myMate) {
		// TODO Auto-generated method stub
		return mStore.insertMymate(myMate);
	}

	@Override
	public int deleteMymate(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Mymate> selectMymate(int mymateNo) {
		// TODO Auto-generated method stub
		return mStore.selectMymate(mymateNo);
	}

	@Override
	public int insertMateCom(MateComment mateCom) {
		// TODO Auto-generated method stub
		return mStore.insertMateCom(mateCom);
	}

	@Override
	public int updateMateCom(MateComment mateCom) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMateCom(int mateComNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Mate> selectSearchList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MateComment> selectMateCom(int mateNo) {
		// TODO Auto-generated method stub
		return mStore.selectMateCom(mateNo);
	}

	@Override
	public int deleteAllmyMate(int mateNo) {
		// TODO Auto-generated method stub
		return mStore.deleteAllmyMate(mateNo);
	}

	@Override
	public int deleteAllMateCom(int mateNo) {
		// TODO Auto-generated method stub
		return mStore.deleteAllMateCom(mateNo);
	}

	@Override
	public int insertMateComReply(MateComment mateCom) {
		// TODO Auto-generated method stub
		return mStore.insertMateComReply(mateCom);
	}

	@Override
	public ArrayList<MateComment> selectMateComReply(int mateComRefNo) {
		// TODO Auto-generated method stub
		return mStore.selectMateComReply(mateComRefNo);
	}

}
