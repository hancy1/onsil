package com.uni.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.member.model.dao.MemberDao;
import com.uni.spring.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private MemberDao memberDao;


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
			
			throw new CommException("암호불일치");
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
}
