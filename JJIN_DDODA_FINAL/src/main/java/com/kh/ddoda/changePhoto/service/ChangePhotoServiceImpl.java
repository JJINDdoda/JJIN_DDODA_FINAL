package com.kh.ddoda.changePhoto.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.changePhoto.domain.ChangePhoto;
import com.kh.ddoda.changePhoto.store.ChangePhotoStore;



@Service
public class ChangePhotoServiceImpl implements ChangePhotoService {

	@Autowired
	private ChangePhotoStore cpStore;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ChangePhoto> selectList(String userId) {
		System.out.println(cpStore.selectList(userId));
		return cpStore.selectList(userId);
	}

	@Override
	public int addReadCount(int myChangeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ChangePhoto selectChangePhoto(int myChangeNo) {
		return cpStore.selectChangePhoto(myChangeNo);
	}

	@Override
	public int registerChangePhoto(ChangePhoto changePhoto) {
		return cpStore.insertChangePhoto(changePhoto);
	}

	@Override
	public int modifyChangePhoto(ChangePhoto changePhoto) {
		return cpStore.updateChangePhoto(changePhoto);
	}

	@Override
	public int deleteChangePhoto(int myChangeNo) {
		return cpStore.deleteChangePhoto(myChangeNo);
	}

	@Override
	public int changePublicCode(ChangePhoto changePhoto) {
		return cpStore.changePublicCode(changePhoto);
	}

	@Override
	public int emptyFile(ChangePhoto changePhoto) {
		return cpStore.emptyFile(changePhoto);
	}

	@Override
	public ChangePhoto selectChangePhoto(ChangePhoto changePhoto) {
		return cpStore.selectChangePhoto(changePhoto);
	}

	
	
	

}
