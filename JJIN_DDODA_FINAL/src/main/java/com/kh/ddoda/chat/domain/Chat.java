package com.kh.ddoda.chat.domain;


public class Chat {
	
	private String messageinput;
	private String userId;
	private int mateNo;
	private int chatNo;
	
	public Chat() {
		super();
	}

	public Chat(String messageinput, String userId, int mateNo, int chatNo) {
		super();
		this.messageinput = messageinput;
		this.userId = userId;
		this.mateNo = mateNo;
		this.chatNo = chatNo;
	}

	public String getMessageinput() {
		return messageinput;
	}

	public void setMessageinput(String messageinput) {
		this.messageinput = messageinput;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getMateNo() {
		return mateNo;
	}
	
	public void setMateNo(int mateNo) {
		this.mateNo = mateNo;
	}
	
	public int getChatNo() {
		return chatNo;
	}
	
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	@Override
	public String toString() {
		return "Chat [messageinput=" + messageinput + ", userId=" + userId + ", mateNo=" + mateNo + ", chatNo=" + chatNo + "]";
	}
}
