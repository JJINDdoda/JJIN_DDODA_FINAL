package com.kh.ddoda.notice.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.notice.domain.Notice;
import com.kh.ddoda.notice.domain.SelectNotice;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.require.domain.Require;

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
	public int registerRequire(Require require) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerMate(Mate mate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerDiary(Opendiary diary) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyRequire(Require require) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyMate(Mate mate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyDiary(Opendiary diary) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRequire(int requireNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMate(int mateNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDiary(int openDiaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
