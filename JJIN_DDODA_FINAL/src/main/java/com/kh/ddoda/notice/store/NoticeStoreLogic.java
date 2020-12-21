package com.kh.ddoda.notice.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.notice.domain.Notice;
import com.kh.ddoda.notice.domain.SelectNotice;

@Repository
public class NoticeStoreLogic implements NoticeStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return sqlSession.selectOne("NoticeMapper.getListCount");
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("NoticeMapper.selectNoticeList", null, rowBounds);
	}

	@Override
	public SelectNotice selectNotice(Notice notice) {
		return sqlSession.selectOne("NoticeMapper.selectNotice", notice);
	}
	
	@Override
	public int registerNotice(SelectNotice selectNotice) {
		return sqlSession.insert("NoticeMapper.insertNotice", selectNotice);
	}

	@Override
	public int modifyNotice(SelectNotice selectNotice) {
		return sqlSession.update("NoticeMapper.updateNotice", selectNotice);
	}

	@Override
	public int deleteNotice(Notice notice) {
		return sqlSession.delete("NoticeMapper.deleteNotice", notice);
	}
}