package com.uni.spring.help.model.service;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;

import com.uni.spring.help.model.dto.Answer;
import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.Inquiry;
import com.uni.spring.help.model.dto.Notice;
import com.uni.spring.help.model.dto.PageInfo;

public interface HelpService {

	int selectFaqListCount(); // 자주묻는질문 게시물 갯수 구하기

	ArrayList<Faq> selectFaqList(PageInfo pi); // 자주묻는질문 게시물 가져오기

	int selectFaqListCount(int code); // 자주묻는질문 카테고리별 게시물 갯수

	ArrayList<Faq> selectFaqList(PageInfo pi, int code); // 자주묻는질문 카테고리별 정렬 가져오기
	
	int selectNoticeListCount(); // 공지사항 게시물 갯수 구하기

	ArrayList<Notice> selectNoticeList(PageInfo pi); // 공지사항 게시물 가져오기
	
	int selectNoticeListCount(int code); // 공지사항 카테고리별 게시물 갯수 구하기

	ArrayList<Notice> selectNoticeList(PageInfo pi, int code); // 공지사항 카테고리별 게시물 가져오기

	int selectInquiryListCount(); // 문의사항 게시물 갯수 구하기

	ArrayList<Inquiry> selectInquiryList(PageInfo pi); // 문의사항 게시물 가져오기
	
	int selectInquiryListCount(int code); // 문의사항 카테고리별 게시물 갯수 구하기

	ArrayList<Inquiry> selectInquiryList(PageInfo pi, int code); // 문의사항 카테고리별 게시물 가져오기

	Notice selectNotice(int nno); // 공지사항 디테일 뷰

	Inquiry selectInquiry(int ino); // 문의사항 디테일 뷰

	ArrayList<Answer> selectReplyList(int ino); // 문의사항 댓글리스트

	int insertReply(Answer a); // 문의사항 댓글작성

	int deleteReply(int answerNo); // 문의사항 댓글삭제

	int updateReply(Answer a); // 문의사항 댓글수정

	void insertInquiry(Inquiry i); // 문의사항 글 작성

	void updateInquiry(Inquiry i); // 문의사항 글 수정

	void deleteInquiry(int ino); // 문의사항 글 삭제

	int selectAdminFaqListCount(); // 관리자 - 자주묻는질문 게시물 갯수 구하기

	ArrayList<Faq> selectAdminFaqList(PageInfo pi); // 관리자 - 자주묻는질문 게시물 가져오기

	Faq selectAdminFaq(int fno); // 관리자 - 자주묻는질문 디테일뷰

	void inserAdminFaq(Faq f); // 관리자 - 자주묻는질문 글작성

	void deleteAdminFaq(int fno); // 관리자 - 자주묻는질문 글 삭제

	void updateAdminFaq(Faq f); // 관리자 - 자주묻는질문 글 수정

	int selectAdminNoticeListCount(); // 관리자 - 공지사항 게시물 갯수 구하기

	ArrayList<Notice> selectAdminNoticeList(PageInfo pi); // 관리자 - 공지사항 게시물 가져오기

	Notice selectAdminNotice(int nno); // 관리자 - 공지사항 디테일 뷰

	void insertAdminNotice(Notice n); // 관리자 - 공지사항 글작성

	void updateAdminNotice(Notice n); // 관리자 - 공지사항 글수정

	void deleteAdminNotice(int nno); // 관리자 - 공지사항 글삭제

	int selectAdminInquiryListCount(); // 관리자 - 문의사항 관리 리스트 뷰 게시물 갯수

	ArrayList<Inquiry> selectAdminInquiryList(PageInfo pi); // 관리자 - 문의사항 리스트뷰

	Inquiry selectAdminInquiry(int ino); // 관리자 - 문의사항 디테일 뷰
	
	void deleteAdminInquiry(int ino); // 관리자 - 문의사항 글 삭제

	int selectAdminInquiryListCount2(); // 관리자 - 문의사항 관리 리스트 뷰 게시물 갯수 - 답변 전

	ArrayList<Inquiry> selectAdminInquiryList2(PageInfo pi); // 관리자 - 문의사항 관리 리스트 뷰  - 답변 전

	int selectAdminInquiryListCount3(); // 관리자 - 문의사항 관리 리스트 뷰 게시물 갯수 - 답변완료

	ArrayList<Inquiry> selectAdminInquiryList3(PageInfo pi); // 관리자 - 문의사항 관리 리스트 뷰  - 답변완료

	

	

	

	
 
	

}
