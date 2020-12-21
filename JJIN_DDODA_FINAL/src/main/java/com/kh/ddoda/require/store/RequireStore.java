package com.kh.ddoda.require.store;

import java.util.ArrayList;

import com.kh.ddoda.common.PageInfo;
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
}
