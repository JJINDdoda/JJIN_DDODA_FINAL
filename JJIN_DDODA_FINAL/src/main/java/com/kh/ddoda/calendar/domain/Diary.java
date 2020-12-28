package com.kh.ddoda.calendar.domain;

import java.sql.Date;

public class Diary {
	
	private int diaryNo;
	private String diaryTitle;
	private String diaryContnets;
	private Date diaryDate;
	private Date diaryModifyDate;
	private String diaryOpenYn;
	private String userId;
	private String mainImagepath;

	public Diary() {
		
	}

	public Diary(int diaryNo, String diaryTitle, String diaryContnets, Date diaryDate, Date diaryModifyDate,
			String diaryOpenYn, String userId, String mainImagepath) {
		super();
		this.diaryNo = diaryNo;
		this.diaryTitle = diaryTitle;
		this.diaryContnets = diaryContnets;
		this.diaryDate = diaryDate;
		this.diaryModifyDate = diaryModifyDate;
		this.diaryOpenYn = diaryOpenYn;
		this.userId = userId;
		this.mainImagepath = mainImagepath;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public String getDiaryTitle() {
		return diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}

	public String getDiaryContnets() {
		return diaryContnets;
	}

	public void setDiaryContnets(String diaryContnets) {
		this.diaryContnets = diaryContnets;
	}

	public Date getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}

	public Date getDiaryModifyDate() {
		return diaryModifyDate;
	}

	public void setDiaryModifyDate(Date diaryModifyDate) {
		this.diaryModifyDate = diaryModifyDate;
	}

	public String getDiaryOpenYn() {
		return diaryOpenYn;
	}

	public void setDiaryOpenYn(String diaryOpenYn) {
		this.diaryOpenYn = diaryOpenYn;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMainImagepath() {
		return mainImagepath;
	}

	public void setMainImagepath(String mainImagepath) {
		this.mainImagepath = mainImagepath;
	}

	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", diaryTitle=" + diaryTitle + ", diaryContnets=" + diaryContnets
				+ ", diaryDate=" + diaryDate + ", diaryModifyDate=" + diaryModifyDate + ", diaryOpenYn=" + diaryOpenYn
				+ ", userId=" + userId + ", mainImagepath=" + mainImagepath + "]";
	}
	
}
