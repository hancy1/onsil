package com.uni.spring.member.model.service;

import com.uni.spring.member.model.dto.Member;

public interface MemberService {

	Member loginMember(Member m) throws Exception; // 암호화 전 로그인

	int idCheck(String id); // 아이디 중복체크

	void insertMember(Member m); // 회원가입
 
}
