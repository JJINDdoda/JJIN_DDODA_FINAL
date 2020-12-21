package com.kh.ddoda.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.notice.domain.Notice;
import com.kh.ddoda.notice.domain.SelectNotice;
import com.kh.ddoda.notice.store.NoticeStore;

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
	public int registerNotice(SelectNotice selectNotice) {
		return nStore.registerNotice(selectNotice);
	}

	@Override
	public int modifyNotice(SelectNotice selectNotice) {
		return nStore.modifyNotice(selectNotice);
	}

	@Override
	public int deleteNotice(Notice notice) {
		return nStore.deleteNotice(notice);
	}
}
