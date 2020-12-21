package com.kh.ddoda.mate.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.common.PageInfo;
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
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MateMapper.getListCount");
	}

	@Override
	public ArrayList<Mate> mateList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1 * pi.getBoardLimit());
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("MateMapper.selectList", null, rowBounds);
	}

	@Override
	public Mate selectOneMate(int mateNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MateMapper.selectOneMate", mateNo);
	}

	@Override
	public int addViewCount(int mateNo) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMymate(Mymate myMate) {
		// TODO Auto-generated method stub
		return sqlSession.insert("MateMapper.insertMymate", myMate);
	}

	@Override
	public int deleteMymate(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Mymate> selectMymate(int mymateNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("MateMapper.selectMymate", mymateNo);
	}

	@Override
	public int insertMateCom(MateComment mateCom) {
		// TODO Auto-generated method stub
		return sqlSession.insert("MateMapper.insertMateCom", mateCom);
	}

	@Override
	public int updateMateCom(MateComment mateCom) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMateCom(int mateComNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Mate> selectSearchList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MateComment> selectMateCom(int mateNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("MateMapper.selectMateCom", mateNo);
	}

	@Override
	public int deleteAllmyMate(int mateNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("MateMapper.deleteAllmyMate", mateNo);
	}

	@Override
	public int deleteAllMateCom(int mateNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("MateMapper.deleteAllMateCom", mateNo);
	}

	@Override
	public int insertMateComReply(MateComment mateCom) {
		// TODO Auto-generated method stub
		return sqlSession.insert("MateMapper.insertMateComReply", mateCom);
	}

	@Override
	public ArrayList<MateComment> selectMateComReply(int mateComRefNo) {
		ArrayList<MateComment> replyList = (ArrayList)sqlSession.selectList("MateMapper.selectMateComReply", mateComRefNo);
		return replyList;
	}
	
}
