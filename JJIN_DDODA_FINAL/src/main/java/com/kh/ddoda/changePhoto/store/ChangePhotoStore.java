package com.kh.ddoda.changePhoto.store;

import java.util.ArrayList;

import com.kh.ddoda.changePhoto.domain.ChangePhoto;



public interface ChangePhotoStore {

	
	public int getListCount();
	public ArrayList<ChangePhoto> selectList(String userId);


	public int addReadCount(int myChangeNo);
	public ChangePhoto selectChangePhoto(int myChangeNo);
	public ChangePhoto selectChangePhoto(ChangePhoto changePhoto);
	public int insertChangePhoto(ChangePhoto changePhoto);
	public int updateChangePhoto(ChangePhoto changePhoto);
	public int deleteChangePhoto(int myChangeNo);
	
	public int changePublicCode(ChangePhoto changePhoto);
	public int emptyFile(ChangePhoto changePhoto);
}
