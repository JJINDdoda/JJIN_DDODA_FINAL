package com.kh.ddoda.member.domain;

public class Member {

	private String userId;
	private String passWord;
	private String userName;
	private String gender;
	private String email;
	private String phone;
	private String memStatus;
	private String userField;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
		
		
		
	}


	public Member(String userId, String passWord) {
		super();
		this.userId = userId;
		this.passWord = passWord;
	}


	public Member(String userId, String passWord, String userName, String gender, String email, String phone,
			String memStatus, String userField) {
		super();
		this.userId = userId;
		this.passWord = passWord;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.memStatus = memStatus;
		this.userField = userField;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPassWord() {
		return passWord;
	}


	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getMemStatus() {
		return memStatus;
	}


	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}


	public String getUserField() {
		return userField;
	}


	public void setUserField(String userField) {
		this.userField = userField;
	}


	@Override
	public String toString() {
		return "Member [userId=" + userId + ", passWord=" + passWord + ", userName=" + userName + ", gender=" + gender
				+ ", email=" + email + ", phone=" + phone + ", memStatus=" + memStatus + ", userField=" + userField
				+ "]";
	}

	
}
