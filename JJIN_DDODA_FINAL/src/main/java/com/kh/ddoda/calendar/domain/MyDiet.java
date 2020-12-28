package com.kh.ddoda.calendar.domain;

public class MyDiet {
	
	private int mydietNo;
	private String mydietmeal;
	private int mydietConsumption;
	private String mydietDate;
	private String userId;
	
	public MyDiet() {
		
	}

	public MyDiet(int mydietNo, String mydietmeal, int mydietConsumption, String mydietDate, String userId) {
		super();
		this.mydietNo = mydietNo;
		this.mydietmeal = mydietmeal;
		this.mydietConsumption = mydietConsumption;
		this.mydietDate = mydietDate;
		this.userId = userId;
	}

	public int getMydietNo() {
		return mydietNo;
	}

	public void setMydietNo(int mydietNo) {
		this.mydietNo = mydietNo;
	}

	public String getMydietmeal() {
		return mydietmeal;
	}

	public void setMydietmeal(String mydietmeal) {
		this.mydietmeal = mydietmeal;
	}

	public int getMydietConsumption() {
		return mydietConsumption;
	}

	public void setMydietConsumption(int mydietConsumption) {
		this.mydietConsumption = mydietConsumption;
	}

	public String getMydietDate() {
		return mydietDate;
	}

	public void setMydietDate(String mydietDate) {
		this.mydietDate = mydietDate;
	}

	public String getUerId() {
		return userId;
	}

	public void setUerId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "MyDiet [mydietNo=" + mydietNo + ", mydietmeal=" + mydietmeal + ", mydietConsumption="
				+ mydietConsumption + ", mydietDate=" + mydietDate + ", uerId=" + userId + "]";
	}
	
}
