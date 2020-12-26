package com.kh.ddoda.chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ddoda.chat.domain.Chat;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.Mymate;

public interface ChatService {
	
	/**
	 * 게시판 전체 수 조회
	 * @return
	 */
	public int getChatListCount();
	
	/**
	 * 관리자 채팅 요청 게시판 전체 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Mate> adminChatList(PageInfo pi);
	
	/**
	 * 관리자 채팅 요청 상세 조회
	 * @param mateNo
	 * @return
	 */
	public Mate adminSelectChat(int mateNo);
	
	/**
	 * 관리자 채팅 요청 상세 조회 참여 명단
	 * @param mateNo
	 * @return
	 */
	public ArrayList<Mymate> adminSelectUser(int mateNo);
	
	/**
	 * 관리자 채팅 요청 수락
	 * @param mate
	 * @return
	 */
	public int adminModifyChat(Mymate myMate);
	
	/**
	 * 관리자 채팅 오픈
	 * @param message
	 * @return
	 */
	public int adminChatOpen(Chat chat);
	
	/**
	 * 채팅방 입장
	 * @param mateNo
	 * @return
	 */
	public Mymate selectChatInsert(HashMap<String, Object> map);
	
	/**
	 * 채팅 리스트 전체 조회
	 * @param mateNo
	 * @return
	 */
	public ArrayList<Chat> selectChatList(int mateNo);
}
