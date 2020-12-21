package com.kh.ddoda.notice.domain;

import java.sql.Date;

public class SelectNotice {
	private String sNoticeTitle;
	private String sNoticeContents;
	private Date sNoticeDate;
	private String userId;
	
	public SelectNotice() {
		super();
	}

	public SelectNotice(String sNoticeTitle, String sNoticeContents, Date sNoticeDate, String userId) {
		super();
		this.sNoticeTitle = sNoticeTitle;
		this.sNoticeContents = sNoticeContents;
		this.sNoticeDate = sNoticeDate;
		this.userId = userId;
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

	@Override
	public String toString() {
		return "SelectNotice [sNoticeTitle=" + sNoticeTitle + ", sNoticeContents=" + sNoticeContents + ", sNoticeDate="
				+ sNoticeDate + ", userId=" + userId + "]";
	}
}
