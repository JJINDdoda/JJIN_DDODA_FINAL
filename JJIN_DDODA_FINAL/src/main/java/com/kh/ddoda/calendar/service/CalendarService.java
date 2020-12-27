package com.kh.ddoda.calendar.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;

public interface CalendarService {

	/**
	 * 일기 등록 
	 * @param diary
	 * @return
	 */
	public int insertDiary(Opendiary opendiary);
		
	/**
	 * 일기 수정
	 * @param diary
	 * @return
	 */
	public int modifyDiary(Opendiary opendiary);
	/**
	 * 공유일기 수정 시 파일 입력
	 * @param imgfile
	 * @return
	 */
	public int insertfileImgModify(HashMap<String, Object> parameters);
		
	/**
	 * 일기 삭제
	 * @param diaryNo
	 * @return
	 */
	public int deleteDiary(int opendiaryNo);
	
	/**
	 * 일기 상세보기
	 * @param diary
	 * @return
	 */
	public Opendiary selectOneDiary(int opendiaryNo);
	
	/**
	 * 일기 리스트
	 * @param userId
	 */
	public ArrayList<Opendiary> mydiaryList(String userId);
	
	/**
	 * 일기 파일 저장
	 * @param
	 */
	public int insertfileImg(HashMap<String, String> imgfile);
	
	/**
	 * 일기 수정 시 파일 하나씩 삭제
	 * @param map
	 * @return
	 */
	public int deleteFile(HashMap<String, Object> map);
	
	/**
	 * 파일 리스트
	 * @param opendiaryNo
	 */
	public ArrayList<DiaryImg> mydiaryFileList(int opendiaryNo);
	/**
	 * 일기 작성 시 폼 insert 하고 난 뒤 imgRenamePath update하기
	 * @param imgRenamePath
	 * @return
	 */
	public int updateMyDiaryImage(HashMap<String, Object> imgupdate);
	/**
	 * 특정 일기의 Y인 대표이미지 N으로 바꾸기
	 * @return 
	 */
	public int updateMainImg(int opendiaryNo);
	/**
	 * 일기 삭제 시 모든 파일 삭제
	 * @param opendiaryNo
	 */
	public int deleteAllFile(int opendiaryNo);
}
