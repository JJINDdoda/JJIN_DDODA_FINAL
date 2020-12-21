package com.kh.ddoda.require.domain;

import java.sql.Date;

public class Reply {
	
	private int rComNo;
	private Date rComDate;
	private Date rComModifyDate;
	private String rComContents;
	private String userId;
	private int requireNo;
	private String rComTitle;
	
	public Reply() {
		super();
	}

	public Reply(int rComNo, Date rComDate, Date rComModifyDate, String rComContents, String userId, int requireNo, String rComTitle) {
		super();
		this.rComNo = rComNo;
		this.rComDate = rComDate;
		this.rComModifyDate = rComModifyDate;
		this.rComContents = rComContents;
		this.userId = userId;
		this.requireNo = requireNo;
		this.rComTitle = rComTitle;
	}

	public int getrComNo() {
		return rComNo;
	}

	public void setrComNo(int rComNo) {
		this.rComNo = rComNo;
	}

	public Date getrComDate() {
		return rComDate;
	}

	public void setrComDate(Date rComDate) {
		this.rComDate = rComDate;
	}

	public Date getrComModifyDate() {
		return rComModifyDate;
	}

	public void setrComModifyDate(Date rComModifyDate) {
		this.rComModifyDate = rComModifyDate;
	}

	public String getrComContents() {
		return rComContents;
	}

	public void setrComContents(String rComContents) {
		this.rComContents = rComContents;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRequireNo() {
		return requireNo;
	}

	public void setRequireNo(int requireNo) {
		this.requireNo = requireNo;
	}
	
	public String getrComTitle() {
		return rComTitle;
	}
	
	public void setrComTitle(String rComTitle) {
		this.rComTitle = rComTitle;
	}

	@Override
	public String toString() {
		return "Reply [rComNo=" + rComNo + ", rComDate=" + rComDate + ", rComModifyDate=" + rComModifyDate
				+ ", rComContents=" + rComContents + ", userId=" + userId + ", requireNo=" + requireNo + ", rComTitle=" + rComTitle + "]";
	}
}
