package com.kh.ddoda.require.store;

import java.util.ArrayList;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.require.domain.Reply;
import com.kh.ddoda.require.domain.Require;

public interface RequireStore {
	
	/**
	 * 게시글 전체 수 조회
	 * @return
	 */
	public int getRequireListCount();
	
	/**
	 * 관리자 요구사항 전체목록 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Require> adminSelectList(PageInfo pi);
	
	/**
	 * 관리자 요구사항 상세조회
	 * @param requireNo
	 * @return
	 */
	public Require adminSelectRequire(int requireNo);
	
	/**
	 * 관리자 요구사항 특정 게시글의 답변 상세조회
	 * @param rComNo
	 * @return
	 */
	public Reply adminRequireReply(int requireNo);
	
	/**
	 * 관리자 요구사항 답변 작성
	 * @param reply
	 * @return
	 */
	public int insertRequireReply(Reply reply);
	
	/**
	 * 관리자 답변 작성 후 상태변화
	 * @param requireNo
	 * @return
	 */
	public int adminRequireStatus(int requireNo);
	
	/**
	 * 관리자 요구사항 게시글 수정
	 * @param require
	 * @return
	 */
	public int adminModifyRequire(Require require);
	
	/**
	 * 관리자 요구사항 특정 게시글의 답변 수정
	 * @param reply
	 * @return
	 */
	public int adminModifyRequireReply(Reply reply);
	
	/**
	 * 관리자 요구사항 게시글 삭제
	 * @param requireNo
	 * @return
	 */
	public int adminDeleteRequire(int requireNo);
	
	//
	/**
	 * 요구사항 전체 수 조회
	 * @return
	 */
	public int getListCount();
	/**
	 * 요구사항 전체 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Require> requireList(PageInfo pi);
	/**
	 * 요구사항 상세보기
	 * @param requireNo
	 * @return
	 */
	public Require selectOneRequire(int requireNo);
	/**
	 * 요구사항 삽입
	 * @param require
	 * @return
	 */
	public int insertRequire(Require require);
	/**
	 * 요구사항 삭제
	 * @param requireNo
	 * @return
	 */
	public int deleteRequire(int requireNo);
	/**
	 * 요구사항 수정
	 * @param requireNo
	 * @return
	 */
	public int updateRequire(Require require);
	/**
	 * 요구사항 검색
	 * @param requireNo
	 * @return
	 */
	public ArrayList<Require> selectSearchList(Search search, PageInfo pi);
	/**
	 * 요구사항 상세조회 시 조회수 증가
	 * @param requireNo
	 * @return
	 */
	public int addReadCount (int requireNo);
	/**
	 * 마이페이지 문의사항 리스트
	 * @param userId
	 * @param pi
	 * @return
	 */
	public ArrayList<Require> requireContentsList(String userId, PageInfo pi);
}
