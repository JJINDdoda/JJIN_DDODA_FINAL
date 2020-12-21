package com.kh.ddoda.facility.domain;

public class ExerciseFacility {
	
	private int facilityNo;
	private String facilityField;
	private int recommended;
	private String facilityName;
	private String facilityAddr;
	private String facilityKinds;
	private String facilityBlog;
	private String facilityPhone;
//	private String picturePath;
//	private String pictureRename;
	private String termsOfUse;
	private String latiLong;
	private String termsYn;
	private String userId;
	
	public ExerciseFacility() {
		
	}

	public ExerciseFacility(int facilityNo, String facilityField, int recommended, String facilityName,
			String facilityAddr, String facilityKinds, String facilityBlog, String facilityPhone, String termsOfUse, String latiLong, String termsYn, String userId) {
		super();// String picturePath,String pictureRename,
		this.facilityNo = facilityNo;
		this.facilityField = facilityField;
		this.recommended = recommended;
		this.facilityName = facilityName;
		this.facilityAddr = facilityAddr;
		this.facilityKinds = facilityKinds;
		this.facilityBlog = facilityBlog;
		this.facilityPhone = facilityPhone;
		//this.picturePath = picturePath;
		//this.pictureRename = pictureRename;
		this.termsOfUse = termsOfUse;
		this.latiLong = latiLong;
		this.termsYn = termsYn;
		this.userId = userId;
	}

	public int getFacilityNo() {
		return facilityNo;
	}

	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}

	public String getFacilityField() {
		return facilityField;
	}

	public void setFacilityField(String facilityField) {
		this.facilityField = facilityField;
	}

	public int getRecommended() {
		return recommended;
	}

	public void setRecommended(int recommended) {
		this.recommended = recommended;
	}

	public String getFacilityName() {
		return facilityName;
	}

	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}

	public String getFacilityAddr() {
		return facilityAddr;
	}

	public void setFacilityAddr(String facilityAddr) {
		this.facilityAddr = facilityAddr;
	}

	public String getFacilityKinds() {
		return facilityKinds;
	}

	public void setFacilityKinds(String facilityKinds) {
		this.facilityKinds = facilityKinds;
	}

	public String getFacilityBlog() {
		return facilityBlog;
	}

	public void setFacilityBlog(String facilityBlog) {
		this.facilityBlog = facilityBlog;
	}

	public String getFacilityPhone() {
		return facilityPhone;
	}

	public void setFacilityPhone(String facilityPhone) {
		this.facilityPhone = facilityPhone;
	}

	public String getTermsOfUse() {
		return termsOfUse;
	}

	public void setTermsOfUse(String termsOfUse) {
		this.termsOfUse = termsOfUse;
	}

	public String getLatiLong() {
		return latiLong;
	}

	public void setLatiLong(String latiLong) {
		this.latiLong = latiLong;
	}
	
	public String getTermsYn() {
		return termsYn;
	}

	public void setTermsYn(String termsYn) {
		this.termsYn = termsYn;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "ExerciseFacility [facilityNo=" + facilityNo + ", facilityField=" + facilityField + ", recommended="
				+ recommended + ", facilityName=" + facilityName + ", facilityAddr=" + facilityAddr + ", facilityKinds="
				+ facilityKinds + ", facilityBlog=" + facilityBlog + ", facilityPhone=" + facilityPhone
				+ ", termsOfUse=" + termsOfUse + ", latiLong=" + latiLong + ", termsYn=" + termsYn + ", userId="
				+ userId + "]";
	}

	
//	public String getPicturePath() {
//		return picturePath;
//	}
//
//	public void setPicturePath(String picturePath) {
//		this.picturePath = picturePath;
//	}
//
//	public String getPictureRename() {
//		return pictureRename;
//	}
//
//	public void setPictureRename(String pictureRename) {
//		this.pictureRename = pictureRename;
//	}

//	@Override
//	public String toString() {
//		return "ExerciseFacility [facilityNo=" + facilityNo + ", facilityField=" + facilityField + ", recommended="
//				+ recommended + ", facilityName=" + facilityName + ", facilityAddr=" + facilityAddr + ", facilityKinds="
//				+ facilityKinds + ", facilityBlog=" + facilityBlog + ", facilityPhone=" + facilityPhone
//				+ ", picturePath=" + picturePath + ", pictureRename=" + pictureRename + ", termsOfUse=" + termsOfUse
//				+ ", latiLong=" + latiLong + ", termsYn=" + termsYn + ", userId=" + userId + "]";
//	}

	
}
