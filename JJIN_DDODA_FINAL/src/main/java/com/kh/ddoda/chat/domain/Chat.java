package com.kh.ddoda.chat.domain;

import java.sql.Timestamp;

public class Chat {
	
	private String contents;
	private String userId;
	private Timestamp time;
	
	public Chat() {
		super();
	}

	public Chat(String contents, String userId, Timestamp time) {
		super();
		this.contents = contents;
		this.userId = userId;
		this.time = time;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Chat [contents=" + contents + ", userId=" + userId + ", time=" + time + "]";
	}
}
