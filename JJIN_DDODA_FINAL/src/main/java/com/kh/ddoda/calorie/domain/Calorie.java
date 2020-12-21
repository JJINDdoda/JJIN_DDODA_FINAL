package com.kh.ddoda.calorie.domain;

public class Calorie {

	private int calorieNo;
	private String foodName;
	private int kcal;
	private int protein;
	private int carbo;
	private int fat;
	private int natrium;
	private int sacCharide;
	
	public Calorie() {
		super();
	}

	public Calorie(int calorieNo, String foodName, int kcal, int protein, int carbo, int fat, int natrium,
			int sacCharide) {
		super();
		this.calorieNo = calorieNo;
		this.foodName = foodName;
		this.kcal = kcal;
		this.protein = protein;
		this.carbo = carbo;
		this.fat = fat;
		this.natrium = natrium;
		this.sacCharide = sacCharide;
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

	public int getSacCharide() {
		return sacCharide;
	}

	public void setSacCharide(int sacCharide) {
		this.sacCharide = sacCharide;
	}

	@Override
	public String toString() {
		return "Calorie [calorieNo=" + calorieNo + ", foodName=" + foodName + ", kcal=" + kcal + ", protein=" + protein
				+ ", carbo=" + carbo + ", fat=" + fat + ", natrium=" + natrium + ", sacCharide=" + sacCharide + "]";
	}
}