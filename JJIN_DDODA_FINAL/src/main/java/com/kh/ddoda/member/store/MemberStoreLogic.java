package com.kh.ddoda.member.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.member.domain.Member;

@Repository
public class MemberStoreLogic implements MemberStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		//sqlSession.insert("memberMapper.insertMember", member); 
		int result = sqlSession.insert("memberMapper.insertMember", member); 
		return result;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member member) {
		int result = sqlSession.update("memberMapper.updateMember",member);
		return result;
	}

	@Override
	public Member memberLogin(Member member) {
		Member loginUser = sqlSession.selectOne("memberMapper.memberLogin", member);
		
		return loginUser;
	}

	@Override
	public int idCheck(String userId) {
		/*
		 * int result = sqlSession.selectOne("memberMapper.idCheck",userId); return
		 * result;
		 */
		return 0;
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
		
		return sqlSession.selectOne("memberMapper.selectOne", userId );
	}
	

}
