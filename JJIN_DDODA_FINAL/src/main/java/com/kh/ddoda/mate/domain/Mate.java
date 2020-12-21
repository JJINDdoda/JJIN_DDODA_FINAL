package com.kh.ddoda.mate.domain;

import java.sql.Date;

public class Mate {

	private int mateNo;
	private String mateTitle;
	private String mateContents;
	private Date mateDate;
	private Date mateModifyDate;
	private String mateRequireNo;
	private String matePlace;
	private String detailAddr;
	private String roadAddr;
	private String sido;
	private String latLong;
	private int mateView;
	private String mateEnd;
	private String userId;
	
	public Mate() {}

	public int getMateNo() {
		return mateNo;
	}

	public void setMateNo(int mateNo) {
		this.mateNo = mateNo;
	}

	public String getMateTitle() {
		return mateTitle;
	}

	public void setMateTitle(String mateTitle) {
		this.mateTitle = mateTitle;
	}

	public String getMateContents() {
		return mateContents;
	}

	public void setMateContents(String mateContents) {
		this.mateContents = mateContents;
	}

	public Date getMateDate() {
		return mateDate;
	}

	public void setMateDate(Date mateDate) {
		this.mateDate = mateDate;
	}

	public Date getMateModifyDate() {
		return mateModifyDate;
	}

	public void setMateModifyDate(Date mateModifyDate) {
		this.mateModifyDate = mateModifyDate;
	}

	public String getMateRequireNo() {
		return mateRequireNo;
	}

	public void setMateRequireNo(String mateRequireNo) {
		this.mateRequireNo = mateRequireNo;
	}

	public String getMatePlace() {
		return matePlace;
	}

	public void setMatePlace(String matePlace) {
		this.matePlace = matePlace;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getRoadAddr() {
		return roadAddr;
	}

	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getLatLong() {
		return latLong;
	}

	public void setLatLong(String latLong) {
		this.latLong = latLong;
	}

	public int getMateView() {
		return mateView;
	}

	public void setMateView(int mateView) {
		this.mateView = mateView;
	}

	public String getMateEnd() {
		return mateEnd;
	}

	public void setMateEnd(String mateEnd) {
		this.mateEnd = mateEnd;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Mate [mateNo=" + mateNo + ", mateTitle=" + mateTitle + ", mateContents=" + mateContents + ", mateDate="
				+ mateDate + ", mateModifyDate=" + mateModifyDate + ", mateRequireNo=" + mateRequireNo + ", matePlace="
				+ matePlace + ", detailAddr=" + detailAddr + ", roadAddr=" + roadAddr + ", sido=" + sido + ", latLong="
				+ latLong + ", mateView=" + mateView + ", mateEnd=" + mateEnd + ", userId=" + userId + "]";
	}
	
}
