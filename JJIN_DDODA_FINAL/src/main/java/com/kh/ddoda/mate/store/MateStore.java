package com.kh.ddoda.mate.store;

import java.util.ArrayList;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.MateComment;
import com.kh.ddoda.mate.domain.Mymate;

public interface MateStore {


	/**
	 * 메이트 전체 수 조회
	 * @return
	 */
	public int getListCount();
	/**
	 * 메이트 전체 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Mate> mateList(PageInfo pi);
	/**
	 * 메이트 상세 조회
	 * @param mateNo
	 * @return
	 */
	public Mate selectOneMate(int mateNo);
	/**
	 * 메이트 상세조회 시 조회수 증가
	 * @param mateNo
	 * @return
	 */
	public int addViewCount(int mateNo);
	/**
	 * 메이트 등록
	 * @param mate
	 * @return
	 */
	public int insertMate(Mate mate);
	/**
	 * 메이트 수정
	 * @param mate
	 * @return
	 */
	public int updateMate(Mate mate);
	/**
	 * 메이트 삭제
	 * @param mateNo
	 * @return
	 */
	public int deleteMate(int mateNo);
	/**
	 * 메이트 삭제 시 마이메이트들도 모두 삭제
	 * @param mateNo
	 * @return
	 */
	public int deleteAllmyMate(int mateNo);
	/**
	 * 메이트 삭제 시 댓글들도 모두 삭제
	 * @param mateNo
	 * @return
	 */
	public int deleteAllMateCom(int mateNo);
	/**
	 * 메이트 모집인원 다 찾을 때 종료
	 * @param mateNo
	 * @return
	 */
	public int finishMate(int mateNo);
	/**
	 * 메이트 참여 시 삽입
	 * @param myMate
	 * @return
	 */
	public int insertMymate(Mymate myMate);
	/**
	 * 메이트 참여 시 빠지고 싶을 때 삭제
	 * @param userId
	 * @return
	 */
	public int deleteMymate(String userId);
	/**
	 * 메이트 참여 한 아이디 조회
	 * @param mateNo
	 * @return
	 */
	public ArrayList<Mymate> selectMymate(int mymateNo);
	/**
	 * 메이트 댓글 삽입
	 * @param mateCom
	 * @return
	 */
	public int insertMateCom(MateComment mateCom);
	/**
	 * 메이트 대댓글 삽입
	 * @param mateCom
	 * @return
	 */
	public int insertMateComReply(MateComment mateCom);
	/**
	 * 메이트 댓글 수정
	 * @param mateCom
	 * @return
	 */
	public int updateMateCom(MateComment mateCom);
	/**
	 * 메이트 댓글 리스트
	 * @param mateCom
	 * @return
	 */
	public ArrayList<MateComment> selectMateCom(int mateNo);
	/**
	 * 메이트 대댓글 리스트
	 * @param mateRefNo
	 * @return
	 */
	public ArrayList<MateComment> selectMateComReply(int mateComRefNo);
	/**
	 * 메이트 댓글 삭제
	 * @param mateComNo
	 * @return
	 */
	public int deleteMateCom(int mateComNo);
	/**
	 * 메이트 글 검색하기
	 * @param search
	 * @return
	 */
	public ArrayList<Mate> selectSearchList(Search search);
}
