package com.kh.ddoda.calendar.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.opendiary.domain.DiaryImg;
import com.kh.ddoda.opendiary.domain.Opendiary;

@Repository
public class CalendarStoreLogic implements CalendarStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertDiary(Opendiary opendiary) {
		return sqlSession.insert("OpendiaryMapper.insertMyDiary", opendiary);
	}

	@Override
	public int modifyDiary(Opendiary opendiary) {
		return sqlSession.update("OpendiaryMapper.modifyMyDiary", opendiary);
	}

	@Override
	public int deleteDiary(int opendiaryNo) {
		return sqlSession.delete("OpendiaryMapper.deleteMyDiary", opendiaryNo);
	}

	@Override
	public Opendiary selectOneDiary(int opendiaryNo) {
		return sqlSession.selectOne("OpendiaryMapper.selectMyDiary", opendiaryNo);
	}

	@Override
	public int insertfileImg(HashMap<String, String> parameters) {
		return sqlSession.insert("OpendiaryMapper.insertImgFile", parameters);
	}

	@Override
	public int deleteFile(HashMap<String, Object> map) {
		return sqlSession.delete("OpendiaryMapper.deleteMyFile", map);
	}

	@Override
	public ArrayList<Opendiary> mydiaryList(String userId) {
		ArrayList<Opendiary> opendList = (ArrayList)sqlSession.selectList("OpendiaryMapper.mydiaryList", userId);
		System.out.println(opendList+", "+userId);
		return opendList;
	}

	@Override
	public ArrayList<DiaryImg> mydiaryFileList(int opendiaryNo) {
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.mydiaryFileList", opendiaryNo);
	}

	@Override
	public int updateMyDiaryImage(HashMap<String, Object> imgupdate) {
		return sqlSession.update("OpendiaryMapper.updateMyDiaryImage", imgupdate);
	}

	@Override
	public int updateMainImg(int opendiaryNo) {
		return sqlSession.update("OpendiaryMapper.updateMainImg", opendiaryNo);
	}

	@Override
	public int insertfileImgModify(HashMap<String, Object> imgfile) {
		return sqlSession.update("OpendiaryMapper.insertImgFileUpdate", imgfile);
	}

	@Override
	public int deleteAllFile(int opendiaryNo) {
		return sqlSession.delete("OpendiaryMapper.deleteAllFile", opendiaryNo);
	}

}
