package com.kh.ddoda.changePhoto.service;

import java.util.ArrayList;

import com.kh.ddoda.changePhoto.domain.ChangePhoto;





public interface ChangePhotoService {
	
	public int getListCount();
	
	public ArrayList<ChangePhoto> selectList(String userId);
	
	
	public int addReadCount(int myChangeNo);
	public ChangePhoto selectChangePhoto(int myChangeNo);
	public ChangePhoto selectChangePhoto(ChangePhoto changePhoto);
	public int registerChangePhoto(ChangePhoto changePhoto);
	public int modifyChangePhoto(ChangePhoto changePhoto);
	public int deleteChangePhoto(int myChangeNo);
	
	public int changePublicCode(ChangePhoto changePhoto);
	public int emptyFile(ChangePhoto changePhoto);
	

	
	
}
