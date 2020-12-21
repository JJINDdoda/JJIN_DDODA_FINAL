package com.kh.ddoda.changePhoto.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.changePhoto.domain.ChangePhoto;



@Repository
public class ChangePhotoStoreLogic implements ChangePhotoStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private ChangePhoto changPhoto;
	@Override
	public int getListCount() {
		return 0;
	}
	@Override
	public ArrayList<ChangePhoto> selectList(String userId) {
		return (ArrayList)sqlSession.selectList("changePhotoMapper.selectList", userId);
	}
	@Override
	public int addReadCount(int myChangeNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public ChangePhoto selectChangePhoto(int myChangeNo) {
		return sqlSession.selectOne("changePhotoMapper.selectOne", myChangeNo);
	}
	@Override
	public int insertChangePhoto(ChangePhoto changePhoto) {
		int result = sqlSession.insert("changePhotoMapper.insertChangePhoto", changePhoto);
		return result;
	}
	@Override
	public int updateChangePhoto(ChangePhoto changePhoto) {
		return sqlSession.update("changePhotoMapper.updateChangePhoto", changePhoto);
	}
	@Override
	public int deleteChangePhoto(int myChangeNo) {
		return sqlSession.delete("changePhotoMapper.deleteChangePhoto", myChangeNo);
	}
	@Override
	public int changePublicCode(ChangePhoto changePhoto) {
		return sqlSession.update("changePhotoMapper.changePublicCode", changePhoto);
	}
	@Override
	public int emptyFile(ChangePhoto changePhoto) {
		return sqlSession.update("changePhotoMapper.emptyFile",changePhoto);
	}
	@Override
	public ChangePhoto selectChangePhoto(ChangePhoto changePhoto) {
		return sqlSession.selectOne("changePhotoMapper.selectOneByPhoto", changePhoto);
	}
	
	

}
