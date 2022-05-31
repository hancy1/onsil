package com.uni.spring.help.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.uni.spring.help.HelpPagination;
import com.uni.spring.help.model.dto.Answer;
import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.Inquiry;
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
		
		int listCount = helpService.selectNoticeListCount();
		System.out.println(listCount);
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Notice> list = helpService.selectNoticeList(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/noticeListView";
	}
		
	
	// 문의사항 페이지 이동	
	@RequestMapping("inquiryList.do")
	public String selectInquiryList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectInquiryListCount();
		System.out.println(listCount);
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Inquiry> list = helpService.selectInquiryList(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/inquiryListView";
	}
	
	
	// 공지사항 디테일뷰
	@RequestMapping("detailNotice.do")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		Notice n = helpService.selectNotice(nno);
		
		mv.addObject("n", n).setViewName("help/noticeDetailView");
		
		return mv;
		
	}
	
	// 문의사항 디테일뷰
	@RequestMapping("detailInquiry.do")
	public ModelAndView selectInquiry(int ino, ModelAndView mv) {
		
		Inquiry i = helpService.selectInquiry(ino);
		
		String content = i.getContent().replaceAll("\n", "<br>");
		i.setContent(content);
		
		mv.addObject("i", i).setViewName("help/inquiryDetailView");		
		
		return mv;		
	}
	
	// 문의사항 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "rlistAnswer.do", produces = "application/json; charset=utf-8")
	public String selectReplyList(int ino) {
		
		ArrayList<Answer> list = helpService.selectReplyList(ino);
		
		System.out.println(list);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	// 문의사항 댓글 작성
	@ResponseBody 
	@RequestMapping(value = "rinsertInquiry.do")
	public String insertReplyList(Answer a) {
		
		int result = helpService.insertReply(a);
		
		return String.valueOf(result);
	}
	
	// 문의사항 댓글 삭제
	@ResponseBody
	@RequestMapping(value="deleteReply.do")
	public String deleteReply(int answerNo) {
		
		int result = helpService.deleteReply(answerNo);
		
		return String.valueOf(result);
	}
	
	// 문의사항 댓글 수정
	@ResponseBody
	@RequestMapping(value="updateReply.do")
	public String updateReply(Answer a) {
		
		int result = helpService.updateReply(a);
		
		return String.valueOf(result);
	}
	
	// 문의사항 글쓰기 폼으로 이동
	@RequestMapping("enrollFormInquiry.do")
	public String enrollFormInquiry() {
		
		return "help/inquiryEnrollForm";
	}
	
	// 문의사항 글 작성
	@RequestMapping("insertInquiry.do")
	public String insertInquiry(Inquiry i) {
		System.out.println("카테고리 : " + i.getCategory() + "제목 : " + i.getTitle() + "유저넘버 : " + i.getUserNo() + "내용 :" + i.getContent());
		
		helpService.insertInquiry(i);
				
		return "redirect:inquiryList.do";
	}
	
	// 문의사항 글 수정 폼 이동
	@RequestMapping("updateFormInquiry.do")
	public ModelAndView updateFormInquiry(int ino, ModelAndView mv) {
		
		mv.addObject("i", helpService.selectInquiry(ino))
		.setViewName("help/inquiryUpdateForm");
		
		return mv;
	}
	
	// 문의사항 글 수정
	@RequestMapping("updateInquiry.do")
	public ModelAndView updateInquiry(Inquiry i, ModelAndView mv) {
		
		helpService.updateInquiry(i);
		System.out.println("문의사항 글번호 : " + i.getInquiryNo());
		mv.addObject("ino", Integer.parseInt(i.getInquiryNo())).setViewName("redirect:detailInquiry.do");
		return mv;
	}
	
	// 문의사항 글 삭제
	@RequestMapping("deleteInquiry.do")
	public String deleteInquiry(int ino) {
		
		helpService.deleteInquiry(ino);
		
		return "redirect:inquiryList.do";
	}
	
	
}
