package com.uni.spring.member.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.uni.spring.help.model.dto.PageInfo;
import com.uni.spring.member.model.dto.Member;

public interface MemberService {

	Member loginMember(Member m) throws Exception; // 암호화 전 로그인

	int idCheck(String id); // 아이디 중복체크

	void insertMember(Member m); // 회원가입

	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m); // 암호화 후 로그인

	Member updateMember(Member m) throws Exception; // 회원정보수정

	void deleteMember(String userId); // 탈퇴하기

	int selectAdminMemberListCount(); // 관리자 - 회원관리 회원수 구하기

	ArrayList<Member> selectAdminMemberList(PageInfo pi); // 관리자 - 회원관리 회원리스트 가져오기

	Member selectAdminMember(int mno); // 관리자 - 회원관리 디테일뷰

	
}
