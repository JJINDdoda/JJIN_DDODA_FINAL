package com.kh.ddoda.calendar.domain;

public class MyCalorie {
	private int calorieNo;
	private String foodName;
	private int kcal;
	private int protein;
	private int carbo;
	private int fat;
	private int natrium;
	private int saccharide;
	private String foodAmount;
	
	public MyCalorie() {}
	
	

	public MyCalorie(int calorieNo, String foodName, int kcal, int protein, int carbo, int fat, int natrium,
			int saccharide, String amount) {
		super();
		this.calorieNo = calorieNo;
		this.foodName = foodName;
		this.kcal = kcal;
		this.protein = protein;
		this.carbo = carbo;
		this.fat = fat;
		this.natrium = natrium;
		this.saccharide = saccharide;
		this.foodAmount = amount;
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

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getCarbo() {
		return carbo;
	}

	public void setCarbo(int carbo) {
		this.carbo = carbo;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getNatrium() {
		return natrium;
	}

	public void setNatrium(int natrium) {
		this.natrium = natrium;
	}

	public int getSaccharide() {
		return saccharide;
	}

	public void setSaccharide(int saccharide) {
		this.saccharide = saccharide;
	}

	public String getFoodAmount() {
		return foodAmount;
	}

	public void setFoodAmount(String amount) {
		this.foodAmount = amount;
	}

	@Override
	public String toString() {
		return "MyCalorie [calorieNo=" + calorieNo + ", foodName=" + foodName + ", kcal=" + kcal + ", protein="
				+ protein + ", carbo=" + carbo + ", fat=" + fat + ", natrium=" + natrium + ", saccharide=" + saccharide
				+ ", amount=" + foodAmount + "]";
	}
	
	
}
