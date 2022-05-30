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

	

	

	
}
