package com.uni.spring.help.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.help.model.dto.Answer;
import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.Inquiry;
import com.uni.spring.help.model.dto.Notice;
import com.uni.spring.help.model.dto.PageInfo;

@Repository
public class HelpDao {

	// 자주묻는질문 게시물 갯수 구하기 - 페이징처리
	public static int selectFaqListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("helpMapper.selectFaqListCount");
	}

	// 자주묻는질문 게시물 가져오기 
	public static ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectFaqList", null, rowBounds);
	}

	// 자주묻는질문 - 카테고리정렬 게시물 갯수
	public static int selectFaqListCount(SqlSessionTemplate sqlSession, int code) {
		
		return sqlSession.selectOne("helpMapper.selectFaqListCount2", code);
	}

	// 자주묻는질문 - 카테고리정렬 게시물 가져오기
	public static ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi, int code) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectFaqList2", code, rowBounds);
	}
		
	// 공지사항 게시물 갯수 구하기 - 페이징 처리
	public static int selectNoticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("helpMapper.selectNoticeListCount");
	}

	// 공지사항 게시물 가져오기
	public static ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectNoticeList", null, rowBounds);
	}

	// 공지사항 카테고리별 게시물 갯수 구하기
	public static int selectNoticeListCount(SqlSessionTemplate sqlSession, int code) {

		return sqlSession.selectOne("helpMapper.selectNoticeListCount2", code);
	}

	// 공지사항 카테고리별 게시물 가져오기
	public static ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, int code) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectNoticeList2", code, rowBounds);
	}
	
	// 문의사항 게시물 갯수 구하기 - 페이징 처리
	public static int selectInquiryListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("helpMapper.selectInquiryListCount");
	}

	// 문의사항 게시물 가져오기
	public static ArrayList<Inquiry> selectInquiryList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());				
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectInquiryList", null, rowBounds);
	}

	// 문의사항 카테고리별 게시물 갯수구하기
	public static int selectInquiryListCount(SqlSessionTemplate sqlSession, int code) {

		return sqlSession.selectOne("helpMapper.selectInquiryListCount2", code);
	}

	// 문의사항 카테고리별 게시물 가져오기
	public static ArrayList<Inquiry> selectInquiryList(SqlSessionTemplate sqlSession, PageInfo pi, int code) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectInquiryList2", code, rowBounds);
	}

	
	// 문의사항 조회수 높이기
	public static int increaseCount(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.update("helpMapper.increaseCount", ino);
	}
	
	// 공지사항 디테일 뷰
	public static Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		
		return (Notice)sqlSession.selectOne("helpMapper.selectNotice", nno);
	}

	// 문의사항 디테일 뷰
	public static Inquiry selectInquiry(SqlSessionTemplate sqlSession, int ino) {
		
		sqlSession.update("helpMapper.updateReplyCount", ino); // 댓글 수 업데이트
		
		return (Inquiry)sqlSession.selectOne("helpMapper.selectInquiry", ino);
	}

	// 문의사항 댓글리스트
	public static ArrayList<Answer> selectReplyList(SqlSessionTemplate sqlSession, int ino) {
		
		sqlSession.update("helpMapper.updateReplyCount", ino); // 댓글 수 업데이트
		 
		return (ArrayList)sqlSession.selectList("helpMapper.selectReplyList", ino);
	}

	// 문의사항 댓글작성
	public static int insertReply(SqlSessionTemplate sqlSession, Answer a) {
		
		return sqlSession.insert("helpMapper.insertReply", a);
	}

	// 문의사항 댓글삭제
	public static int deleteReply(SqlSessionTemplate sqlSession, int answerNo) {
		
		return sqlSession.delete("helpMapper.deleteReply", answerNo);
	}

	// 문의사항 댓글수정
	public static int updateReply(SqlSessionTemplate sqlSession, Answer a) {

		return sqlSession.update("helpMapper.updateReply", a);
	}

	// 문의사항 글 작성
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		
		return sqlSession.insert("helpMapper.insertInquiry", i);
	}

	// 문의사항 글 수정
	public int updateInquiry(SqlSessionTemplate sqlSession, Inquiry i) {

		return sqlSession.update("helpMapper.updateInquiry", i);
	}

	// 문의사항 글 삭제
	public int deleteInquiry(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.update("helpMapper.deleteInquiry", ino);
	}

	// 관리자 - 자주묻는질문 게시물 갯수 구하기
	public static int selectAdminFaqListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("helpMapper.selectAdminFaqListCount");
	}

	// 관리자 - 자주묻는질문 리스트
	public static ArrayList<Faq> selectAdminFaqList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectAdminFaqList", null, rowBounds);
	}

	// 관리자 - 자주묻는질문 디테일뷰
	public static Faq selectAdminFaq(SqlSessionTemplate sqlSession, int fno) {
		
		return (Faq)sqlSession.selectOne("helpMapper.selectAdminFaq", fno);
	}

	// 관리자 - 자주묻는질문 글작성
	public int inserAdminFaq(SqlSessionTemplate sqlSession, Faq f) {

		return sqlSession.insert("helpMapper.inserAdminFaq", f);
	}

	// 관리자 - 자주묻는질문 글 삭제
	public int deleteAdminFaq(SqlSessionTemplate sqlSession, int fno) {

		return sqlSession.update("helpMapper.deleteAdminFaq", fno);
	}

	// 관리자 - 자주묻는질문 글 수정
	public int updateAdminFaq(SqlSessionTemplate sqlSession, Faq f) {

		return sqlSession.update("helpMapper.updateAdminFaq", f);
	}

	// 관리자 - 공지사항 게시물 갯수 구하기
	public static int selectAdminNoticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("helpMapper.selectAdminNoticeListCount");
	}

	// 관리자 - 공지사항 게시물 가져오기
	public static ArrayList<Notice> selectAdminNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectAdminNoticeList", null, rowBounds);
	}

	// 관리자 - 공지사항 디테일 뷰
	public static Notice selectAdminNotice(SqlSessionTemplate sqlSession, int nno) {
		
		return (Notice)sqlSession.selectOne("helpMapper.selectAdminNotice", nno);
	}

	// 관리자 - 공지사항 글작성
	public int insertAdminNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("helpMapper.insertAdminNotice", n);
	}

	// 관리자 - 공지사항 글수정
	public int updateAdminNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("helpMapper.updateAdminNotice", n);
	}

	// 관리자 - 공지사항 글삭제
	public int deleteAdminNotice(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.update("helpMapper.deleteAdminNotice", nno);
	}

	// 관리자 - 문의사항 관리 리스트 뷰 게시물 갯수
	public static int selectAdminInquiryListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("helpMapper.selectAdminInquiryListCount");
	}

	// 관리자 - 문의사항 리스트뷰
	public static ArrayList<Inquiry> selectAdminInquiryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectAdminInquiryList", null, rowBounds);
	}

	// 관리자 - 문의사항 디테일 뷰
	public static Inquiry selectAdminInquiry(SqlSessionTemplate sqlSession, int ino) {
		
		return (Inquiry)sqlSession.selectOne("helpMapper.selectAdminInquiry", ino);
	}

	// 답변완료했는지체크 Y 로 변경
	public static Object updateAnswerStatus(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.update("helpMapper.updateAnswerStatus", ino);
	}
	
	// 답변완료했는지체크 N 로 변경
	public static Object updateAnswerStatus2(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.update("helpMapper.updateAnswerStatus2", ino);
		
	}

	// 관리자 - 문의사항 관리 리스트 뷰 게시물 갯수 - 답변 전
	public static int selectAdminInquiryListCount2(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("helpMapper.selectAdminInquiryListCount2");
	}

	// 관리자 - 문의사항 관리 리스트 뷰  - 답변 전
	public static ArrayList<Inquiry> selectAdminInquiryList2(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectAdminInquiryList2", null, rowBounds);
	}

	// 관리자 - 문의사항 관리 리스트 뷰 게시물 갯수 - 답변완료
	public static int selectAdminInquiryListCount3(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("helpMapper.selectAdminInquiryListCount3");
	}

	// 관리자 - 문의사항 관리 리스트 뷰  - 답변완료
	public static ArrayList<Inquiry> selectAdminInquiryList3(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectAdminInquiryList3", null, rowBounds);
	}

	

	
	

	

	

	

	

	
}
