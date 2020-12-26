package com.kh.ddoda.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.common.PageInfo;
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
		return store.deleteMember(userId);
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
		return store.idCheck(userId);
	}

	@Override
	public int emailCheck(String email) {
		System.out.println(email);
		// TODO Auto-generated method stub
		return store.emailCheck(email);
	}

	@Override
	public int phoneCheck(String phone) {
		System.out.println(phone);
		// TODO Auto-generated method stub
		return store.phoneCheck(phone);
	}

	

	@Override
	public Member selectOne(String userId) {
		return store.selectOne(userId);
	}

	@Override
	public Member FindPw(Member member) {
		// TODO Auto-generated method stub
		return store.FindPw(member);
	}

	@Override
	public Member FindId(Member member) {
		// TODO Auto-generated method stub
		return store.FindId(member);
	}
	
	@Override
	public int getMemberListCount() {
		return store.getMemberListCount();
	}

	@Override
	public ArrayList<Member> adminSelectMemberList(PageInfo pi) {
		return store.adminSelectMemberList(pi);
	}

	@Override
	public Member adminSelectMember(String userId) {
		return store.adminSelectMember(userId);
	}

	@Override
	public int adminDeleteMember(String userId) {
		return store.adminDeleteMember(userId);
	}
}
