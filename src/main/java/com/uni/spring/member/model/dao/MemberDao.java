package com.uni.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.member.model.dto.Member;

@Repository
public class MemberDao {

	// 암호화 전 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) { 
		
		Member m1 = sqlSession.selectOne("memberMapper.loginMember", m);
		return m1;
	}

	// 아이디 중복체크	
	public int idCheck(SqlSessionTemplate sqlSession, String id) {
				
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}

	// 회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

}
