package com.uni.spring.help.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.help.model.dao.HelpDao;
import com.uni.spring.help.model.dto.Answer;
import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.Inquiry;
import com.uni.spring.help.model.dto.Notice;
import com.uni.spring.help.model.dto.PageInfo;
import com.uni.spring.member.model.dao.MemberDao;

@Service
public class HelpServiceImpl implements HelpService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private HelpDao helpDao;


	@Override // 자주묻는질문 게시물 갯수 구하기
	public int selectFaqListCount() {
		
		return HelpDao.selectFaqListCount(sqlSession);
	}


	@Override // 자주묻는질문 게시물 가져오기
	public ArrayList<Faq> selectFaqList(PageInfo pi) {
		
		return HelpDao.selectFaqList(sqlSession, pi);
	}


	@Override // 공지사항 게시물 갯수 구하기
	public int selectNoticeListCount() {
		
		return HelpDao.selectNoticeListCount(sqlSession);
	}


	@Override // 공지사항 게시물 가져오기
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		
		return HelpDao.selectNoticeList(sqlSession, pi);
	}


	@Override // 문의사항 게시물 갯수 구하기
	public int selectInquiryListCount() {

		return HelpDao.selectInquiryListCount(sqlSession);
	}


	@Override // 문의사항 게시물 가져오기
	public ArrayList<Inquiry> selectInquiryList(PageInfo pi) {
		
		return HelpDao.selectInquiryList(sqlSession, pi);
	}


	@Override // 공지사항 디테일 뷰
	public Notice selectNotice(int nno) {
		
		return HelpDao.selectNotice(sqlSession, nno);
		
	}


	@Override // 문의사항 디테일 뷰
	public Inquiry selectInquiry(int ino) {
		
		Inquiry i = null;
		int result = HelpDao.increaseCount(sqlSession, ino); // 조회수 올리기
		
		if(result < 0) {
			
			throw new CommException("increaseCount 실패");
		}else {
			i = HelpDao.selectInquiry(sqlSession, ino);
		}
		
		return i;
	}


	@Override // 문의사항 댓글리스트
	public ArrayList<Answer> selectReplyList(int ino) {

		return HelpDao.selectReplyList(sqlSession, ino);
	}


	@Override // 문의사항 댓글작성
	public int insertReply(Answer a) {
		
		int result = HelpDao.insertReply(sqlSession, a);
		
		if(result < 0) {
			throw new CommException("댓글 추가 실패");
		}
		
		return result;	
	}


	@Override // 문의사항 댓글삭제
	public int deleteReply(int answerNo) {
		
		int result = HelpDao.deleteReply(sqlSession, answerNo);
		
		if(result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		
		return result;
	}


	@Override // 문의사항 댓글 수정
	public int updateReply(Answer a) {
		
		int result = HelpDao.updateReply(sqlSession, a);
		
		if(result < 0) {
			throw new CommException("댓글 수정 실패");
		}
		
		return result;
	}


	@Override // 문의사항 글 작성
	public void insertInquiry(Inquiry i) {
		
		int result = helpDao.insertInquiry(sqlSession, i);
		
		if(result < 0) {
			throw new CommException("문의사항 글작성 추가 실패");
		}
		
	}


	@Override // 문의사항 글 수정
	public void updateInquiry(Inquiry i) {
		
		int result = helpDao.updateInquiry(sqlSession, i);
		
		if(result < 0) {
			throw new CommException("문의사항 글 수정 실패");
		}
	}


	@Override // 문의사항 글 삭제
	public void deleteInquiry(int ino) {
			
		int result = helpDao.deleteInquiry(sqlSession, ino);
		
		if(result < 0) {
			throw new CommException("문의사항 글 삭제 실패");
		}
		
	}


	@Override // 관리자 - 자주묻는질문 게시물 갯수 구하기
	public int selectAdminFaqListCount() {
		
		return HelpDao.selectAdminFaqListCount(sqlSession);
	}


	@Override // 관리자 - 자주묻는질문 게시물 가져오기
	public ArrayList<Faq> selectAdminFaqList(PageInfo pi) {

		return HelpDao.selectAdminFaqList(sqlSession, pi);
	}


	@Override // 관리자 - 자주묻는질문 디테일뷰
	public Faq selectAdminFaq(int fno) {
		
		return HelpDao.selectAdminFaq(sqlSession, fno);
	}


	@Override // 관리자 - 자주묻는질문 글작성
	public void inserAdminFaq(Faq f) {
		
		int result = helpDao.inserAdminFaq(sqlSession, f);
		
		if(result < 0) {
			throw new CommException("관리자 자주묻는질문 글작성 추가 실패");
		}
	}


	@Override // 관리자 - 자주묻는질문 글 삭제
	public void deleteAdminFaq(int fno) {

		int result = helpDao.deleteAdminFaq(sqlSession, fno);
		
		if(result < 0) {
			throw new CommException("관리자 자주묻는질문 글 삭제 실패");
		}
		
	}


	@Override // 관리자 - 자주묻는질문 글 수정
	public void updateAdminFaq(Faq f) {

		int result = helpDao.updateAdminFaq(sqlSession, f);
		
		if(result < 0) {
			throw new CommException("관리자 자주묻는질문 글 수정 실패");
		}
		
	}


	@Override // 관리자 - 공지사항 게시물 갯수 구하기
	public int selectAdminNoticeListCount() {

		return HelpDao.selectAdminNoticeListCount(sqlSession);
	}


	@Override // 관리자 - 공지사항 게시물 가져오기
	public ArrayList<Notice> selectAdminNoticeList(PageInfo pi) {
		
		return HelpDao.selectAdminNoticeList(sqlSession, pi);
	}


	@Override // 관리자 - 공지사항 디테일 뷰
	public Notice selectAdminNotice(int nno) {
		
		return HelpDao.selectAdminNotice(sqlSession, nno);
	}


	@Override // 관리자 - 공지사항 글작성
	public void insertAdminNotice(Notice n) {
		
		int result = helpDao.insertAdminNotice(sqlSession, n);
		
		if(result < 0) {
			throw new CommException("관리자 공지사항 글작성 추가 실패");
		}
	}


	@Override // 관리자 - 공지사항 글 수정
	public void updateAdminNotice(Notice n) {
		
		int result = helpDao.updateAdminNotice(sqlSession, n);
		
		if(result < 0) {
			throw new CommException("관리자 공지사항 글 수정 실패");
		}
		
	}

	@Override // 관리자 - 공지사항 글 삭제
	public void deleteAdminNotice(int nno) {
		
		int result = helpDao.deleteAdminNotice(sqlSession, nno);
		
		if(result < 0) {
			throw new CommException("관리자 공지사항 글 삭제 실패");
		}
		
	}


	


	
}
