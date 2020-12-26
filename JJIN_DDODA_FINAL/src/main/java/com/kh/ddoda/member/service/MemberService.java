package com.kh.ddoda.member.service;

import java.util.ArrayList;

import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.member.domain.Member;

public interface MemberService {
	
	/**
	 * 회원가입
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
	public Member FindPw(Member member);
	
	/**
	 * 아이디찾기
	 * @param email
	 * @return Member
	 */
	public Member FindId(Member member);
	
	/**
	 * 회원정보 불러오기
	 * @param userId
	 * @return Member
	 */
	public Member selectOne(String userId);

	/**
	 * 관리자 게시글 전체 수 조회
	 * @return
	 */
	public int getMemberListCount();
	
	/**
	 * 관리자 회원 전체 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> adminSelectMemberList(PageInfo pi);
	
	/**
	 * 관리자 회원 상세조회
	 * @param userId
	 * @return
	 */
	public Member adminSelectMember(String userId);
	
	/**
	 * 관리자 회원 탈퇴결정
	 * @param userId
	 * @return
	 */
	public int adminDeleteMember(String userId);
}
