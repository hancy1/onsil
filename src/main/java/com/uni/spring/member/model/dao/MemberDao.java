package com.uni.spring.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.help.model.dto.Notice;
import com.uni.spring.help.model.dto.PageInfo;
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

	// 회원정보수정
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}

	// 탈퇴하기
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	// 관리자 - 회원관리 회원수구하기
	public static int selectAdminMemberListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectAdminMemberListCount");
	}

	// 관리자 - 회원관리 회원리스트 가져오기
	public static ArrayList<Member> selectAdminMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAdminMemberList", null, rowBounds);
	}

	// 관리자 - 회원관리 디테일뷰
	public static Member selectAdminMember(SqlSessionTemplate sqlSession, int mno) {
		
		return (Member)sqlSession.selectOne("memberMapper.selectAdminMember", mno);
	}

	// 관리자 - 회원관리 회원강퇴
	public int deleteAdminMember(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("memberMapper.deleteAdminMember", mno);
	}

	// 관리자 - 회원복구
	public int updateAdminMember(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("memberMapper.updateAdminMember", mno);
	}

}
