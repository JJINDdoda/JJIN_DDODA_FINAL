package com.kh.ddoda.mate.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.mate.domain.Mate;
import com.kh.ddoda.mate.domain.MateComment;
import com.kh.ddoda.mate.domain.Mymate;

@Repository
public class MateStoreLogic implements MateStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return sqlSession.selectOne("MateMapper.getListCount");
	}

	@Override
	public ArrayList<Mate> mateList(HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("MateMapper.selectList", map, rowBounds);
	}

	@Override
	public Mate selectOneMate(int mateNo) {
		return sqlSession.selectOne("MateMapper.selectOneMate", mateNo);
	}

	@Override
	public int addViewCount(int mateNo) {
		return sqlSession.update("MateMapper.addViewCount", mateNo);
	}

	@Override
	public int insertMate(Mate mate) {
		int result = sqlSession.insert("MateMapper.insertMate", mate);
		return result;
	}

	@Override
	public int updateMate(Mate mate) {
		int result = sqlSession.update("MateMapper.updateMate", mate);
		System.out.println(result);
		return result;
	}

	@Override
	public int deleteMate(int mateNo) {
		int result = sqlSession.delete("MateMapper.deleteMate", mateNo);
		return result;
	}

	@Override
	public int finishMate(int mateNo) {
		int result = sqlSession.update("MateMapper.finishMate", mateNo);
		return result;
	}

	@Override
	public int insertMymate(Mymate myMate) {
		return sqlSession.insert("MateMapper.insertMymate", myMate);
	}

	@Override
	public int deleteMymate(String userId) {
		return 0;
	}

	@Override
	public ArrayList<Mymate> selectMymate(int mymateNo) {
		return (ArrayList)sqlSession.selectList("MateMapper.selectMymate", mymateNo);
	}

	@Override
	public int insertMateCom(MateComment mateCom) {
		return sqlSession.insert("MateMapper.insertMateCom", mateCom);
	}

	@Override
	public int updateMateCom(MateComment mateCom) {
		return 0;
	}

	@Override
	public int deleteMateCom(int mateComNo) {
		return sqlSession.delete("MateMapper.deleteMateCom", mateComNo);
	}

	@Override
	public ArrayList<Mate> selectSearchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1 * pi.getBoardLimit());
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("MateMapper.mateSearchList", search, rowBounds);
	}

	@Override
	public ArrayList<MateComment> selectMateCom(int mateNo, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList mList = (ArrayList)sqlSession.selectList("MateMapper.selectMateCom", mateNo, rowBounds);
		System.out.println("selectMateCom의 store : "+ mList);
		return mList;
	}

	@Override
	public int deleteAllmyMate(int mateNo) {
		return sqlSession.delete("MateMapper.deleteAllmyMate", mateNo);
	}

	@Override
	public int deleteAllMateCom(int mateNo) {
		return sqlSession.delete("MateMapper.deleteAllMateCom", mateNo);
	}

	@Override
	public int insertMateComReply(MateComment mateCom) {
		int result = sqlSession.insert("MateMapper.insertMateComReply", mateCom);
		System.out.println("insertMateComRply : " + result);
		return result;
	}

	@Override
	public ArrayList<MateComment> selectMateComReply(HashMap<String, Object> map) {
		ArrayList<MateComment> replyList = (ArrayList)sqlSession.selectList("MateMapper.selectMateComReply", map);
		return replyList;
	}

	@Override
	public ArrayList<MateComment> selectMateComNo(int mateNo) {
		return (ArrayList)sqlSession.selectList("MateMapper.selectMateComListNo", mateNo);
	}

	@Override
	public int deleteMateComReply(int mateComNo) {
		return sqlSession.delete("MateMapper.deleteMateComReply", mateComNo);
	}

	@Override
	public ArrayList<Mate> myMateAttendList(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList mList = (ArrayList)sqlSession.selectList("MateMapper.myMateAttendList", userId, rowBounds);
		System.out.println("store 단ㅇ myMateAttendList : "+mList);
		return mList;
	}

	@Override
	public int mymateOut(Mymate mymate) {
		return sqlSession.delete("MateMapper.mymateOut", mymate);
	}

	@Override
	public ArrayList<Mate> myContentsList(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("MateMapper.myContentList", userId, rowBounds);
	}

	@Override
	public int getComListCount() {
		return sqlSession.selectOne("MateMapper.getComListCount");
	}

	
	
}
