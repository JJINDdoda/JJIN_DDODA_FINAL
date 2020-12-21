package com.kh.ddoda.opendiary.domain;

public class DiaryImg {

	private String userId;
	private String imgPath;
	private String imgRenamePath;
	private int diaryNo;
	private int opendiaryNo;
	
	public DiaryImg() {}

	public DiaryImg(String userId, String imgPath, String imgRenamePath, int diaryNo, int opendiaryNo) {
		super();
		this.userId = userId;
		this.imgPath = imgPath;
		this.imgRenamePath = imgRenamePath;
		this.diaryNo = diaryNo;
		this.opendiaryNo = opendiaryNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getImgRenamePath() {
		return imgRenamePath;
	}

	public void setImgRenamePath(String imgRenamePath) {
		this.imgRenamePath = imgRenamePath;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getOpendiaryNo() {
		return opendiaryNo;
	}

	public void setOpendiaryNo(int opendiaryNo) {
		this.opendiaryNo = opendiaryNo;
	}

	@Override
	public String toString() {
		return "DiaryImg [userId=" + userId + ", imgPath=" + imgPath + ", imgRenamePath=" + imgRenamePath + ", diaryNo="
				+ diaryNo + ", opendiaryNo=" + opendiaryNo + "]";
	}

}
