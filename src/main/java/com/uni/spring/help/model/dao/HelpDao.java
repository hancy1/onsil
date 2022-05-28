package com.uni.spring.help.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
		
		return (Inquiry)sqlSession.selectOne("helpMapper.selectInquiry", ino);
	}

}
