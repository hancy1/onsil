package com.uni.spring.member.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.uni.spring.member.model.dto.Member;

public interface MemberService {

	Member loginMember(Member m) throws Exception; // 암호화 전 로그인

	int idCheck(String id); // 아이디 중복체크

	void insertMember(Member m); // 회원가입

	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m); // 암호화 후 로그인

	Member updateMember(Member m) throws Exception; // 회원정보수정

	void deleteMember(String userId); // 탈퇴하기

	
}
