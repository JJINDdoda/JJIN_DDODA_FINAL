package com.kh.ddoda.opendiary.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
		return (ArrayList)sqlSession.selectList("OpendiaryMapper.odList", pi);
	}

	@Override
	public Opendiary selectOndOpend(int opendiaryNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertOpend(Map<String, Object> parameters) {
		int result = sqlSession.insert("OpendiaryMapper.insertOpend",parameters);
		System.out.println(result);
		return  result;
	}

	@Override
	public int updateOpend(Opendiary opendiary) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOpend(int opendiaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertOpendCom(OpendiaryComment opendiaryCom) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOpendCom(OpendiaryComment opendiaryCom) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOpendCom(int opendiaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Opendiary> selectSearchList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	//다이어리에 넣어준다.
		public int insertDiary(Opendiary opendiary) {
			return sqlSession.insert("OpendiaryMapper.insertDiary", opendiary);
		}
		//사진을 넣어준다.
		public int insertfileImg(HashMap<String, String> imgfile) {
			return sqlSession.insert("OpendiaryMapper.insertImgFile", imgfile);
		}
	
}
