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
		return sqlSession.update("memberMapper.deleteMember", userId );
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
		
		return sqlSession.selectOne("memberMapper.checkId",userId);
	}

	@Override
	public int emailCheck(String email) {
		System.out.println(email);
		return sqlSession.selectOne("memberMapper.checkEmail",email);
	}

	@Override
	public int phoneCheck(String phone) {
		// TODO Auto-generated method stub
		System.out.println(phone);
		return sqlSession.selectOne("memberMapper.checkPhone",phone);
	}

	

	@Override
	public Member selectOne(String userId) {
		return sqlSession.selectOne("memberMapper.selectOne", userId );
	}

	@Override
	public Member FindPw(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.findPwd", member);
	}

	@Override
	public Member FindId(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.findId",member);
	}
	

}
