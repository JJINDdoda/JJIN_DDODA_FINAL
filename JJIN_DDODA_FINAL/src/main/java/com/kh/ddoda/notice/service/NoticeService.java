package com.kh.ddoda.notice.service;

import java.util.ArrayList;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.notice.domain.Notice;
import com.kh.ddoda.notice.domain.SelectNotice;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.require.domain.Require;

public interface NoticeService {
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
	 * 공지사항 - 요청사항 게시글 등록
	 * @param require
	 * @return
	 */
	public int registerRequire(Require require);
	
	/**
	 * 공지사항 - 메이트모집 게시글 등록
	 * @param mate
	 * @return
	 */
	public int registerMate(Mate mate);
	
	/**
	 * 공지사항 - 식단공유 게시글 등록
	 * @param diary
	 * @return
	 */
	public int registerDiary(Opendiary diary);
	
	/**
	 * 공지사항 - 요청사항 게시글 수정
	 * @param require
	 * @return
	 */
	public int modifyRequire(Require require);
	
	/**
	 * 공지사항 - 메이트모집 게시글 수정
	 * @param mate
	 * @return
	 */
	public int modifyMate(Mate mate);
	
	/**
	 * 공지사항 - 식단공유 게시글 수정
	 * @param diary
	 * @return
	 */
	public int modifyDiary(Opendiary diary);
	
	/**
	 * 공지사항 - 요청사항 게시글 삭제
	 * @param requireNo
	 * @return
	 */
	public int deleteRequire(int requireNo);
	
	/**
	 * 공지사항 - 메이트모집 게시글 삭제
	 * @param mateNo
	 * @return
	 */
	public int deleteMate(int mateNo);
	
	/**
	 * 공지사항 - 식단공유 게시글 삭제
	 * @param openDiaryNo
	 * @return
	 */
	public int deleteDiary(int openDiaryNo);
}