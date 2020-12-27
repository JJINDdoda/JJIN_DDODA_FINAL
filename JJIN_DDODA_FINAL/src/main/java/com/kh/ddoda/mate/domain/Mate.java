package com.kh.ddoda.mate.domain;

import java.sql.Date;

import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.require.domain.Require;

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
	private String menuName;
	private String userId;
	private String category;
	
	private Mymate mymate;
	private Opendiary opendiary;
	private DiaryImg diaryImg;
	private Require require;
	
	public Mate() {}

	public Mate(int mateNo, String mateTitle, String mateContents, Date mateDate, Date mateModifyDate,
			String mateRequireNo, String matePlace, String detailAddr, String roadAddr, String sido, String latLong,
			int mateView, String mateEnd, String menuName, String userId, String category, Mymate mymate,
			Opendiary opendiary, DiaryImg diaryImg, Require require) {
		super();
		this.mateNo = mateNo;
		this.mateTitle = mateTitle;
		this.mateContents = mateContents;
		this.mateDate = mateDate;
		this.mateModifyDate = mateModifyDate;
		this.mateRequireNo = mateRequireNo;
		this.matePlace = matePlace;
		this.detailAddr = detailAddr;
		this.roadAddr = roadAddr;
		this.sido = sido;
		this.latLong = latLong;
		this.mateView = mateView;
		this.mateEnd = mateEnd;
		this.menuName = menuName;
		this.userId = userId;
		this.category = category;
		this.mymate = mymate;
		this.opendiary = opendiary;
		this.diaryImg = diaryImg;
		this.require = require;
	}

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

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Mymate getMymate() {
		return mymate;
	}

	public void setMymate(Mymate mymate) {
		this.mymate = mymate;
	}

	public Opendiary getOpendiary() {
		return opendiary;
	}

	public void setOpendiary(Opendiary opendiary) {
		this.opendiary = opendiary;
	}

	public DiaryImg getDiaryImg() {
		return diaryImg;
	}

	public void setDiaryImg(DiaryImg diaryImg) {
		this.diaryImg = diaryImg;
	}

	public Require getRequire() {
		return require;
	}

	public void setRequire(Require require) {
		this.require = require;
	}

	@Override
	public String toString() {
		return "Mate [mateNo=" + mateNo + ", mateTitle=" + mateTitle + ", mateContents=" + mateContents + ", mateDate="
				+ mateDate + ", mateModifyDate=" + mateModifyDate + ", mateRequireNo=" + mateRequireNo + ", matePlace="
				+ matePlace + ", detailAddr=" + detailAddr + ", roadAddr=" + roadAddr + ", sido=" + sido + ", latLong="
				+ latLong + ", mateView=" + mateView + ", mateEnd=" + mateEnd + ", menuName=" + menuName + ", userId="
				+ userId + ", category=" + category + ", mymate=" + mymate + ", opendiary=" + opendiary + ", diaryImg="
				+ diaryImg + ", require=" + require + "]";
	}
}
