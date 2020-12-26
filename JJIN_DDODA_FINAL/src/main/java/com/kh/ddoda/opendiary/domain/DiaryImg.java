package com.kh.ddoda.opendiary.domain;

public class DiaryImg {

	private String userId;
	private String imgPath;
	private String imgRenamePath;
	private int diaryNo;
	private int opendiaryNo;
	private int folderNo;
	private String imgMainYn;
	private String menuName;
	
	public DiaryImg() {}

	public DiaryImg(String userId, String imgPath, String imgRenamePath, int diaryNo, int opendiaryNo, int folderNo,
			String imgMainYn, String menuName) {
		super();
		this.userId = userId;
		this.imgPath = imgPath;
		this.imgRenamePath = imgRenamePath;
		this.diaryNo = diaryNo;
		this.opendiaryNo = opendiaryNo;
		this.folderNo = folderNo;
		this.imgMainYn = imgMainYn;
		this.menuName = menuName;
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

	public int getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(int folderNo) {
		this.folderNo = folderNo;
	}

	public String getImgMainYn() {
		return imgMainYn;
	}

	public void setImgMainYn(String imgMainYn) {
		this.imgMainYn = imgMainYn;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Override
	public String toString() {
		return "DiaryImg [userId=" + userId + ", imgPath=" + imgPath + ", imgRenamePath=" + imgRenamePath + ", diaryNo="
				+ diaryNo + ", opendiaryNo=" + opendiaryNo + ", folderNo=" + folderNo + ", imgMainYn=" + imgMainYn
				+ ", menuName=" + menuName + "]";
	}

	
}
