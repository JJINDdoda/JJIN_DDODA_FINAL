package com.kh.ddoda.calorie.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.calorie.domain.Calorie;
import com.kh.ddoda.calorie.store.CalorieStore;
import com.kh.ddoda.common.PageInfo;

@Service
public class CalorieServiceImpl implements CalorieService {
	
	@Autowired
	private CalorieStore cStore;
	
	@Override
	public int getCalorieListCount() {
		return cStore.getCalorieListCount();
	}

	@Override
	public ArrayList<Calorie> adminCalorieList(PageInfo pi) {
		return cStore.adminCalorieList(pi);
	}

	@Override
	public Calorie adminSelectCalorie(int calorieNo) {
		return cStore.adminSelectCalorie(calorieNo);
	}

	@Override
	public int adminInsertCalorie(Calorie calorie) {
		return cStore.adminInsertCalorie(calorie);
	}

	@Override
	public int adminModifyCalorie(Calorie calorie) {
		return cStore.adminModifyCalorie(calorie);
	}

	@Override
	public int adminDeleteCalorie(int calorieNo) {
		return cStore.adminDeleteCalorie(calorieNo);
	}
}