package com.kh.ddoda.calendar.domain;

public class Calorie {
	
	private int calorieNo;
	private String foodName;
	private int kcal;
	private int foodAmount;
	private String unit;
	
	public Calorie() {
		
	}

	public Calorie(int calorieNo, String foodName, int kcal, int foodAmount, String unit) {
		super();
		this.calorieNo = calorieNo;
		this.foodName = foodName;
		this.kcal = kcal;
		this.foodAmount = foodAmount;
		this.unit = unit;
	}

	public int getCalorieNo() {
		return calorieNo;
	}

	public void setCalorieNo(int calorieNo) {
		this.calorieNo = calorieNo;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getFoodAmount() {
		return foodAmount;
	}

	public void setFoodAmount(int foodAmount) {
		this.foodAmount = foodAmount;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public String toString() {
		return "Calorie [calorieNo=" + calorieNo + ", foodName=" + foodName + ", kcal=" + kcal + ", foodAmount="
				+ foodAmount + ", unit=" + unit + "]";
	}

}
