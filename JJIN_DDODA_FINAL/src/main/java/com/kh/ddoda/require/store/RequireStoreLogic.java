package com.kh.ddoda.require.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.require.domain.Reply;
import com.kh.ddoda.require.domain.Require;

@Repository
public class RequireStoreLogic implements RequireStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getRequireListCount() {
		return sqlSession.selectOne("RequireMapper.getRequireListCount");
	}

	@Override
	public ArrayList<Require> adminSelectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("RequireMapper.adminSelectList", null, rowBounds);
	}

	@Override
	public Require adminSelectRequire(int requireNo) {
		return sqlSession.selectOne("RequireMapper.adminSelectRequire", requireNo);
	}

	@Override
	public Reply adminRequireReply(int requireNo) {
		return sqlSession.selectOne("RequireMapper.adminSelectRequireReply", requireNo);
	}

	@Override
	public int insertRequireReply(Reply reply) {
		return sqlSession.insert("RequireMapper.insertReply", reply);
	}

	@Override
	public int adminModifyRequire(Require require) {
		return sqlSession.update("RequireMapper.adminModifyRequire", require);
	}

	@Override
	public int adminModifyRequireReply(Reply reply) {
		return sqlSession.update("RequireMapper.adminModifyReply", reply);
	}

	@Override
	public int adminDeleteRequire(int requireNo) {
		return sqlSession.delete("RequireMapper.adminDeleteRequire", requireNo);
	}
	
	@Override
	public int adminRequireStatus(int requireNo) {
		return sqlSession.update("RequireMapper.adminRequieStatus", requireNo);
	}
	
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RequireMapper.getRequireListCount");
	}

	@Override
	public ArrayList<Require> requireList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Require> rList = (ArrayList)sqlSession.selectList("RequireMapper.requireList", null, rowBounds);
		System.out.println(offset + "," +rList);
		return rList;
	}

	@Override
	public Require selectOneRequire(int requireNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RequireMapper.selectOneRequire", requireNo);
	}

	@Override
	public int insertRequire(Require require) {
		int result = sqlSession.insert("RequireMapper.insertRequire", require);
		return result;
	}

	@Override
	public int deleteRequire(int requireNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("RequireMapper.deleteRequire", requireNo);
	}

	@Override
	public int updateRequire(Require require) {
		// TODO Auto-generated method stub
		return sqlSession.update("RequireMapper.updateRequire", require);
	}

	@Override
	public ArrayList<Require> selectSearchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1 * pi.getBoardLimit());
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Require> rList = (ArrayList)sqlSession.selectList("RequireMapper.searchList", search, rowBounds);
		return rList;
	}

	@Override
	public int addReadCount(int requireNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("RequireMapper.updateCount", requireNo);
	}
}
