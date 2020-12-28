package com.kh.ddoda.opendiary.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.opendiary.domain.OpendiaryComment;

public interface OpendiaryStore {


	/**
	 * 공유일기 전체 수 조회
	 * @return
	 */
	public int getListCount();
	/**
	 * 공유일기 댓글 전체 수 조회
	 * @return
	 */
	public int getComReplyListCount();
	/**
	 * 공유일기 전체 조회
	 * @return
	 */
	public ArrayList<Opendiary> opendList(PageInfo pi);
	/**
	 * 공유일기 전체 조회 시 사진 전제 조회
	 * @return
	 */
	public ArrayList<DiaryImg> diaryImgList();
	/**
	 * 공유일기 상세보기
	 * @param opendiaryNo
	 * @return
	 */
	public Opendiary selectOneOpend(int opendiaryNo);
	/**
	 * 공유일기 상세보기 시 해당 공유일기 사진 리스트
	 * @return
	 */
	public ArrayList<DiaryImg> selectDiaryImgList(int opendiaryNo);
	/**
	 * 공유일기 등록
	 * @param opendiary
	 * @return
	 */
	public int insertOpend(Opendiary opendiary);
	/**
	 * 공유일기 수정
	 * @param opendiary
	 * @return
	 */
	public int updateOpend(Opendiary opendiary);
	/**
	 * 공유일기 삭제
	 * @param opendiaryNo
	 * @return
	 */
	public int deleteOpend(int opendiaryNo);
	/**
	 * 공유일기 해당 파일 모두 삭제
	 * @param opendiaryNo
	 * @return
	 */
	public int deleteAllFile(int opendiaryNo);
	/**
	 * 공유일기 댓글 입력
	 * @param opendiaryCom 
	 * @return
	 */
	public int insertOpendCom(OpendiaryComment opendiaryComment);
	/**
	 * 공유일기 댓글 수정
	 * @param opendiaryCom
	 * @return
	 */
	public int updateOpendCom(OpendiaryComment opendiaryCom);
	/**
	 * 공유일기 댓글 삭제
	 * @param opendiaryNo
	 * @return
	 */
	public int deleteOpendCom(int openComNo);

	/**
	 * 공유일기 검색
	 * @param search
	 * @return
	 */
	public ArrayList<Opendiary> selectSearchList(Search search, PageInfo pi);
	
	
	public int insertfileImg(HashMap<String, String> imgfile);
	
	/**
	 * 공유일기 상세보기 시 조회수 증가
	 * @param opendiaryNo
	 * @return
	 */
	public int addViewCount(int opendiaryNo);
	/**
	 * 공유일기 수정 시 파일 하나씩 삭제
	 * @param map
	 * @return
	 */
	public int deleteFile(HashMap<String, Object> map);
	/**
	 * 공유일기 수정 시 파일 입력
	 * @param imgfile
	 * @return
	 */
	public int insertfileImgUpdate(HashMap<String, Object> imgfile);
	/**
	 * 특정 공유일기의 Y인 대표이미지 정보 가져오기
	 * @return
	 */
	public DiaryImg diaryImgListNo(int opendiaryNo);
	/**
	 * 특정 공유일기의 Y인 대표이미지 N으로 바꾸기
	 * @return 
	 */
	public int updateMainImg(int opendiaryNo);
	/**
	 * 특정
	 */
	public ArrayList<OpendiaryComment> opendiaryComList (int opendiaryNo, PageInfo pi);
	/**
	 * 공유일기 대댓글 작성
	 * @param opendiaryCom
	 * @return int
	 */
	public int insertOpenComReply(OpendiaryComment opendiaryCom);
	/**
	 * 공유일기 대댓글 리스트
	 * @param map
	 * @return ArrayList
	 */
	public ArrayList<OpendiaryComment> opendiaryComReplyList(HashMap<String, Object> map);
	/**
	 * 공유일기 작성 시 폼 insert 하고 난 뒤 imgRenamePath update하기
	 * @param imgRenamePath
	 * @return
	 */
	public int updateOpendImage(HashMap<String, Object> imgupdate);
	/**
	 * 마이페이지 공유일기 리스트 확인
	 * @param userId
	 * @param pi
	 * @return
	 */
	public ArrayList<Opendiary> openContentsList(String userId, PageInfo pi);
//	/**
//	 * 공유일기 파일만들 때 넘버 가져오기
//	 * @return
//	 */
//	public int selectOneOpendiaryNo();
}
