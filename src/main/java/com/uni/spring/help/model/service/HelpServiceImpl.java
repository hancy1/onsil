package com.uni.spring.help.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.help.model.dao.HelpDao;
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
}
