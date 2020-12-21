package com.kh.ddoda.notice.domain;

public class Notice {
	
	private int noticeNo;
	private int rowNum;
	private String noticeTitle;
	private String noticeDate;
	private String userId;
	private String menuName;
	
	public Notice() {
		super();
	}

	public Notice(int noticeNo, int rowNum, String noticeTitle, String noticeDate, String userId, String menuName) {
		super();
		this.noticeNo = noticeNo;
		this.rowNum = rowNum;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.userId = userId;
		this.menuName = menuName;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", rowNum=" + rowNum + ", noticeTitle=" + noticeTitle + ", noticeDate="
				+ noticeDate + ", userId=" + userId + ", menuName=" + menuName + "]";
	}
}
