package com.uni.spring.help.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	// 자주묻는질문 페이지 이동 - 카테고리 별
	@RequestMapping("faqCategory.do")
	public String faqCategory(int code, @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectFaqListCount(code);
		System.out.println(listCount);
				
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Faq> list = helpService.selectFaqList(pi, code); // 페이지 정보를 가지고 넘어가기
				
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
		
	// 공지사항 페이지 이동 - 카테고리 별
	@RequestMapping("noticeCategory.do")
	public String noticeCategory(int code, @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectNoticeListCount(code);
		System.out.println(listCount);
				
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Notice> list = helpService.selectNoticeList(pi, code); // 페이지 정보를 가지고 넘어가기
				
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
	
	// 문의사항 페이지 이동 - 카테고리 별
	@RequestMapping("inquiryCategory.do")
	public String inquiryCategory(int code, @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectInquiryListCount(code);
		System.out.println(listCount);
				
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Inquiry> list = helpService.selectInquiryList(pi, code); // 페이지 정보를 가지고 넘어가기
				
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
		
		String content = i.getContent().replaceAll("\n", "<br>"); // 줄바꿈
		
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
	
	// 관리자 - 자주묻는질문 페이지 이동	
	@RequestMapping("adminFaq.do")
	public String selectAdminFaqList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectAdminFaqListCount(); // 상태 Y,N 상관없이 다 구하기
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Faq> list = helpService.selectAdminFaqList(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/adminFaqListView";
	}
	
	// 관리자 - 자주묻는질문 디테일뷰
	@RequestMapping("adminFaqDetail.do")
	public ModelAndView selectAdminFaq(int fno, ModelAndView mv) {
		
		Faq f = helpService.selectAdminFaq(fno);
		
		String content = f.getAnswer().replaceAll("\n", "<br>"); // 줄바꿈
		
		f.setAnswer(content);
		
		mv.addObject("f", f).setViewName("help/adminFaqDetailView");		
		
		return mv;		
	}
	
	// 관리자 - 자주묻는질문 글작성폼으로 이동
	@RequestMapping("enrollFormAdminFaq.do")	
	public String enrollFormAdminFaq() {
		
		return "help/adminFaqEnrollForm";
	}
	
	// 관리자 - 자주묻는질문 글작성
	@RequestMapping("insertAdminFaq.do")
	public String inserAdminFaq(Faq f) {
				
		String content = f.getAnswer().replaceAll("\n", "<br>"); // 줄바꿈
		f.setAnswer(content);
		
		helpService.inserAdminFaq(f);
				
		return "redirect:adminFaq.do";
	}
	
	// 관리자 - 자주묻는질문 글 삭제
	@RequestMapping("deleteAdminFaq.do")
	public String deleteAdminFaq(int fno) {
		
		helpService.deleteAdminFaq(fno);
		
		return "redirect:adminFaq.do";
	}
	
	// 관리자 - 자주묻는질문 글 수정 폼 이동
	@RequestMapping("updateFormAdminFaq.do")
	public ModelAndView updateFormAdminFaq(int fno, ModelAndView mv) {
		
		Faq f = helpService.selectAdminFaq(fno);
		
		String content = f.getAnswer().replaceAll("<br>", "\n"); // 줄바꿈
		
		f.setAnswer(content);
		
		mv.addObject("f", f)
		.setViewName("help/adminFaqUpdateForm");
		
		return mv;
	}
	
	// 관리자 - 자주묻는질문 글 수정
	@RequestMapping("updateAdminFaq.do")	
	public String updateAdminFaq(Faq f, Model model) {
				
		helpService.updateAdminFaq(f);
		
		int fno = Integer.parseInt(f.getFaqNo());
		
		f = helpService.selectAdminFaq(fno);
		
		String content = f.getAnswer().replaceAll("\n", "<br>"); // 줄바꿈
		f.setAnswer(content);
		
		model.addAttribute("fno", fno);
		model.addAttribute("f",f);
				
		return "help/adminFaqDetailView";
	}
	
	// 관리자 - 공지사항 페이지 이동	
	@RequestMapping("adminNotice.do")
	public String selectAdminNoticeList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectAdminNoticeListCount(); // 상태 Y,N 상관없이 다 구하기
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 5); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Notice> list = helpService.selectAdminNoticeList(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/adminNoticeListView";
	}
	
	// 관리자 - 공지사항 디테일 뷰
	@RequestMapping("adminNoticeDetail.do")
	public ModelAndView selectAdminNotice(int nno, ModelAndView mv) {
		
		Notice n = helpService.selectAdminNotice(nno);
		
		String content = n.getContent().replaceAll("\n", "<br>"); // 줄바꿈
		
		n.setContent(content);
		
		mv.addObject("n", n).setViewName("help/adminNoticeDetailView");		
		
		return mv;		
	}
	
	// 관리자 - 공지사항 글작성폼으로 이동
	@RequestMapping("enrollFormAdminNotice.do")
	public String enrollFormAdminNotice() {
		
		return "help/adminNoticeEnrollForm";
	}
	
	// 관리자 - 공지사항 글작성
	@RequestMapping("insertAdminNotice.do")
	public String insertAdminNotice(Notice n) {
		
		String content = n.getContent().replaceAll("\n", "<br>"); // 줄바꿈
		n.setContent(content);
		
		helpService.insertAdminNotice(n);
				
		return "redirect:adminNotice.do";
	}
	
	// 관리자 - 공지사항 수정 폼 이동
	@RequestMapping("updateFormAdminNotice")
	public ModelAndView updateFormAdminNotice(int nno, ModelAndView mv) {
		
		Notice n = helpService.selectAdminNotice(nno);
		
		String content = n.getContent().replaceAll("<br>", "\n"); // 줄바꿈
		
		n.setContent(content);
		
		mv.addObject("n", n)
		.setViewName("help/adminNoticeUpdateForm");
		
		return mv;
	}
	
	// 관리자 - 공지사항 글수정
	@RequestMapping("updateAdminNotice.do")	
	public String updateAdminNotice(Notice n, Model model) {
				
		helpService.updateAdminNotice(n);
		
		int nno = Integer.parseInt(n.getNoticeNo());
		
		n = helpService.selectAdminNotice(nno);
		
		String content = n.getContent().replaceAll("\n", "<br>"); // 줄바꿈
		n.setContent(content);
		
		model.addAttribute("nno", nno);
		model.addAttribute("n", n);
				
		return "help/adminNoticeDetailView";
	}
	
	// 관리자 - 공지사항 글삭제
	@RequestMapping("deleteAdminNotice.do")
	public String deleteAdminNotice(int nno) {
		
		helpService.deleteAdminNotice(nno);
		
		return "redirect:adminNotice.do";
	}
	
	// 관리자 - 문의사항 관리 리스트 뷰 
	@RequestMapping("adminInquiry.do")
	public String selectAdminInquiryList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectAdminInquiryListCount(); // 상태 Y,N 상관없이 다 구하기
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 10); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Inquiry> list = helpService.selectAdminInquiryList(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/adminInquiryListView";
	}
	
	// 관리자 - 문의사항 관리 리스트 뷰 - 답변 전 
	@RequestMapping("adminInquiry2.do")
	public String selectAdminInquiryList2(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectAdminInquiryListCount2(); 
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 10); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Inquiry> list = helpService.selectAdminInquiryList2(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/adminInquiryListView";
	}
	
	// 관리자 - 문의사항 관리 리스트 뷰 - 답변완료
	@RequestMapping("adminInquiry3.do")
	public String selectAdminInquiryList3(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = helpService.selectAdminInquiryListCount3(); 
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 10); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Inquiry> list = helpService.selectAdminInquiryList3(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "help/adminInquiryListView";
	}
		
	// 관리자 - 문의사항 디테일 뷰
	@RequestMapping("adminInquiryDetail.do")
	public ModelAndView selectAdminInquiry(int ino, ModelAndView mv) {
						
		Inquiry i = helpService.selectAdminInquiry(ino);
		
		i.setContent(i.getContent().replaceAll("\n", "<br>"));
		
		mv.addObject("i", i).setViewName("help/adminInquiryDetailView");		
		
		return mv;		
	}
	
	// 관리자 - 문의사항 미리보기
	@RequestMapping("adminInquiryPreview.do")
	public ModelAndView adminInquiryPreview(int ino, ModelAndView mv) {
						
		Inquiry i = helpService.selectAdminInquiry(ino);
		
		i.setContent(i.getContent().replaceAll("\n", "<br>"));
		
		mv.addObject("i", i).setViewName("help/adminInquiryPreview");		
		
		return mv;		
	}
	
	// 관리자 - 문의사항 답변쓰기
	@RequestMapping("adminInquiryAnswer.do")
	public ModelAndView adminInquiryAnswer(int ino, ModelAndView mv) {
						
		Inquiry i = helpService.selectAdminInquiry(ino);
		
		i.setContent(i.getContent().replaceAll("\n", "<br>"));
		
		mv.addObject("i", i).setViewName("help/adminInquiryAnswer");		
		
		return mv;		
	}
	
	
}
