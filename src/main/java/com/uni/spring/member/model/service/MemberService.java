package com.uni.spring.member.model.service;

import com.uni.spring.member.model.dto.Member;

public interface MemberService {

	Member loginMember(Member m) throws Exception; // 암호화 전 로그인

}
