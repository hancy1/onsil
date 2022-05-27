package com.uni.spring.help.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uni.spring.help.HelpPagination;
import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.Notice;
import com.uni.spring.help.model.dto.PageInfo;
import com.uni.spring.help.model.service.HelpService;
import com.uni.spring.help.model.service.HelpServiceImpl;

@Controller
public class HelpController {

	@Autowired
	private HelpService helpService;
		
	@Autowired 
	private HelpServiceImpl helpServiceImpl;
	
	// 자주묻는질문 페이지 이동
	@RequestMapping("faqList.do")
	public String selectFaqList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectFaqListCount();
		System.out.println(listCount);
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Faq> list = helpService.selectFaqList(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/faqPage";
	}
	
	
	// 공지사항 페이지 이동	
	@RequestMapping("noticeList.do")
	public String selectNoticeList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectNoticeList();
		System.out.println(listCount);
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Notice> list = helpService.selectNoticeList(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/noticeListView";
	}
}
