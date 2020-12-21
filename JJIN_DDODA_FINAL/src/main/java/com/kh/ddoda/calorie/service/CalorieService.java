package com.kh.ddoda.calorie.service;

import java.util.ArrayList;

import com.kh.ddoda.calorie.domain.Calorie;
import com.kh.ddoda.common.PageInfo;

public interface CalorieService {
	
	/**
	 * 관리자 게시판 전체 수 조회
	 * @return
	 */
	public int getCalorieListCount();
	
	/**
	 * 관리자 게시판 전체 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Calorie> adminCalorieList(PageInfo pi);
	
	/**
	 * 관리자 음식 칼로리 상세 조회
	 * @param calorieNo
	 * @return
	 */
	public Calorie adminSelectCalorie(int calorieNo);
	
	/**
	 * 관리자 음식 칼로리 추가
	 * @param calorie
	 * @return
	 */
	public int adminInsertCalorie(Calorie calorie);
	
	/**
	 * 관리자 음식 칼로리 수정
	 * @param calorie
	 * @return
	 */
	public int adminModifyCalorie(Calorie calorie);
	
	/**
	 * 관리자 음식 칼로리 삭제
	 * @param calorie
	 * @return
	 */
	public int adminDeleteCalorie(int calorieNo);
}