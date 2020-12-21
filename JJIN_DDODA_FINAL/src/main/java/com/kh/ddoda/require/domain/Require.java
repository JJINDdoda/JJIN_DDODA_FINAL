package com.kh.ddoda.require.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Require {
	private int requireNo;
	private String userId;
	private String requireTitle;
	private Date requireDate;
	private Date requireModifyDate;
	private String requireContents;
	private String requireYN;
	private String requireOriginalFilename;
	private String requireRenameFilename;
	private int rCount;
	private String menuName;
	
	public Require() {
		super();
	}

	public Require(int requireNo, String userId, String requireTitle, Date requireDate, Date requireModifyDate,
			String requireContents, String requireYN, String requireOriginalFilename, String requireRenameFilename,
			int rCount, String menuName) {
		super();
		this.requireNo = requireNo;
		this.userId = userId;
		this.requireTitle = requireTitle;
		this.requireDate = requireDate;
		this.requireModifyDate = requireModifyDate;
		this.requireContents = requireContents;
		this.requireYN = requireYN;
		this.requireOriginalFilename = requireOriginalFilename;
		this.requireRenameFilename = requireRenameFilename;
		this.rCount = rCount;
		this.menuName = menuName;
	}

	public int getRequireNo() {
		return requireNo;
	}

	public void setRequireNo(int requireNo) {
		this.requireNo = requireNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRequireTitle() {
		return requireTitle;
	}

	public void setRequireTitle(String requireTitle) {
		this.requireTitle = requireTitle;
	}

	public Date getRequireDate() {
		return requireDate;
	}

	public void setRequireDate(Date requireDate) {
		this.requireDate = requireDate;
	}

	public Date getRequireModifyDate() {
		return requireModifyDate;
	}

	public void setRequireModifyDate(Date requireModifyDate) {
		this.requireModifyDate = requireModifyDate;
	}

	public String getRequireContents() {
		return requireContents;
	}

	public void setRequireContents(String requireContents) {
		this.requireContents = requireContents;
	}

	public String getRequireYN() {
		return requireYN;
	}

	public void setRequireYN(String requireYN) {
		this.requireYN = requireYN;
	}

	public String getRequireOriginalFilename() {
		return requireOriginalFilename;
	}

	public void setRequireOriginalFilename(String requireOriginalFilename) {
		this.requireOriginalFilename = requireOriginalFilename;
	}

	public String getRequireRenameFilename() {
		return requireRenameFilename;
	}

	public void setRequireRenameFilename(String requireRenameFilename) {
		this.requireRenameFilename = requireRenameFilename;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Override
	public String toString() {
		return "Require [requireNo=" + requireNo + ", userId=" + userId + ", requireTitle=" + requireTitle
				+ ", requireDate=" + requireDate + ", requireModifyDate=" + requireModifyDate + ", requireContents="
				+ requireContents + ", requireYN=" + requireYN + ", requireOriginalFilename=" + requireOriginalFilename
				+ ", requireRenameFilename=" + requireRenameFilename + ", rCount=" + rCount + ", menuName=" + menuName
				+ "]";
	}
}
