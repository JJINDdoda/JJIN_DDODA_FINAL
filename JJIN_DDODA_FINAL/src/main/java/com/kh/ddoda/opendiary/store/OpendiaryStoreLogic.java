package com.kh.ddoda.opendiary.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Search;
import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;
import com.kh.ddoda.opendiary.domain.OpendiaryComment;

@Repository
public class OpendiaryStoreLogic implements OpendiaryStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		int count = sqlSession.selectOne("OpendiaryMapper.getListCount");
		return count;
	}

	@Override
	public ArrayList<Opendiary> opendList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.odList", null, rowBounds);
	}
	
	@Override
	public ArrayList<DiaryImg> diaryImgList() {
		ArrayList<DiaryImg> diaryImgList = (ArrayList)sqlSession.selectList("OpendiaryMapper.diaryImgList");
		System.out.println(diaryImgList);
		return diaryImgList;
	}

	@Override
	public Opendiary selectOneOpend(int opendiaryNo) {
		Opendiary selectOne = sqlSession.selectOne("OpendiaryMapper.opendiaryOne", opendiaryNo);
		System.out.println(selectOne);
		return selectOne;
	}

	@Override
	public int insertOpend(Opendiary opendiary) {
		int result = sqlSession.insert("OpendiaryMapper.insertDiary",opendiary);
		System.out.println("과연 opendiaryNo : "+ opendiary.getOpendiaryNo());
		return  result;
	}
	//사진을 넣어준다.
	public int insertfileImg(HashMap<String, String> imgfile) {
		int result = sqlSession.insert("OpendiaryMapper.insertImgFile", imgfile);
		return result;
	}

	@Override
	public int updateOpend(Opendiary opendiary) {
		return sqlSession.update("OpendiaryMapper.updateOpendiary", opendiary);
	}

	@Override
	public int deleteOpend(int opendiaryNo) {
		return sqlSession.delete("OpendiaryMapper.deleteOpend", opendiaryNo);
	}

	@Override
	public int insertOpendCom(OpendiaryComment opendiaryComment) {
		int result = sqlSession.insert("OpendiaryMapper.insertOpendCom", opendiaryComment);
		System.out.println("댓글 작성 : " + result);
		return result;
	}

	@Override
	public int updateOpendCom(OpendiaryComment opendiaryCom) {
		return 0;
	}

	@Override
	public int deleteOpendCom(int openComNo) {
		return sqlSession.delete("OpendiaryMapper.deleteOpendCom", openComNo);
	}

	@Override
	public ArrayList<Opendiary> selectSearchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.openSearchList", search, rowBounds);
	}

	@Override
	public int addViewCount(int opendiaryNo) {
		return sqlSession.update("OpendiaryMapper.addViewCount", opendiaryNo);
	}

	@Override
	public ArrayList<DiaryImg> selectDiaryImgList(int opendiaryNo) {
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.selectDiaryImgList", opendiaryNo);
	}

	@Override
	public int deleteFile(HashMap<String, Object> map) {
		return sqlSession.delete("OpendiaryMapper.deleteFileOne", map);
	}

	@Override
	public int deleteAllFile(int opendiaryNo) {
		return sqlSession.delete("OpendiaryMapper.deleteAllFile", opendiaryNo);
	}

	@Override
	public int insertfileImgUpdate(HashMap<String, Object> imgfile) {
		return sqlSession.insert("OpendiaryMapper.insertImgFileUpdate", imgfile);
	}

	@Override
	public DiaryImg diaryImgListNo(int opendiaryNo) {
		return sqlSession.selectOne("OpendiaryMapper.MianImgPath", opendiaryNo);
	}

	@Override
	public int updateMainImg(int opendiaryNo) {
		return sqlSession.update("OpendiaryMapper.updateMainImg", opendiaryNo);
	}

	@Override
	public ArrayList<OpendiaryComment> opendiaryComList(int opendiaryNo, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.opendiaryComList", opendiaryNo, rowBounds);
	}

	@Override
	public int insertOpenComReply(OpendiaryComment opendiaryCom) {
		return sqlSession.insert("OpendiaryMapper.insertOpenComReply", opendiaryCom);
	}

	@Override
	public ArrayList<OpendiaryComment> opendiaryComReplyList(HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.opendiaryComReplyList", map);
	}

	@Override
	public int updateOpendImage(HashMap<String, Object> imgupdate) {
		return sqlSession.update("OpendiaryMapper.updateOpendImage", imgupdate);
	}

	@Override
	public ArrayList<Opendiary> openContentsList(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.openContentsList", userId, rowBounds);
	}

	@Override
	public int getComReplyListCount() {
		return sqlSession.selectOne("OpendiaryMapper.getComReplyListCount");
	}

//	@Override
//	public int selectOneOpendiaryNo() {
//		int result = sqlSession.selectOne("OpendiaryMapper.selectOneNo");
//		System.out.println(result);
//		return result;
//	}
	
}
