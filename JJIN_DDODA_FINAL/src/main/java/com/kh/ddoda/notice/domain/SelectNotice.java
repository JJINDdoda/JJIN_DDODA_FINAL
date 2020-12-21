package com.kh.ddoda.notice.domain;

import java.sql.Date;

public class SelectNotice {
	private int sNoticeNo;
	private String sNoticeTitle;
	private String sNoticeContents;
	private Date sNoticeDate;
	private String userId;
	private String sSearchCondition;
	
	public SelectNotice() {
		super();
	}

	public SelectNotice(int sNoticeNo, String sNoticeTitle, String sNoticeContents, Date sNoticeDate, String userId, String sSearchCondition) {
		super();
		this.sNoticeNo = sNoticeNo;
		this.sNoticeTitle = sNoticeTitle;
		this.sNoticeContents = sNoticeContents;
		this.sNoticeDate = sNoticeDate;
		this.userId = userId;
		this.sSearchCondition = sSearchCondition;
	}

	public int getsNoticeNo() {
		return sNoticeNo;
	}

	public void setsNoticeNo(int sNoticeNo) {
		this.sNoticeNo = sNoticeNo;
	}

	public String getsNoticeTitle() {
		return sNoticeTitle;
	}

	public void setsNoticeTitle(String sNoticeTitle) {
		this.sNoticeTitle = sNoticeTitle;
	}

	public String getsNoticeContents() {
		return sNoticeContents;
	}

	public void setsNoticeContents(String sNoticeContents) {
		this.sNoticeContents = sNoticeContents;
	}

	public Date getsNoticeDate() {
		return sNoticeDate;
	}

	public void setsNoticeDate(Date sNoticeDate) {
		this.sNoticeDate = sNoticeDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getsSearchCondition() {
		return sSearchCondition;
	}

	public void setsSearchCondition(String sSearchCondition) {
		this.sSearchCondition = sSearchCondition;
	}

	@Override
	public String toString() {
		return "SelectNotice [sNoticeNo=" + sNoticeNo + ", sNoticeTitle=" + sNoticeTitle + ", sNoticeContents="
				+ sNoticeContents + ", sNoticeDate=" + sNoticeDate + ", userId=" + userId + ", sSearchCondition="
				+ sSearchCondition + "]";
	}
}
