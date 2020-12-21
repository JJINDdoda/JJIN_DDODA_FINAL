package com.kh.ddoda.opendiary.domain;

import java.sql.Date;

public class OpendiaryComment {

	private int openComNo;
	private Date openComDate;
	private Date openComModifyDate;
	private String openComContents;
	private String openComUser;
	private int refNo;
	private int opendiaryNo;
	
	public OpendiaryComment() {}

	public OpendiaryComment(int openComNo, Date openComDate, Date openComModifyDate, String openComContents,
			String openComUser, int refNo, int opendiaryNo) {
		super();
		this.openComNo = openComNo;
		this.openComDate = openComDate;
		this.openComModifyDate = openComModifyDate;
		this.openComContents = openComContents;
		this.openComUser = openComUser;
		this.refNo = refNo;
		this.opendiaryNo = opendiaryNo;
	}

	public int getOpenComNo() {
		return openComNo;
	}

	public void setOpenComNo(int openComNo) {
		this.openComNo = openComNo;
	}

	public Date getOpenComDate() {
		return openComDate;
	}

	public void setOpenComDate(Date openComDate) {
		this.openComDate = openComDate;
	}

	public Date getOpenComModifyDate() {
		return openComModifyDate;
	}

	public void setOpenComModifyDate(Date openComModifyDate) {
		this.openComModifyDate = openComModifyDate;
	}

	public String getOpenComContents() {
		return openComContents;
	}

	public void setOpenComContents(String openComContents) {
		this.openComContents = openComContents;
	}

	public String getOpenComUser() {
		return openComUser;
	}

	public void setOpenComUser(String openComUser) {
		this.openComUser = openComUser;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public int getOpendiaryNo() {
		return opendiaryNo;
	}

	public void setOpendiaryNo(int opendiaryNo) {
		this.opendiaryNo = opendiaryNo;
	}

	@Override
	public String toString() {
		return "OpendiaryComment [openComNo=" + openComNo + ", openComDate=" + openComDate + ", openComModifyDate="
				+ openComModifyDate + ", openComContents=" + openComContents + ", openComUser=" + openComUser
				+ ", refNo=" + refNo + ", opendiaryNo=" + opendiaryNo + "]";
	}
	
	
}
