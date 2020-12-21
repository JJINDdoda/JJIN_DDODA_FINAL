package com.kh.ddoda.mate.domain;

import java.sql.Date;

public class MateComment {

	private int mateComNo;
	private String mateComRefNo;
	private String mateComContents;
	private Date mateComDate;
	private Date mateComModifyDate;
	private int mateNo;
	private String userId;
	
	public MateComment() {}
	
	public MateComment(int mateComNo, String mateComRefNo, String mateComContents, Date mateComDate,
			Date mateComModifyDate, int mateNo, String userId) {
		super();
		this.mateComNo = mateComNo;
		this.mateComRefNo = mateComRefNo;
		this.mateComContents = mateComContents;
		this.mateComDate = mateComDate;
		this.mateComModifyDate = mateComModifyDate;
		this.mateNo = mateNo;
		this.userId = userId;
	}
	public int getMateComNo() {
		return mateComNo;
	}
	public void setMateComNo(int mateComNo) {
		this.mateComNo = mateComNo;
	}
	public String getMateComRefNo() {
		return mateComRefNo;
	}
	public void setMateComRefNo(String mateComRefNo) {
		this.mateComRefNo = mateComRefNo;
	}
	public String getMateComContents() {
		return mateComContents;
	}
	public void setMateComContents(String mateComContents) {
		this.mateComContents = mateComContents;
	}
	public Date getMateComDate() {
		return mateComDate;
	}
	public void setMateComDate(Date mateComDate) {
		this.mateComDate = mateComDate;
	}
	public Date getMateComModifyDate() {
		return mateComModifyDate;
	}
	public void setMateComModifyDate(Date mateComModifyDate) {
		this.mateComModifyDate = mateComModifyDate;
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
		return "MateComment [mateComNo=" + mateComNo + ", mateComRefNo=" + mateComRefNo + ", mateComContents="
				+ mateComContents + ", mateComDate=" + mateComDate + ", mateComModifyDate=" + mateComModifyDate
				+ ", mateNo=" + mateNo + ", userId=" + userId + "]";
	}
	
	
}
