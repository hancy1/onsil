package com.uni.spring.help.model.service;

import java.util.ArrayList;

import com.uni.spring.help.model.dto.Answer;
import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.Inquiry;
import com.uni.spring.help.model.dto.Notice;
import com.uni.spring.help.model.dto.PageInfo;

public interface HelpService {

	int selectFaqListCount(); // 자주묻는질문 게시물 갯수 구하기

	ArrayList<Faq> selectFaqList(PageInfo pi); // 자주묻는질문 게시물 가져오기

	int selectNoticeListCount(); // 공지사항 게시물 갯수 구하기

	ArrayList<Notice> selectNoticeList(PageInfo pi); // 공지사항 게시물 가져오기

	int selectInquiryListCount(); // 문의사항 게시물 갯수 구하기

	ArrayList<Inquiry> selectInquiryList(PageInfo pi); // 문의사항 게시물 가져오기

	Notice selectNotice(int nno); // 공지사항 디테일 뷰

	Inquiry selectInquiry(int ino); // 문의사항 디테일 뷰

	ArrayList<Answer> selectReplyList(int ino); // 문의사항 댓글리스트

	int insertReply(Answer a); // 문의사항 댓글작성

	int deleteReply(int answerNo); // 문의사항 댓글삭제

	int updateReply(Answer a); // 문의사항 댓글수정

	void insertInquiry(Inquiry i); // 문의사항 글 작성

	void updateInquiry(Inquiry i); // 문의사항 글 수정
	

	

}
