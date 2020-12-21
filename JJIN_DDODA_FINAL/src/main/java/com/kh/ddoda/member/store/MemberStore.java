package com.kh.ddoda.member.store;

import com.kh.ddoda.member.domain.Member;

public interface MemberStore {

	/**
	 * 
	 * @param member
	 * @return int
	 */
	public int insertMember(Member member);
	/**
	 * 회원탈퇴
	 * @param userId
	 * @return int
	 */
	public int deleteMember(String userId);
	
	/**
	 * 회원정보수정
	 * @param member
	 * @return int
	 */
	public int updateMember(Member member);
	
	/**
	 * 로그인
	 * @param member
	 * @return Member
	 */
	public Member memberLogin(Member member);
	
	/**
	 * 아이디중복검사
	 * @param userId
	 * @return int
	 */
	public int idCheck(String userId);
	
	/**
	 * 이메일중복검사
	 * @param email
	 * @return int
	 */
	public int emailCheck(String email);
	
	/**
	 * 핸드폰중복검사
	 * @param phone
	 * @return int
	 */
	public int phoneCheck(String phone);
	/**
	 * 비밀번호찾기
	 * @param userId
	 * @return Member
	 */
	public Member FindPw(String userId);
	
	/**
	 * 아이디찾기
	 * @param email
	 * @return Member
	 */
	public Member FindId(String email);
	
	
	/**
	 * 회원정보 불러오기
	 * @param userId
	 * @return Member
	 */
	public Member selectOne(String userId);
	
	
	
}
