package com.kh.ddoda.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.member.domain.Member;
import com.kh.ddoda.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{

	
	@Autowired
	private MemberStore store;
	
	
	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return store.insertMember(member);
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return store.updateMember(member);
	}

	@Override
	public Member memberLogin(Member member) {
	
		return store.memberLogin(member);
	}

	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		return  0; /*store.idCheck(userId);*/
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int phoneCheck(String phone) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member FindPw(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member FindId(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member selectOne(String userId) {
	
		return store.selectOne(userId);
	}
}
