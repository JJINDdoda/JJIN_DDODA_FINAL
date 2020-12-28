package com.kh.ddoda.calendar.domain;


public class MemberInfo {
	
	private int userInfoNo;
	private String userId;
	private int height;
	private int weight;
	private String bmi;
	private String changeDate;
	
	public MemberInfo() {
		
	}
	
	public MemberInfo(int userInfoNo, String userId, int height, int weight, String bmi, String changeDate) {
		super();
		this.userInfoNo = userInfoNo;
		this.userId = userId;
		this.height = height;
		this.weight = weight;
		this.bmi = bmi;
		this.changeDate = changeDate;
	}

	public int getUserInfoNo() {
		return userInfoNo;
	}

	public void setUserInfoNo(int userInfoNo) {
		this.userInfoNo = userInfoNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getBmi() {
		return bmi;
	}

	public void setBmi(String bmi) {
		this.bmi = bmi;
	}

	public String getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}

	@Override
	public String toString() {
		return "MemberInfo [userInfoNo=" + userInfoNo + ", userId=" + userId + ", height=" + height + ", weight="
				+ weight + ", bmi=" + bmi + ", changeDate=" + changeDate + "]";
	}
	
}
