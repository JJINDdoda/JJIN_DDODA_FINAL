package com.kh.ddoda.chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.chat.domain.Chat;
import com.kh.ddoda.chat.store.ChatStore;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.Mymate;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatStore cStore;
	
	@Override
	public int getChatListCount() {
		return cStore.getChatListCount();
	}
	
	@Override
	public ArrayList<Mate> adminChatList(PageInfo pi) {
		return cStore.adminChatList(pi);
	}

	@Override
	public Mate adminSelectChat(int mateNo) {
		return cStore.adminSelectChat(mateNo);
	}
	
	@Override
	public ArrayList<Mymate> adminSelectUser(int mateNo) {
		return cStore.adminSelectUser(mateNo);
	}

	@Override
	public int adminModifyChat(Mymate myMate) {
		return cStore.adminModifyChat(myMate);
	}

	@Override
	public int adminChatOpen(Chat chat) {
		return cStore.adminChatOpen(chat);
	}

	@Override
	public Mymate selectChatInsert(HashMap<String, Object> map) {
		return cStore.selectChatInsert(map);
	}

	@Override
	public ArrayList<Chat> selectChatList(int mateNo) {
		return cStore.selectChatList(mateNo);
	}
}
