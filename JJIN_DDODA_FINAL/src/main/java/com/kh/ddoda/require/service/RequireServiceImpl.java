package com.kh.ddoda.require.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.require.domain.Reply;
import com.kh.ddoda.require.domain.Require;
import com.kh.ddoda.require.store.RequireStore;

@Service
public class RequireServiceImpl implements RequireService {
	
	@Autowired
	private RequireStore rStore;
	
	@Override
	public int getRequireListCount() {
		return rStore.getRequireListCount();
	}

	@Override
	public ArrayList<Require> adminSelectList(PageInfo pi) {
		return rStore.adminSelectList(pi);
	}

	@Override
	public Require adminSelectRequire(int requireNo) {
		return rStore.adminSelectRequire(requireNo);
	}

	@Override
	public Reply adminRequireReply(int requireNo) {
		return rStore.adminRequireReply(requireNo);
	}

	@Override
	public int insertRequireReply(Reply reply) {
		return rStore.insertRequireReply(reply);
	}

	@Override
	public int adminModifyRequire(Require require) {
		return rStore.adminModifyRequire(require);
	}

	@Override
	public int adminModifyRequireReply(Reply reply) {
		return rStore.adminModifyRequireReply(reply);
	}

	@Override
	public int adminDeleteRequire(int requireNo) {
		return rStore.adminDeleteRequire(requireNo);
	}

	@Override
	public int adminRequireStatus(int requireNo) {
		return rStore.adminRequireStatus(requireNo);
	}
}
