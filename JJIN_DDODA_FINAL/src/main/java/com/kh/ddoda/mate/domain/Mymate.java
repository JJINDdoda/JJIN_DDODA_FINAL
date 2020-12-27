package com.kh.ddoda.mate.domain;

public class Mymate {

	private int mateNo;
	private String userId;
	private String mateStatus;
	
	public Mymate() {}

	public Mymate(int mateNo, String userId, String mateStatus) {
		super();
		this.mateNo = mateNo;
		this.userId = userId;
		this.mateStatus = mateStatus;
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

	public String getMateStatus() {
		return mateStatus;
	}

	public void setMateStatus(String mateStatus) {
		this.mateStatus = mateStatus;
	}

	@Override
	public String toString() {
		return "Mymate [mateNo=" + mateNo + ", userId=" + userId + ", mateStatus=" + mateStatus + "]";
	}
}
