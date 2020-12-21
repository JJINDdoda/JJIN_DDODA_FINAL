package com.kh.ddoda.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.notice.domain.Notice;
import com.kh.ddoda.notice.domain.SelectNotice;
import com.kh.ddoda.notice.store.NoticeStore;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.require.domain.Require;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeStore nStore;
	
	@Override
	public int getListCount() {
		return nStore.getListCount();
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nStore.selectNoticeList(pi);
	}
	
	@Override
	public SelectNotice selectNotice(Notice notice) {
		return nStore.selectNotice(notice);
	}

	@Override
	public int registerRequire(Require require) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerMate(Mate mate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerDiary(Opendiary diary) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyRequire(Require require) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyMate(Mate mate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyDiary(Opendiary diary) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRequire(int requireNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMate(int mateNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDiary(int openDiaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
