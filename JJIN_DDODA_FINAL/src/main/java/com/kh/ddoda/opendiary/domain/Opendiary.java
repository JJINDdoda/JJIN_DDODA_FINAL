package com.kh.ddoda.opendiary.domain;

import java.sql.Date;

public class Opendiary {

	private int opendiaryNo;
	private String opendiaryTitle;
	private String opendiaryContents;
	private Date opendiaryDate;
	private Date opendiaryModifyDate;
	private int opendiaryViews;
	private String userId;
	
	public Opendiary() {}

	public Opendiary(int opendiaryNo, String opendiaryTitle, String opendiaryContents, Date opendiaryDate,
			Date opendiaryModifyDate, int opendiaryViews, String userId) {
		super();
		this.opendiaryNo = opendiaryNo;
		this.opendiaryTitle = opendiaryTitle;
		this.opendiaryContents = opendiaryContents;
		this.opendiaryDate = opendiaryDate;
		this.opendiaryModifyDate = opendiaryModifyDate;
		this.opendiaryViews = opendiaryViews;
		this.userId = userId;
	}

	public int getOpendiaryNo() {
		return opendiaryNo;
	}

	public void setOpendiaryNo(int opendiaryNo) {
		this.opendiaryNo = opendiaryNo;
	}

	public String getOpendiaryTitle() {
		return opendiaryTitle;
	}

	public void setOpendiaryTitle(String opendiaryTitle) {
		this.opendiaryTitle = opendiaryTitle;
	}

	public String getOpendiaryContents() {
		return opendiaryContents;
	}

	public void setOpendiaryContents(String opendiaryContents) {
		this.opendiaryContents = opendiaryContents;
	}

	public Date getOpendiaryDate() {
		return opendiaryDate;
	}

	public void setOpendiaryDate(Date opendiaryDate) {
		this.opendiaryDate = opendiaryDate;
	}

	public Date getOpendiaryModifyDate() {
		return opendiaryModifyDate;
	}

	public void setOpendiaryModifyDate(Date opendiaryModifyDate) {
		this.opendiaryModifyDate = opendiaryModifyDate;
	}

	public int getOpendiaryViews() {
		return opendiaryViews;
	}

	public void setOpendiaryViews(int opendiaryViews) {
		this.opendiaryViews = opendiaryViews;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Opendiary [opendiaryNo=" + opendiaryNo + ", opendiaryTitle=" + opendiaryTitle + ", opendiaryContents="
				+ opendiaryContents + ", opendiaryDate=" + opendiaryDate + ", opendiaryModifyDate="
				+ opendiaryModifyDate + ", opendiaryViews=" + opendiaryViews + ", userId=" + userId + "]";
	}
	
	
}
