package com.kh.ddoda.notice.store;

import java.util.ArrayList;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.notice.domain.Notice;
import com.kh.ddoda.notice.domain.SelectNotice;

public interface NoticeStore {
	/**
	 * 게시글 전체 수 조회
	 * @return
	 */
	public int getListCount();
	
	/**
	 * 공지사항 게시글 전체 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	/**
	 * 공지사항 - 요청사항 게시글 상세조회
	 * @param requireNo
	 * @return
	 */
	public SelectNotice selectNotice(Notice notice);
	
	/**
	 * 공지사항 등록
	 * @param selectNotice
	 * @return
	 */
	public int registerNotice(SelectNotice selectNotice);
	
	/**
	 * 공지사항 게시글 수정
	 * @param require
	 * @return
	 */
	public int modifyNotice(SelectNotice selectNotice);
	
	/**
	 * 공지사항 게시글 삭제
	 * @param requireNo
	 * @return
	 */
	public int deleteNotice(Notice notice);
	
}