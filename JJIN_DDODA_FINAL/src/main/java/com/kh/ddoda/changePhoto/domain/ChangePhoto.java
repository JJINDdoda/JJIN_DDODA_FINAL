package com.kh.ddoda.changePhoto.domain;

import java.sql.Date;

public class ChangePhoto {
	private int myChangeNo;
	private String myChangeTitle;
	private String myChangeContents;
	private Date myChangeDate;
	private String userId;
	private String originalFileName;
	private String renameFileName;
	private String publicCode;
	
	public ChangePhoto() {}

	
	
	public ChangePhoto(int myChangeNo, String myChangeTitle, String myChangeContents, Date myChangeDate, String userId,
			String originalFileName, String renameFileName, String publicCode) {
		super();
		this.myChangeNo = myChangeNo;
		this.myChangeTitle = myChangeTitle;
		this.myChangeContents = myChangeContents;
		this.myChangeDate = myChangeDate;
		this.userId = userId;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.publicCode = publicCode;
	}



	public int getMyChangeNo() {
		return myChangeNo;
	}

	public void setMyChangeNo(int myChangeNo) {
		this.myChangeNo = myChangeNo;
	}

	public String getMyChangeTitle() {
		return myChangeTitle;
	}

	public void setMyChangeTitle(String myChangeTitle) {
		this.myChangeTitle = myChangeTitle;
	}

	public String getMyChangeContents() {
		return myChangeContents;
	}

	public void setMyChangeContents(String myChangeContents) {
		this.myChangeContents = myChangeContents;
	}

	public Date getMyChangeDate() {
		return myChangeDate;
	}

	public void setMyChangeDate(Date myChangeDate) {
		this.myChangeDate = myChangeDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public String getPublicCode() {
		return publicCode;
	}

	public void setPublicCode(String publicCode) {
		this.publicCode = publicCode;
	}

	@Override
	public String toString() {
		return "ChangePhoto [myChangeNo=" + myChangeNo + ", myChangeTitle=" + myChangeTitle + ", myChangeContents="
				+ myChangeContents + ", myChangeDate=" + myChangeDate + ", userId=" + userId + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + ", publicCode=" + publicCode + "]";
	}

	
	
	
	
	
}
