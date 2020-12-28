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
		return odStore.getListCount();
	}

	@Override
	public ArrayList<Opendiary> opendList(PageInfo pi) {
		return odStore.opendList(pi);
	}
	
	@Override
	public ArrayList<DiaryImg> diaryImgList() {
		return odStore.diaryImgList();
	}

	@Override
	public Opendiary selectOneOpend(int opendiaryNo) {
		return odStore.selectOneOpend(opendiaryNo);
	}

	@Override
	public int insertOpend(Opendiary opendiary) {
		return odStore.insertOpend(opendiary);
	}
	
	//사진을 넣어준다.
	public int insertfileImg(HashMap<String, String> imgfile) {
		return odStore.insertfileImg(imgfile);
	}

	@Override
	public int updateOpend(Opendiary opendiary) {
		return odStore.updateOpend(opendiary);
	}

	@Override
	public int deleteOpend(int opendiaryNo) {
		return odStore.deleteOpend(opendiaryNo);
	}

	@Override
	public int insertOpendCom(OpendiaryComment opendiaryComment) {
		return odStore.insertOpendCom(opendiaryComment);
	}

	@Override
	public int updateOpendCom(OpendiaryComment opendiaryCom) {
		return 0;
	}

	@Override
	public int deleteOpendCom(int openComNo) {
		return odStore.deleteOpendCom(openComNo);
	}

	@Override
	public ArrayList<Opendiary> selectSearchList(Search search, PageInfo pi) {
		return odStore.selectSearchList(search, pi);
	}

	@Override
	public int addViewCount(int opendiaryNo) {
		return odStore.addViewCount(opendiaryNo);
	}

	@Override
	public ArrayList<DiaryImg> selectDiaryImgList(int opendiaryNo) {
		return odStore.selectDiaryImgList(opendiaryNo);
	}

	@Override
	public int deleteFile(HashMap<String, Object> map) {
		return odStore.deleteFile(map);
	}

	@Override
	public int deleteAllFile(int opendiaryNo) {
		return odStore.deleteAllFile(opendiaryNo);
	}

	@Override
	public int insertfileImgUpdate(HashMap<String, Object> imgfile) {
		return odStore.insertfileImgUpdate(imgfile);
	}

	@Override
	public DiaryImg diaryImgListNo(int opendiaryNo) {
		return odStore.diaryImgListNo(opendiaryNo);
	}

	@Override
	public int updateMainImg(int opendiaryNo) {
		return odStore.updateMainImg(opendiaryNo);
	}

	@Override
	public ArrayList<OpendiaryComment> opendiaryComList(int opendiaryNo, PageInfo pi) {
		return odStore.opendiaryComList(opendiaryNo, pi);
	}

	@Override
	public int insertOpenComReply(OpendiaryComment opendiaryCom) {
		return odStore.insertOpenComReply(opendiaryCom);
	}

	@Override
	public ArrayList<OpendiaryComment> opendiaryComReplyList(HashMap<String, Object> map) {
		return odStore.opendiaryComReplyList(map);
	}


	@Override
	public int updateOpendImage(HashMap<String, Object> imgupdate) {
		return odStore.updateOpendImage(imgupdate);
	}

	@Override
	public ArrayList<Opendiary> openContentsList(String userId, PageInfo pi) {
		return odStore.openContentsList(userId, pi);
	}

	@Override
	public int getComReplyListCount() {
		return odStore.getComReplyListCount();
	}


//	@Override
//	public int selectOneOpendiaryNo() {
//		// TODO Auto-generated method stub
//		return odStore.selectOneOpendiaryNo();
//	}

}
