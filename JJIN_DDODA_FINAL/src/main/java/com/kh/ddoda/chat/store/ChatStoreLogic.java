package com.kh.ddoda.chat.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.chat.domain.Chat;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.Mymate;

@Repository
public class ChatStoreLogic implements ChatStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getChatListCount() {
		return sqlSession.selectOne("ChatMapper.getChatListCount");
	}
	
	@Override
	public ArrayList<Mate> adminChatList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ChatMapper.adminChatList", null, rowBounds);
	}

	@Override
	public Mate adminSelectChat(int mateNo) {
		return sqlSession.selectOne("ChatMapper.adminSelectChat", mateNo);
	}
	
	@Override
	public ArrayList<Mymate> adminSelectUser(int mateNo) {
		return (ArrayList)sqlSession.selectList("ChatMapper.adminSelectUser", mateNo);
	}

	@Override
	public int adminModifyChat(Mymate myMate) {
		return sqlSession.update("ChatMapper.adminModifyChat", myMate);
	}

	@Override
	public int adminChatOpen(Chat chat) {
		return sqlSession.insert("ChatMapper.insertChat", chat);
	}

	@Override
	public Mymate selectChatInsert(HashMap<String, Object> map) {
		return sqlSession.selectOne("ChatMapper.selectChatInsert", map);
	}

	@Override
	public ArrayList<Chat> selectChatList(int mateNo) {
		return (ArrayList)sqlSession.selectList("ChatMapper.selectChatList", mateNo);
	}
}
