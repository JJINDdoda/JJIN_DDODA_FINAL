package com.kh.ddoda.facility.domain;

public class FacilityPicture {
	
	private String picturePath;
	private String pictureRename;
	private int facilityNo;
	
	public FacilityPicture() {
		
	}

	public FacilityPicture(String picturePath, int facilityNo) {
		super();
		this.picturePath = picturePath;
		this.facilityNo = facilityNo;
	}

	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	public int getFacilityNo() {
		return facilityNo;
	}

	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}
	
	public String getPictureRename() {
		return pictureRename;
	}

	public void setPictureRename(String pictureRename) {
		this.pictureRename = pictureRename;
	}

	@Override
	public String toString() {
		return "FacilityPicture [picturePath=" + picturePath + ", pictureRename=" + pictureRename + ", facilityNo="
				+ facilityNo + "]";
	}

	
	
}
