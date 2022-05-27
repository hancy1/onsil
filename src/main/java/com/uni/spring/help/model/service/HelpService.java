package com.uni.spring.help.model.service;

import java.util.ArrayList;

import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.Notice;
import com.uni.spring.help.model.dto.PageInfo;

public interface HelpService {

	int selectFaqListCount(); // 자주묻는질문 게시물 갯수 구하기

	ArrayList<Faq> selectFaqList(PageInfo pi); // 자주묻는질문 게시물 가져오기

	int selectNoticeList(); // 공지사항 게시물 갯수 구하기

	ArrayList<Notice> selectNoticeList(PageInfo pi); // 공지사항 게시물 가져오기

}
