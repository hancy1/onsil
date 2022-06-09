package com.uni.spring.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.garden.model.dto.PlantInfo;
import com.uni.spring.help.model.dto.PageInfo;
import com.uni.spring.member.model.dao.MemberDao;
import com.uni.spring.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@Override // 암호화 전 로그인
	public Member loginMember(Member m) throws Exception {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		if(loginUser == null) {
			throw new Exception("loginUser 확인");
		}
		
		return loginUser;
		
	}


	@Override // 아이디 중복체크
	public int idCheck(String id) {
		
		int result = memberDao.idCheck(sqlSession, id);
		if(result < 0) {
			throw new CommException("아이디 체크에 실패 하였습니다.");
		}
		
		return result;
	}


	@Override // 회원가입
	public void insertMember(Member m) {
		int result = memberDao.insertMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회원가입에 실패하였습니다."); // RuntimeException 을 날려줬기 때문에 spring 자체에서 처리를 해줘서 try-catch 안해도됨.
			// spring 에서 db 에러는 DataAccessResourceException 똑같은 에러를 던져줌
		}
		
	}


	@Override // 암호화 후 로그인
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
				
		if(loginUser == null) {
			
			throw new CommException("loginUser 확인");
		}
		
		// matches (평문, 암호화) --> true, false 반환
		if(!bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
						
			throw new CommException("아이디와 암호가 올바르지 않습니다.");
		}		
		
		return loginUser;
	}


	@Override // 회원정보 수정
	public Member updateMember(Member m) throws Exception{
		
		int result = memberDao.updateMember(sqlSession, m);
		
		if(result > 0) {
			Member loginUser = memberDao.loginMember(sqlSession, m);
			return loginUser;
		}else {
			throw new Exception("회원수정실패");
		}
		
		
	}


	@Override // 탈퇴하기
	public void deleteMember(String userId) { 
		
		int result = memberDao.deleteMember(sqlSession, userId);
		
		if(result < 0) {
			
			throw new CommException("회원탈퇴실패");
		}
		
	}


	@Override // 관리자 - 회원관리 회원수구하기
	public int selectAdminMemberListCount() {
		
		return MemberDao.selectAdminMemberListCount(sqlSession);
	}


	@Override // 관리자 - 회원관리 회원리스트 가져오기
	public ArrayList<Member> selectAdminMemberList(PageInfo pi) {
		
		return MemberDao.selectAdminMemberList(sqlSession, pi);
	}


	@Override // 관리자 - 회원관리 디테일뷰
	public Member selectAdminMember(int mno) {
		
		return MemberDao.selectAdminMember(sqlSession, mno);
	}


	@Override // 관리자 - 회원관리 강퇴
	public void deleteAdminMember(int mno) {
		
		int result = memberDao.deleteAdminMember(sqlSession, mno);
		
		if(result < 0) {
			
			throw new CommException("회원강퇴실패");
		}
		
	}


	@Override // 관리자 - 회원관리 복구
	public void updateAdminMember(int mno) {
		
		int result = memberDao.updateAdminMember(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("관리자 회원복구 실패");
		}
		
	}


	@Override // 선호도에 맞는 식물정보 가져오기
	public PlantInfo searchPlant(String preference) {
		
		return memberDao.searchPlant(sqlSession, preference);
		
	}


	
}
