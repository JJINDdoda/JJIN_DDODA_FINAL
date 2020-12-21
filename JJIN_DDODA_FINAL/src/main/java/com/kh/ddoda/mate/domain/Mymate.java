package com.kh.ddoda.mate.domain;

public class Mymate {

	private int mateNo;
	private String userId;
	
	public Mymate() {}

	public Mymate(int mateNo, String userId) {
		super();
		this.mateNo = mateNo;
		this.userId = userId;
	}

	public int getMateNo() {
		return mateNo;
	}

	public void setMateNo(int mateNo) {
		this.mateNo = mateNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Mymate [mateNo=" + mateNo + ", userId=" + userId + "]";
	}
	
	
}
