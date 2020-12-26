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
	private String userBirth;
	
	public Member() {
		// TODO Auto-generated constructor stub
		
		
		
	}

	//email을 받을 수 있는도록 생성자 만들어주기
	//아이디찾기는 이름. 이메일만 있으면 되고
	
	//비밀번호는 아이디, 이메일
	//public Member(String userId, String passWord) {
		//this.userId = userId;
		//this.passWord = passWord;
	//}


	
	//Member member = new Member("hihi", "123456");//로그인

	public Member(String userId, String passWord, String userName, String gender, String email, String phone,
			String memStatus,String userField,String userBirth) {
		this.userId = userId;
		this.passWord = passWord;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.memStatus = memStatus;	
		this.userField = userField;
		this.userBirth = userBirth;
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
	
	public String getUserBirth() {
		return userBirth;
	}
	
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	
	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", passWord=" + passWord + ", userName=" + userName + ", gender=" + gender
				+ ", email=" + email + ", phone=" + phone + ", memStatus=" + memStatus + ", userField=" + userField
				+ ", userBirth=" + userBirth + "]";
	}



	
	
	
}
